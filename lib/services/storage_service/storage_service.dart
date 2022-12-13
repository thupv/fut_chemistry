import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:fut_chemistry/models/app_config.dart';

import 'package:fut_chemistry/models/club.dart';
import 'package:fut_chemistry/models/player.dart';
import 'package:fut_chemistry/models/league.dart';
import 'package:fut_chemistry/models/nation.dart';
import 'package:fut_chemistry/models/metadata.dart';
import 'package:http/http.dart' as http;

class StorageService {
  Future<List<Player>> getPlayers() async {
    return [];
  }

  Future<Metadata> getMetadata() async {
    AppConfig appConfig = await loadAppConfigFromAPI();
    List<League> leagues = await loadLeagueFromJson();
    List<Club> clubs = await loadClubFromJson();
    List<Nation> nations = await loadNationFromJson();
    List<Player> players = await loadPlayerFromCSV(appConfig);
    return Metadata(leagues: leagues, clubs: clubs, nations: nations, players: players);
  }

  Future<AppConfig> loadAppConfigFromAPI() async {
    final response = await http
        .get(Uri.parse('http://cdn.jsdelivr.net/gh/futfc/fut_card@latest/config.json'));

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
    String path = "assets/data/db.csv";
    String content = await rootBundle.loadString("assets/data/db.csv");
    List<List<dynamic>> data =
    const CsvToListConverter(eol: '\n').convert(content);

    List<Player> players = data.map((playerData) {
      return Player.fromCSV(playerData, appConfig);
    }).toList();
    return players;
  }
}