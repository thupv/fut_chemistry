import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:fut_chemistry/models/app_config.dart';

import 'package:fut_chemistry/models/club.dart';
import 'package:fut_chemistry/models/player.dart';
import 'package:fut_chemistry/models/league.dart';
import 'package:fut_chemistry/models/nation.dart';
import 'package:fut_chemistry/models/metadata.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../models/hive/team.dart';

class StorageService {
  BoxCollection? hiveCollection;
  final Map<String, Player> _cachedPlayer = {};

  init() async {
    hiveCollection = await BoxCollection.open(
        'FutChemistryDB', {'savedTeams', 'autoSavedTeams'},
        path: './');
  }

  Future<List<Player>> getPlayers() async {
    return [];
  }

  Player? getPlayerById(String playerId) {
    return _cachedPlayer[playerId];
  }

  Future<Metadata> getMetadata() async {
    AppConfig appConfig = await loadAppConfigFromAPI();
    List<League> leagues = await loadLeagueFromJson();
    List<Club> clubs = await loadClubFromJson();
    List<Nation> nations = await loadNationFromJson();
    List<Player> players = await loadPlayerFromCSV(appConfig);
    for (var player in players) {
      _cachedPlayer[player.indexKey] = player;
    }
    return Metadata(
        leagues: leagues, clubs: clubs, nations: nations, players: players);
  }

  Future<AppConfig> loadAppConfigFromAPI() async {
    final response =
        await http.get(Uri.parse('https://futfc.github.io/fut_card/config.json'));

    if (response.statusCode == 200) {
      return AppConfig.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load app config');
    }
  }

  Future<List<League>> loadLeagueFromJson() async {
    String path = "assets/data/leagues.json";
    String content = await rootBundle.loadString(path);
    List json = jsonDecode(content);

    List<League> list = json.map((e) => League.fromJson(e)).toList();
    return list;
  }

  Future<List<Club>> loadClubFromJson() async {
    String path = "assets/data/clubs.json";
    String content = await rootBundle.loadString(path);
    List json = jsonDecode(content);

    List<Club> list = json.map((e) => Club.fromJson(e)).toList();
    return list;
  }

  Future<List<Nation>> loadNationFromJson() async {
    String path = "assets/data/nations.json";
    String content = await rootBundle.loadString(path);
    List json = jsonDecode(content);

    List<Nation> list = json.map((e) => Nation.fromJson(e)).toList();
    return list;
  }

  Future<List<Player>> loadPlayerFromCSV(AppConfig appConfig) async {
    // String path = "assets/data/db_12_20.csv";
    // String content = await rootBundle.loadString(path);
    Uri url = Uri.parse(appConfig.dbUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // If the request was successful, parse the CSV data
      List<List<dynamic>> data =
          const CsvToListConverter(eol: '\n').convert(response.body);

      List<Player> players = data.map((playerData) {
        return Player.fromCSV(playerData, appConfig);
      }).toList();
      return players;
    } else {
      // If the request was not successful, throw an error
      throw Exception('Failed to load CSV data from URL');
    }
  }

  Future<bool> saveTeam(Team team) async {
    try {
      CollectionBox<Team> box =
          await hiveCollection!.openBox<Team>('savedTeams');
      await box.put(team.name, team);
      return true;
    } catch (e) {
      print("Failed to save team: $e");
      return false;
    }
  }

  Future<List<Team?>> getAllSquad() async {
    try {
      CollectionBox<Team> box =
          await hiveCollection!.openBox<Team>('savedTeams');
      final allTeamKeys = await box.getAllKeys();
      final teams = await box.getAll(allTeamKeys);
      return teams;
    } catch (e) {
      return [];
    }
  }

  Future<bool> autoSaveTeam(List<Player> players) async {
    try {
      CollectionBox<List> box =
          await hiveCollection!.openBox<List>('autoSavedTeams');
      final playerIds = players.map((e) => e.indexKey).toList();
      await box.put("autoSaved", playerIds);
      return true;
    } catch (e) {
      print("Failed to auto save team: $e");
      return false;
    }
  }

  Future<List?> getAutoSavedTeam() async {
    try {
      CollectionBox<List> box =
          await hiveCollection!.openBox<List>('autoSavedTeams');
      final team = await box.get("autoSaved");
      return team;
    } catch (e) {
      print("Failed to get auto saved team: $e");
      return null;
    }
  }
}
