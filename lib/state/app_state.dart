import 'package:flutter/foundation.dart';
import 'package:fut_chemistry/state/notifiers/selected_cards_notifiers.dart';
import 'package:fut_chemistry/models/player.dart';
import 'package:fut_chemistry/core/di.dart';
import 'package:fut_chemistry/services/storage_service/storage_service.dart';
import 'dart:isolate';

import '../models/metadata.dart';
import '../models/optimizer_result.dart';
import 'package:fut_chemistry/constants/base_url.dart';
import 'optimizer.dart';

class AppState {
  final selectedCardsNotifier = SelectedCardsNotifier();
  final selectedPlayerNotifier = ValueNotifier<Map<String, String>>({});
  final selectedNationNotifier = ValueNotifier<int?>(null);
  final selectedLeagueNotifier = ValueNotifier<int?>(null);
  final selectedClubNotifier = ValueNotifier<int?>(null);
  final selectedRarityNotifier = ValueNotifier<String?>(null);
  final selectedPositionNotifier = ValueNotifier<String?>(null);
  final selectedClubLeagueNotifier = ValueNotifier<int?>(null);

  final selectedManagerNationNotifier = ValueNotifier<int?>(null);
  final selectedManagerLeagueNotifier = ValueNotifier<int?>(null);



  final optimizerResultNotifier = ValueNotifier<List<OptimizerResult>>([]);
  List<OptimizerResult> _tempOptimizerResult = [];

  final metadataNotifier = ValueNotifier<Metadata?>(null);
  final isLoadingNotifier = ValueNotifier(true);

  final _storageService = getIt<StorageService>();
  late ReceivePort _receivePort;
  late IsolatePool _isolatePool;
  late Stopwatch _stopwatch;

  void init() async {
    if (kDebugMode) {
      print("AppState: init");
    }
    _receivePort = ReceivePort();
    _isolatePool = IsolatePool(40, _receivePort);
    _stopwatch = Stopwatch();
    _storageService.init();
    metadataNotifier.value = await _storageService.getMetadata();
    selectedCardsNotifier.initialize();
    isLoadingNotifier.value = false;
    // _receivePort.listen((data) async {
    //   if (data is IsolateResponse) {
    //     _tempOptimizerResult.add(data.result);
    //     if (_tempOptimizerResult.length ==
    //         metadataNotifier.value!.formations.length) {
    //       _stopwatch.stop();
    //       print(
    //           "AppState: Optimizer finished in ${_stopwatch.elapsedMilliseconds} ms");
    //       _tempOptimizerResult
    //           .sort((a, b) => b.maxTeamChemistry.compareTo(a.maxTeamChemistry));
    //       optimizerResultNotifier.value = _tempOptimizerResult;
    //       _tempOptimizerResult = [];
    //     }
    //   }
    // });
  }

  void optimize() {
    if(Uri.base.host != HOST_URL) {
      return;
    }
    optimizerResultNotifier.value = [];
    // _isolatePool.createOptimizeIsolate();
    for(int i = 0; i < metadataNotifier.value!.formations.length; i++) {
      final result = calculateMaxTeamChemistry(selectedCardsNotifier.value, metadataNotifier.value!.formations[i], selectedManagerLeagueNotifier.value, selectedManagerNationNotifier.value);
      _tempOptimizerResult.add(result);
      if (_tempOptimizerResult.length ==
          metadataNotifier.value!.formations.length) {
        _stopwatch.stop();
        print(
            "AppState: Optimizer finished in ${_stopwatch.elapsedMilliseconds} ms");
        _tempOptimizerResult
            .sort((a, b) => b.maxTeamChemistry.compareTo(a.maxTeamChemistry));
        optimizerResultNotifier.value = _tempOptimizerResult;
        _tempOptimizerResult = [];
      }
    }
  }

  void dispose() {
    if (kDebugMode) {
      print("AppState: dispose");
    }
  }

  List<Player> getFilteredPlayers() {
    if (metadataNotifier.value == null) {
      return [];
    }
    final players = metadataNotifier.value!.players;
    final selectedCards = selectedCardsNotifier.value;
    final selectedPlayer = selectedPlayerNotifier.value;
    final selectedNation = selectedNationNotifier.value;
    final selectedLeague = selectedLeagueNotifier.value;
    final selectedClub = selectedClubNotifier.value;
    final selectedRarity = selectedRarityNotifier.value;
    final selectedPosition = selectedPositionNotifier.value;
    return players.where((player) {
      // if (selectedCards.isNotEmpty && !selectedCards.contains(player.id)) {
      //   return false;
      // }
      if (selectedPlayer['playerName'] != null &&
          player.playerName != selectedPlayer['playerName']) {
        return false;
      }
      if (selectedNation != null &&
          player.nationId.toString() != selectedNation.toString()) {
        return false;
      }
      if (selectedLeague != null &&
          player.leagueId.toString() != selectedLeague.toString()) {
        return false;
      }
      if (selectedClub != null &&
          player.clubId.toString() != selectedClub.toString()) {
        return false;
      }
      // if (selectedRarity != null && player.rarity != selectedRarity) {
      //   return false;
      // }
      if (selectedPosition != null &&
          !player.position.contains(selectedPosition)) {
        return false;
      }
      return true;
    }).toList();
  }
}
