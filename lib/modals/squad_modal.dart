import 'package:flutter/material.dart';

import 'package:fut_chemistry/constants/assets_images.dart';
import 'package:fut_chemistry/models/optimizer_result.dart';
import '../core/helpers/device_type.dart';

import '../models/box.dart';
import '../models/position.dart';
import '../models/player.dart';
import '../models/formation.dart';
import '../shared/small_card.dart';

class SquadModal extends StatefulWidget {
  final OptimizerResult optimizerResult;

  const SquadModal({Key? key, required this.optimizerResult}) : super(key: key);

  @override
  State<SquadModal> createState() => _SquadModalState();
}

class _SquadModalState extends State<SquadModal> {
  double _height = 0.0;
  double _width = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  List<Widget> _buildFormations({
    required Box cardWrapperBox,
    required Box cardBox,
    required BoxConstraints boxConstraints,
  }) {
    List<Player> resultPlayers = widget.optimizerResult.resultPlayers;
    List<int> resultPlayerChems = widget.optimizerResult.resultPlayerChems;
    Formation formation = widget.optimizerResult.formation;
    List<Widget> players = [];
    int index = 0;
    while (index < 11) {
      final cardPosition = generatePositionCardWrapper(
        formation.offsets[index],
        boxConstraints,
        cardWrapperBox,
      );
      // var card = cards[index];
      players.add(
        _buildPlayerPosition(
          cardPosition,
          cardWrapperBox,
          boxConstraints,
          index,
          cardBox,
          resultPlayers[index],
          resultPlayerChems[index],
          formation.positions[index],
        ),
      );
      index += 1;
    }
    return players;
  }

  Position generatePositionCardWrapper(
    List<double> offset,
    BoxConstraints constraints,
    Box box,
  ) {
    var position = Position();
    position.top = constraints.maxHeight * offset[1] - box.height / 2;
    position.left = constraints.maxWidth * offset[0] - box.width / 2;
    return position;
  }

  Positioned _buildPlayerPosition(
    Position cardWrapperPosition,
    Box cardWrapperBox,
    BoxConstraints constraints,
    int index,
    Box cardBox,
    Player? player,
    int playerChem,
    String pos,
  ) {
    return Positioned(
      top: cardWrapperPosition.top,
      left: cardWrapperPosition.left,
      width: cardWrapperBox.width,
      height: cardWrapperBox.height,
      child: SizedBox(
        width: cardBox.width,
        height: cardBox.height,
        // color: Colors.red,
        child: player != null
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: cardBox.height / 6,
                    child: Container(
                      width: cardBox.width,
                      height: cardBox.height / 4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/pos_base.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      child: Center(
                        child: Text(pos,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            )),
                      ),
                    ),
                  ),
                  SmallCard(
                    player: player,
                    // position: widget.optimizerResult.formation.position[index],
                  ),
                  Positioned(
                    bottom: cardBox.height / 4,
                    right: cardBox.width / 2,
                    child: Container(
                      width: cardBox.width,
                      height: cardBox.height / 5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/chem-${playerChem.toString()}.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: cardBox.height / 4,
                    left: cardBox.width / 2,
                    child: playerChem > -1 && player.firstPosition != pos
                        ? Container(
                            width: cardBox.width,
                            height: cardBox.height / 5,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/pos_change.png"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              )
            : null,
      ),
    );
  }

  Positioned _buildManagerPosition(
    Box cardWrapperBox,
    BoxConstraints constraints,
    Box cardBox,
  ) {
    final cardWrapperPosition = generatePositionCardWrapper(
      [0.1, 0.9],
      constraints,
      cardWrapperBox,
    );
    return Positioned(
      top: cardWrapperPosition.top,
      left: cardWrapperPosition.left,
      width: cardWrapperBox.width,
      height: cardWrapperBox.height,
      child: SizedBox(
        width: cardBox.width,
        height: cardBox.height,
        // color: Colors.red,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: cardBox.height / 6,
              child: Container(
                width: cardBox.width,
                height: cardBox.height / 4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/pos_base.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: const Center(
                  child: Text("Manager",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: cardBox.height / 6,
              child: Container(
                width: cardBox.width,
                height: cardBox.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/manager_insquad.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/leagues/${widget.optimizerResult.leagueBonus}.png',
                      width: cardBox.height / 4,
                      height: cardBox.height / 4,
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      'assets/img/nations/f_${widget.optimizerResult.nationBonus}.png',
                      width: cardBox.height / 4,
                      height: cardBox.height / 4,
                      fit: BoxFit.contain,
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = DeviceDetector.getDeviceType(context);
    final scaling = deviceType == DeviceType.phone ? 0.8 : 0.5;

    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: LayoutBuilder(builder: (_, BoxConstraints constraints) {
          final cardWrapperBox = Box(
            width: constraints.maxWidth * 7 * 0.035 * scaling,
            height: constraints.maxWidth * 11 * 0.035 * scaling,
          );
          final cardBox = Box(
            width: constraints.maxWidth * 7 * 0.03 * scaling,
            height: constraints.maxWidth * 11 * 0.03 * scaling,
          );
          final formation = _buildFormations(
            cardBox: cardBox,
            boxConstraints: constraints,
            cardWrapperBox: cardWrapperBox,
            // cards: widget.optimizerResult.players,
          );
          final manager = widget.optimizerResult.nationBonus != null ?_buildManagerPosition(
              cardWrapperBox, constraints, cardWrapperBox) : Container();
          return Stack(
            fit: StackFit.expand,
            children: [
              _buildBackdropImage(),
              ...formation,
              manager
            ],
          );
        }),
      ),
    );
  }

  ColorFiltered _buildBackdropImage() {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.black45,
        BlendMode.darken,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(
          AssetsImages.fieldPositionUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

// _buildPositionCircle({required String position}) {
//   return GestureDetector(
//     onTap: () => Navigator.pop(context),
//     child: PhysicalModel(
//       elevation: 15.0,
//       color: Colors.black26,
//       shadowColor: Colors.white.withOpacity(0.15),
//       borderRadius: BorderRadius.circular(30.0),
//       shape: BoxShape.circle,
//       child: Container(
//         width: 60,
//         height: 60,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30.0),
//           color: Colors.black54,
//         ),
//         child: Text(
//           widget.optimizerResult.resultPlayers[position]?.playerName ??
//               position,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ),
//   );
// }
}
