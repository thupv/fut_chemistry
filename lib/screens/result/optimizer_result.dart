import 'package:flutter/material.dart';
import 'package:fut_chemistry/modals/squad_modal.dart';
import 'package:fut_chemistry/models/optimizer_result.dart';
import 'package:fut_chemistry/core/extensions/map_indexed.dart';
import 'package:fut_chemistry/core/mixins/dialog_mixins.dart';
import 'package:fut_chemistry/modals/player_position.dart';
import 'package:share_admob/share_admob.dart';

import '../../constants/ad_manager.dart';
import '../../core/di.dart';
import '../../state/app_state.dart';

class OptimizerResultScreen extends StatefulWidget {
  const OptimizerResultScreen({Key? key}) : super(key: key);

  @override
  State<OptimizerResultScreen> createState() => _OptimizerResultScreenState();
}

class _OptimizerResultScreenState extends State<OptimizerResultScreen> with CommonDialogMixin{
  final appState = getIt<AppState>();

  int openItemIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chemistry Optimizer Result'),
          flexibleSpace: const Image(
            image: AssetImage('assets/img/tile_bg.png'),
            fit: BoxFit.cover,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ValueListenableBuilder(
              valueListenable: appState.optimizerResultNotifier,
              builder: (context, List<OptimizerResult> results, child) {
                return _buildPanel(results);
              }),
        ));
  }

  Widget _buildPanel(List<OptimizerResult> results) {
    return ExpansionPanelList(
      key: UniqueKey(),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          openItemIdx = isExpanded ? -1 : index;
        });
      },
      children: results.mapIndexed((OptimizerResult item, int idx) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.hexagon,
                          size: 40.0,
                          color: item.maxTeamChemistry > 10
                              ? Colors.green
                              : Colors.red,
                        ),
                        Text(
                          item.maxTeamChemistry.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                title: ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    subtitle: Text('Chemistry: ${item.maxTeamChemistry}/33'),
                    title: RichText(
                      text: TextSpan(
                        text: 'Formation ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: item.formation.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )));
          },
          body: ListTile(
              title: Text('Position Changes: ${item.positionChanges}'),
              subtitle: Text('Off chem: ${item.offChem.toString()}'),
              trailing: SizedBox(
                height: 40,
                width: 130,
                child: ElevatedButton(
                  child: const Text('View Squad'),
                  onPressed: () {
                      showFloatingModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.indigo,
                        builder: (context) => SquadModal(optimizerResult: item),
                      ).then((position) {
                        AppAdmob.showRewardedInterstitialAd(
                          adUnitId: AdManager.interstitialAds_1,
                        );
                      });
                  },
                ),
              ),
              onTap: () {}),
          isExpanded: openItemIdx == idx,
        );
      }).toList(),
    );
  }
}
