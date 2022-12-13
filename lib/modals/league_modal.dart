import 'package:flutter/material.dart';
import 'package:fut_chemistry/models/league.dart';
import 'package:fut_chemistry/core/di.dart';
import 'package:fut_chemistry/state/app_state.dart';

class LeagueModal extends StatefulWidget {
  const LeagueModal({Key? key}) : super(key: key);

  @override
  State<LeagueModal> createState() => _LeagueModalState();
}

class _LeagueModalState extends State<LeagueModal> {
  final appState = getIt<AppState>();

  List<League> leagues = [];

  @override
  void initState() {
    leagues = appState.metadataNotifier.value?.leagues ?? [];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          color: Colors.black87,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                'SELECT LEAGUE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  itemCount: leagues.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    int fileId = leagues[index].id;
                    int leagueId = leagues[index].flagId;
                    String leagueImgUrl =
                        "assets/img/leagues/$fileId";
                    return GestureDetector(
                      onTap: () {
                        appState.selectedClubLeagueNotifier.value = fileId;
                        Navigator.of(context).pop(leagueId);
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),
                        child: Image.asset(
                          leagueImgUrl,
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
