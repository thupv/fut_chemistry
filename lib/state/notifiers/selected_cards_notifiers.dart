import 'package:flutter/cupertino.dart';
import 'package:fut_chemistry/analytics/event.dart';
import 'package:fut_chemistry/models/player.dart';
import '../../core/di.dart';
import '../../services/storage_service/storage_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../analytics/event.dart';

class SelectedCardsNotifier extends ValueNotifier<List<Player>> {
  final _storageService = getIt<StorageService>();

  SelectedCardsNotifier() : super([]);

  initialize() async {
    final team = await _storageService.getAutoSavedTeam();

    if (team == null) {
      return;
    }
    final List<Player> players = [];
    for (String id in team) {
      final player = _storageService.getPlayerById(id);
      if (player != null) {
        players.add(player);
      }
    }
    value = players;
  }

  clear() {
    value = [];
    _storageService.autoSaveTeam([]);
  }

  removeCard(Player card) {
    value = List.from(value)..removeWhere((item) => item == card);
    _storageService.autoSaveTeam(value);
  }

  addCard(Player card) {
    value = List.from(value)..add(card);
    _storageService.autoSaveTeam(value);
  }

  importWebApp(String url, ValueSetter<bool> onSuccess) async {
    try {
      final uri = Uri.parse(url);
      final showoffId = uri.queryParameters['showoffId'];
      final squadId = showoffId?.split(':')[0];
      if (squadId == null) {
        onSuccess(false);
        return;
      }
      logImportSquad(squadId);
      String apiUrl = "https://api.allorigins.win/get?url=https://utas.mob.v1.fut.ea.com/ut/showofflink/$squadId";

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<Player> players = [];
        final json = jsonDecode(response.body);
        final contents = jsonDecode(json['contents']);
        final jsonPlayers = contents['data']['squad'][0]['players'];
        // final squad = jsonDecode(players['squad'])[0];
        for (int i = 0; i < 11; i++) {
          final player = jsonPlayers[i];
          final id =
              "${player['itemData']['assetId']}_${player['itemData']['rareflag']}";
          final playerObj = _storageService.getPlayerById(id);
          if (playerObj != null) {
            players.add(playerObj);
          }
        }
        value = players;

        // print(players);
        onSuccess.call(true);
        return;
      } else {
        onSuccess.call(false);
        throw Exception('Failed to import web app url');
      }
    } catch (e) {
      print("Failed to import web app $e");
      onSuccess.call(false);
      return;
    }
  }
}
