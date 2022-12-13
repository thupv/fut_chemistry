import 'package:fut_chemistry/models/player.dart';

import 'formation.dart';

class OptimizerResult {
  final int maxTeamChemistry;
  final Formation formation;
  final List<Player> resultPlayers;
  final List<int> resultPlayerChems;
  int positionChanges = 0;
  int offChem = 0;

  OptimizerResult(this.maxTeamChemistry, this.formation, this.resultPlayers, this.resultPlayerChems) {
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
