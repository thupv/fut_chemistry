import 'package:flutter/material.dart';
import 'package:fut_chemistry/core/extensions/color.dart';
import 'package:fut_chemistry/models/player.dart';

class SmallCard extends StatelessWidget {
  final Player player;

  const SmallCard({super.key, required this.player});

  List<Widget> renderPlayerCard(BoxConstraints constraints) {
    Color color = player.textColor.toColor();
    return <Widget>[
      Image.network(player.smallRarity),
      Positioned(
        left: constraints.maxWidth * 0.3,
        top: constraints.maxWidth * 0.25,
        width: constraints.maxWidth * 0.6,
        child: Image.network(player.playerImg),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: constraints.maxWidth * 0.15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: constraints.maxWidth * 0.22),
                    SizedBox(
                        height: constraints.maxWidth * 0.18,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            player.rating.toString().toUpperCase(),
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        )),
                    SizedBox(
                        height: constraints.maxWidth * 0.12,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            player.firstPosition,
                            style: TextStyle(
                              color: color,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: constraints.maxWidth * 0.03,
                    ),
                    Image.network(
                      player.nation,
                      width: constraints.maxWidth * 0.15,
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.03,
                    ),
                    Image.network(
                      player.club,
                      width: constraints.maxWidth * 0.15,
                    ),
                    SizedBox(height: constraints.maxWidth * 0.05)
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: constraints.maxWidth * 0.1,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(player.playerName,
                  style: TextStyle(
                    color: color,
                    decoration: TextDecoration.none,
                  )),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: [
            ...renderPlayerCard(constraints),
          ],
        );
      },
    );
  }
}
