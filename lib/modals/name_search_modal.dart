import 'package:flutter/material.dart';
import 'package:fut_chemistry/core/extensions/latin_extended.dart';

import '../analytics/event.dart';
import '../core/di.dart';
import '../models/player.dart';
import '../state/app_state.dart';

class NameSearchModal extends StatefulWidget {
  const NameSearchModal({super.key});

  @override
  State<NameSearchModal> createState() => _NameSearchModalState();
}

class _NameSearchModalState extends State<NameSearchModal> {
  late ValueNotifier<List<Player>> _playersNotifier;
  final appState = getIt<FutAppState>();

  @override
  void initState() {
    super.initState();
    _playersNotifier = ValueNotifier([]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          // color: Colors.black87,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Please input player name ...",
                  ),
                  onChanged: (content) {
                    logFilter("name", content.toLowerCase().trim());
                    _playersNotifier.value = appState.metadataNotifier.value!.players
                        .where((element) => element.playerName
                        .toLowerCase()
                        .removeLatinExtended()
                        .trim()
                        .contains(content.toLowerCase().trim()))
                        .toList();
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _playersNotifier,
                builder: (context, List<Player> cards, _) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            final Map<String, String> playerData = {
                              "playerName": cards[index].playerName,
                              "playerImg": cards[index].playerImg,
                            };
                            Navigator.of(context).pop(playerData);
                          },
                          child: SizedBox(
                            height: 50,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                      child: Text(
                                          cards[index].playerName)),
                                  Center(
                                      child: Text(cards[index]
                                          .rating
                                          .toString())),
                                ]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
