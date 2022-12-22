import 'package:fut_chemistry/models/player.dart';

import 'formation.dart';

class OptimizerResult {
  final int maxTeamChemistry;
  final Formation formation;
  final List<Player> resultPlayers;
  final List<int> resultPlayerChems;
  final int? nationBonus;
  final int? leagueBonus;
  int positionChanges = 0;
  int offChem = 0;

  OptimizerResult(this.maxTeamChemistry, this.formation, this.resultPlayers, this.resultPlayerChems, this.leagueBonus, this.nationBonus) {
    formation.positions.asMap().forEach((index, pos) {
      Player player = resultPlayers[index];
      if(resultPlayerChems[index] > -1) {
        if (player.firstPosition != pos) {
          positionChanges++;
        }
      }

    });

    offChem = 33 - maxTeamChemistry;
  }
}
