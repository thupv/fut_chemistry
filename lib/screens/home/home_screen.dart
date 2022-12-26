import 'package:flutter/material.dart';

import 'package:fut_chemistry/core/di.dart';
import 'package:fut_chemistry/modals/help_modal.dart';
import 'package:fut_chemistry/modals/manager_nation_modal.dart';
import 'package:fut_chemistry/modals/webapp_import_modal.dart';
import 'package:fut_chemistry/screens/result/optimizer_result.dart';
import 'package:fut_chemistry/state/app_state.dart';
import 'package:fut_chemistry/core/mixins/dialog_mixins.dart';
import 'package:fut_chemistry/models/player.dart';
import 'package:fut_chemistry/shared/small_card.dart';
import 'package:fut_chemistry/core/extensions/multi_value_listenable_builder.dart';
import 'package:fut_chemistry/modals/name_search_modal.dart';
import 'package:fut_chemistry/modals/nation_modal.dart';
import 'package:fut_chemistry/modals/league_modal.dart';
import 'package:fut_chemistry/modals/club_modal.dart';
import 'package:fut_chemistry/modals/card_rarity_modal.dart';
import 'package:fut_chemistry/modals/player_position.dart';
import '../../core/helpers/device_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with CommonDialogMixin {
  final appState = getIt<AppState>();
  List<String> messageIsolates = [];

  @override
  void initState() {
    super.initState();
    // AppAdmob.createRewardedInterstitialAd(
    //     adUnitId: AdManager.interstitialAds_1);
    appState.init();
  }

  @override
  void dispose() {
    appState.dispose();
    super.dispose();
  }

  Future optimize() async {
    appState.optimize();
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OptimizerResultScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = DeviceDetector.getDeviceType(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemistry Optimizer'),
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(
          //     Icons.help_outline,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     showFloatingModalBottomSheet(
          //       context: context,
          //       backgroundColor: Colors.indigo,
          //       builder: (context) => const HelpModal(),
          //     ).then((position) {});
          //   },
          // )
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return const [
              // PopupMenuItem<int>(
              //   value: 0,
              //   child: Text("Import squad from WebApp"),
              // ),

              PopupMenuItem<int>(
                value: 0,
                child: Text("Help"),
              ),

              // PopupMenuItem<int>(
              //   value: 2,
              //   child: Text("Logout"),
              // ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              showFloatingModalBottomSheet(
                context: context,
                backgroundColor: Colors.indigo,
                builder: (context) => const HelpModal(),
              ).then((position) {});
            }
          }),
        ],
        flexibleSpace: const Image(
          image: AssetImage('assets/img/tile_bg.png'),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: 45,
                        child: deviceType == DeviceType.phone
                            ? Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: _buildFilterBar(),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _buildFilterBar(),
                              ),
                      ),
                    ),
                    _buildPlayers(),
                  ],
                ),
              ),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: _buildListSelectedCard(context)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListSelectedCard(BuildContext context) {
    final deviceType = DeviceDetector.getDeviceType(context);

    return SizedBox(
        width: double.infinity,
        child: ValueListenableBuilder(
          valueListenable: appState.selectedCardsNotifier,
          builder:
              (BuildContext context, List<Player> listCards, Widget? child) {
            if (listCards.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Please add 11 cards"),
                  const Text("or"),
                  ElevatedButton(
                    onPressed: () {
                      showFloatingModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.indigo,
                        builder: (context) => const WebAppImportModal(),
                      );
                    },
                    child: const Text('Import from WebApp'),
                  ),
                ],
              );
            }
            return Column(
              children: [
                SizedBox(
                  height: 77,
                  child: deviceType == DeviceType.phone
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: listCards.map((card) {
                            return GestureDetector(
                              onTap: () {
                                appState.selectedCardsNotifier.removeCard(card);
                              },
                              child: SizedBox(
                                  width: 90 * 0.7,
                                  height: 110 * 0.7,
                                  child: SmallCard(player: card)),
                            );
                          }).toList())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: listCards.map((card) {
                            return GestureDetector(
                              onTap: () {
                                appState.selectedCardsNotifier.removeCard(card);
                              },
                              child: SizedBox(
                                  width: 90 * 0.7,
                                  height: 110 * 0.7,
                                  child: SmallCard(player: card)),
                            );
                          }).toList()),
                ),
                Center(child: Text("${listCards.length}/11 cards were added")),
                const Spacer(),
                Center(
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF0D47A1),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 16),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                appState.selectedCardsNotifier.clear();
                              },
                              child: Row(
                                children: const [
                                  Text('Clear all'),
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 16),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: listCards.length == 11
                                  ? () async {
                                      await optimize();
                                    }
                                  : null,
                              child: Row(
                                children: [
                                  const Text('Optimize squad'),
                                  Icon(
                                    Icons.rocket_launch,
                                    color: listCards.length == 11
                                        ? Colors.white
                                        : const Color(0xFF0b3768),
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }

  _showPlayerExistDialog(context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
              width: 100, height: 20, child: const Text("PLAYER EXIST")),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                SizedBox(
                    width: 100,
                    height: 20,
                    child: Text("You added this player")),
                SizedBox(
                    width: 100,
                    height: 20,
                    child: Text("Please check and select another one")),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showMaxPlayerDialog(context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const SizedBox(width: 100, height: 20, child: Text("MAX PLAYER")),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                SizedBox(
                    width: 100,
                    height: 20,
                    child: Text("You added 11 players")),
                SizedBox(
                    width: 100,
                    height: 20,
                    child: Text("Please remove a player and add again")),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  selectCard(Player card, context) {
    if (appState.selectedCardsNotifier.value.length >= 11) {
      _showMaxPlayerDialog(context);
      return;
    }
    for (int i = 0; i < appState.selectedCardsNotifier.value.length; i++) {
      if (appState.selectedCardsNotifier.value[i].playerName ==
          card.playerName) {
        _showPlayerExistDialog(context);
        return;
      }
    }
    appState.selectedCardsNotifier.addCard(card);
  }

  List<Widget> _buildFilterBar() {
    return [
      _buildSearchPlayerField(context),
      const SizedBox(width: 10),
      _buildNation(),
      const SizedBox(width: 10),
      _buildSearchLeague(),
      const SizedBox(width: 10),
      _buildClubs(),
      // const SizedBox(width: 10),
      // _buildCardRarity(),
      const SizedBox(width: 10),
      _buildPlayerPosition(),
      const SizedBox(width: 10),
      _buildManagerBonus(),
    ];
  }

  Widget _buildPlayers() {
    return MultiValueListenableBuilder(
        valueListenables: [
          appState.selectedPlayerNotifier,
          appState.selectedNationNotifier,
          appState.selectedLeagueNotifier,
          appState.selectedClubNotifier,
          appState.selectedRarityNotifier,
          appState.selectedPositionNotifier,
          appState.selectedCardsNotifier,
          appState.isLoadingNotifier
        ],
        builder: (context, values, child) {
          final deviceType = DeviceDetector.getDeviceType(context);

          var selectedCards = values.elementAt(6);
          List<Player> playerCards = appState.getFilteredPlayers();
          return Expanded(
            child: GridView.count(
              crossAxisCount: deviceType == DeviceType.phone ? 4 : 8,
              childAspectRatio: 9 / 16,
              children: playerCards.map(
                (card) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 115,
                        child: SmallCard(
                          player: card,
                        ),
                      ),
                      selectedCards.indexOf(card) > -1
                          ? TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                appState.selectedCardsNotifier.removeCard(card);
                              },
                            )
                          : TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.lightBlue,
                              ),
                              onPressed: () {
                                selectCard(card, context);
                              },
                            )
                    ],
                  );
                },
              ).toList(),
            ),
          );
        });
  }

  Widget _buildPlayerPosition() {
    return GestureDetector(
      onTap: () {
        if (appState.selectedPositionNotifier.value == null) {
          showFloatingModalBottomSheet(
            context: context,
            backgroundColor: Colors.indigo,
            builder: (context) => const PlayerPositionModal(),
          ).then((position) {
            if (position == null) return;
            appState.selectedPositionNotifier.value = position;
          });
        }
        appState.selectedPositionNotifier.value = null;
      },
      child: ValueListenableBuilder(
        valueListenable: appState.selectedPositionNotifier,
        builder: (context, position, _) {
          return Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(5.0),
              border: position == null ? null : Border.all(color: Colors.red),
            ),
            child: position == null
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/img/filters/position.png",
                      fit: BoxFit.contain,
                    ),
                  )
                : Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      position,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildCardRarity() {
    return GestureDetector(
      onTap: () {
        if (appState.selectedRarityNotifier.value == null) {
          showFloatingModalBottomSheet(
            context: context,
            builder: (context) => const CardRarityModal(),
          ).then((cardRarity) {
            if (cardRarity == null) return;
            appState.selectedRarityNotifier.value = cardRarity;
          });
        }
        appState.selectedRarityNotifier.value = null;
      },
      child: ValueListenableBuilder(
          valueListenable: appState.selectedRarityNotifier,
          builder: (context, cardRarity, __) {
            return Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(5.0),
                border:
                    cardRarity == null ? null : Border.all(color: Colors.red),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  cardRarity == null
                      ? "assets/img/filters/rarity.png"
                      : "assets/img/filters/rarity_$cardRarity.png",
                  fit: BoxFit.contain,
                ),
              ),
            );
          }),
    );
  }

  Widget _buildClubs() {
    return GestureDetector(
      onTap: () {
        if (appState.selectedClubNotifier.value != null) {
          appState.selectedClubNotifier.value = null;
          return;
        } else {
          showFloatingModalBottomSheet(
            context: context,
            builder: (context) => const ClubModal(),
          ).then((club) {
            if (club == null) return;
            appState.selectedClubNotifier.value = club;
          });
          return;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: appState.selectedClubNotifier,
        builder: (context, club, _) {
          var clubUrl = club != null
              ? "assets/img/clubs/small/club_small_$club.png"
              : "assets/img/filters/club.png";
          return Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(5.0),
              border: club == null ? null : Border.all(color: Colors.red),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                clubUrl,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchLeague() {
    return GestureDetector(
      onTap: () async {
        if (appState.selectedLeagueNotifier.value == null) {
          await showFloatingModalBottomSheet(
            context: context,
            backgroundColor: Colors.indigo,
            builder: (context) => const LeagueModal(),
          ).then((league) {
            if (league == null) return;
            appState.selectedLeagueNotifier.value = league;
          });
        } else {
          appState.selectedClubLeagueNotifier.value = null;
          appState.selectedLeagueNotifier.value = null;
          appState.selectedClubNotifier.value = null;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: appState.selectedLeagueNotifier,
        builder: (BuildContext context, league, Widget? child) {
          return Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(5.0),
              border: league == null ? null : Border.all(color: Colors.red),
            ),
            child: league == null
                ? Image.asset(
                    "assets/img/filters/league.png",
                    width: 50,
                    semanticLabel: 'Search by league',
                  )
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IntrinsicWidth(
                      child: Image.asset(
                        "assets/img/leagues/$league.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildNation() {
    return GestureDetector(
      onTap: () {
        if (appState.selectedNationNotifier.value == null) {
          showFloatingModalBottomSheet(
            context: context,
            backgroundColor: Colors.indigo,
            builder: (context) => const NationModal(),
          ).then((nation) {
            if (nation == null) return;
            appState.selectedNationNotifier.value = nation;
          });
        }
        appState.selectedNationNotifier.value = null;
      },
      child: ValueListenableBuilder(
        valueListenable: appState.selectedNationNotifier,
        builder: (context, nationCode, _) {
          return Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(5.0),
              border: nationCode == null ? null : Border.all(color: Colors.red),
            ),
            child: nationCode == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/img/filters/nation.png",
                      fit: BoxFit.contain,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/img/nations/f_${nationCode}.png',
                      fit: BoxFit.contain,
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildSearchPlayerField(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (appState.selectedPlayerNotifier.value.keys.isEmpty) {
          _buildPlayersDialog();
        } else {
          appState.selectedPlayerNotifier.value = {};
        }
      },
      child: ValueListenableBuilder(
        valueListenable: appState.selectedPlayerNotifier,
        builder: (context, player, _) {
          return Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: player['playerImg'] == null
                ? const Icon(Icons.search, size: 30, color: Color(0xFF63d4f9))
                : Image.network(player['playerImg']!),
          );
        },
      ),
    );
  }

  Widget _buildManagerBonus() {
    return GestureDetector(
      onTap: () {
        if (appState.selectedManagerNationNotifier.value == null) {
          showFloatingModalBottomSheet(
            context: context,
            backgroundColor: Colors.indigo,
            builder: (context) => const ManagerNationModal(),
          );
        } else {
          appState.selectedManagerNationNotifier.value = null;
          appState.selectedManagerLeagueNotifier.value = null;
        }
      },
      child: MultiValueListenableBuilder(
        valueListenables: [
          appState.selectedManagerLeagueNotifier,
          appState.selectedManagerNationNotifier,
        ],
        builder: (context, values, _) {
          return Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
              borderRadius: BorderRadius.circular(5.0),
              border: values.elementAt(0) == null ? null : Border.all(color: Colors.red),
            ),
            child: values.elementAt(0) == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/img/filters/manager.png",
                      fit: BoxFit.contain,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/nations/f_${values.elementAt(1)}.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        width: 20,
                        height: 20,
                        'assets/img/leagues/${values.elementAt(0)}.png',
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  _buildPlayersDialog() {
    showFloatingModalBottomSheet(
      context: context,
      builder: (context) {
        return const NameSearchModal();
      },
    ).then((player) {
      if (player == null) {
        appState.selectedPlayerNotifier.value.clear();
        return;
      }
      appState.selectedPlayerNotifier.value = player;
    });
  }
}
