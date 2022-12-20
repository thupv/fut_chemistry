import 'dart:isolate';

import 'package:fut_chemistry/core/extensions/map_indexed.dart';
import 'package:fut_chemistry/models/formation.dart';
import 'package:fut_chemistry/models/player.dart';
import 'package:fut_chemistry/models/optimizer_result.dart';
import 'package:fut_chemistry/state/app_state.dart';

import '../core/di.dart';

enum TaskStatus { waiting, running, finished }

class IsolateArguments {
  final int taskId;
  final SendPort sendPort;
  final List<Player> players;
  final Formation formation;

  IsolateArguments(this.taskId, this.sendPort, this.players, this.formation);
}

class IsolateResponse {
  final int taskId;
  final OptimizerResult result;
  final Formation formation;

  IsolateResponse(this.taskId, this.result, this.formation);

  String printName() {
    return "(${formation.name},${result.maxTeamChemistry})";
  }
}

void entryPoint(IsolateArguments arguments) async {
  final result =
      calculateMaxTeamChemistry(arguments.players, arguments.formation);
  arguments.sendPort
      .send(IsolateResponse(arguments.taskId, result, arguments.formation));
}

Iterable<List<int>> combinations(
  List<List<int>> lists, [
  int index = 0,
  List<int>? prefix,
]) sync* {
  prefix ??= <int>[];

  if (lists.length == index) {
    yield prefix.toList();
  } else {
    for (final value in lists[index]) {
      if(prefix.contains(value)) {
        yield* combinations(lists, index + 1, prefix..add(-1));
      } else {
        yield* combinations(lists, index + 1, prefix..add(value));
      }
      prefix.removeLast();
    }
  }
}

OptimizerResult calculateMaxTeamChemistry(
    List<Player> players, Formation formation) {
  int maxChemistry = -1;
  List<Player> resultPlayers = [];
  Map<String, int> playerChemMap = {};
  List<int> resultPlayerChems = [];

  Map<String, int> formationPosMapCounter = {};

  for (final pos in formation.positions) {
    formationPosMapCounter[pos] = formationPosMapCounter[pos] == null
        ? 1
        : formationPosMapCounter[pos]! + 1;
  }

  Map<String, List<int>> positionMap = {};
  for (var i = 0; i < players.length; i++) {
    var positions = players[i].position.split(',');
    for (final pos in positions) {
      if (positionMap.containsKey(pos)) {
        positionMap[pos]!.add(i);
      } else {
        positionMap[pos] = [i];
      }
    }
  }

  var filteredPos = List<String>.from(formation.positions);

  List<List<int>>? updatedPlayerIdxs = [];

  for (final pos in filteredPos) {
    if (positionMap[pos] == null || positionMap[pos]!.isEmpty) {
      updatedPlayerIdxs.add([-1]);
      continue;
    }

    if (positionMap[pos]!.length <= formationPosMapCounter[pos]!) {
      updatedPlayerIdxs.add([positionMap[pos]![0]]);
      positionMap[pos]!.removeAt(0);
      formationPosMapCounter[pos] = formationPosMapCounter[pos]! - 1;
      continue;
    }
    if (positionMap[pos]!.length > formationPosMapCounter[pos]!) {
      updatedPlayerIdxs.add(positionMap[pos]!);

      continue;
    }
  }
  var combs = combinations(updatedPlayerIdxs);
  for (final comb in combs) {
    Map<int, int> nationChemMap = {};
    Map<int, int> leagueChemMap = {};
    Map<int, int> clubChemMap = {};
    Map<int, bool> existPlayer = {};
    List<int> zeroChemIdxs = [];

    int teamChemistry = 0;
    bool isValidComb = true;
    for (final idx in comb) {
      if (idx == -1) continue;
      Player player = players[idx];
      if (existPlayer[idx] == true) {
        isValidComb = false;
        break;
      }
      existPlayer[idx] = true;
      int nationId = int.parse(player.nationId);
      int leagueId = int.parse(player.leagueId);
      int clubId = int.parse(player.clubId);
      if (clubId == 112658) {
        nationChemMap[nationId] =
            nationChemMap[nationId] != null ? nationChemMap[nationId]! + 2 : 2;
        continue;
      }

      if (clubId == 999016) {
        nationChemMap[nationId] =
            nationChemMap[nationId] != null ? nationChemMap[nationId]! + 1 : 1;
        leagueChemMap[leagueId] =
            leagueChemMap[leagueId] != null ? leagueChemMap[leagueId]! + 2 : 2;
        continue;
      }
      nationChemMap[nationId] =
          nationChemMap[nationId] != null ? nationChemMap[nationId]! + 1 : 1;
      leagueChemMap[leagueId] =
          leagueChemMap[leagueId] != null ? leagueChemMap[leagueId]! + 1 : 1;
      clubChemMap[clubId] =
          clubChemMap[clubId] != null ? clubChemMap[clubId]! + 1 : 1;
    }

    if (isValidComb == false) {
      continue;
    }

    for (int i = 0; i < 11; i++) {
      if (existPlayer[i] == null) {
        zeroChemIdxs.add(i);
      }
    }
    playerChemMap.clear();
    for (final idx in comb) {
      if (idx == -1) continue;
      Player player = players[idx];
      int nationId = int.parse(player.nationId);
      int leagueId = int.parse(player.leagueId);
      int clubId = int.parse(player.clubId);

      int playerChem = 0;

      if (clubId > 100000) {
        playerChem += 3;
      }
      if (nationChemMap[nationId] != null) {
        if (nationChemMap[nationId]! >= 8) {
          playerChem += 3;
        } else if (nationChemMap[nationId]! >= 5) {
          playerChem += 2;
        } else if (nationChemMap[nationId]! >= 2) {
          playerChem += 1;
        }
      }

      if (leagueChemMap[leagueId] != null) {
        if (leagueChemMap[leagueId]! >= 8) {
          playerChem += 3;
        } else if (leagueChemMap[leagueId]! >= 5) {
          playerChem += 2;
        } else if (leagueChemMap[leagueId]! >= 3) {
          playerChem += 1;
        }
      }

      if (clubChemMap[clubId] != null) {
        if (clubChemMap[clubId]! >= 8) {
          playerChem += 3;
        } else if (clubChemMap[clubId]! >= 4) {
          playerChem += 2;
        } else if (clubChemMap[clubId]! >= 2) {
          playerChem += 1;
        }
      }

      if (playerChem > 3) {
        playerChem = 3;
      }
      playerChemMap[player.playerId] = playerChem;
      teamChemistry += playerChem;
    }

    if (teamChemistry > maxChemistry) {
      resultPlayers.clear();
      resultPlayerChems.clear();
      // for(final pos in formation.positions) {
      //   if(playerPosToIdxMap.containsKey(pos)) {
      //     resultPlayerss[pos] = players[comb[playerPosToIdxMap[pos]!]];
      //   }
      // }
      int zeroChemCounter = 0;

      for (final idx in comb) {
        if (idx > -1) {
          resultPlayerChems.add(playerChemMap[players[idx].playerId]!);
          resultPlayers.add(players[idx]);
        } else {
          resultPlayers.add(players[zeroChemIdxs[zeroChemCounter]]);
          resultPlayerChems.add(-1);
          zeroChemCounter++;
        }
      }
      maxChemistry = teamChemistry;
    }
  }
  if (maxChemistry == -1) {
    return OptimizerResult(0, formation, players,
        List<int>.generate(11, (_) => -1, growable: false));
  }
  return OptimizerResult(
      maxChemistry, formation, resultPlayers, resultPlayerChems);
}

class IsolateTask {
  late Isolate isolate;
  late SendPort sendPort;
  late Formation formation;
  final List<Player> players;
  final int id;
  TaskStatus status = TaskStatus.waiting;

  IsolateTask(this.sendPort, this.id, this.players, this.formation) {
    spawnIsolate();
  }

  spawnIsolate() async {
    status = TaskStatus.running;
    await Isolate.spawn<IsolateArguments>(
        entryPoint, IsolateArguments(id, sendPort, players, formation));
  }
}

class IsolatePool {
  late AppState appState;
  int numberOfIsolate = 40;
  List<IsolateTask> tasks = [];
  final ReceivePort _receivePort;

  IsolatePool(this.numberOfIsolate, this._receivePort) {
    appState = getIt<AppState>();
  }

  createOptimizeIsolate() {
    List<Formation> formations =
        appState.metadataNotifier.value?.formations ?? [];
    List<Player> cards = appState.selectedCardsNotifier.value;
    // IsolateTask(_receivePort.sendPort, 5, cards, formations[5]);
    for (int i = 0; i < formations.length; i++) {
      IsolateTask(_receivePort.sendPort, i, cards, formations[i]);
    }
  }
}
