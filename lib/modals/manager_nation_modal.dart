import 'package:flutter/material.dart';
import 'package:fut_chemistry/models/nation.dart';
import 'package:fut_chemistry/core/di.dart';
import 'package:fut_chemistry/state/app_state.dart';
import '../core/helpers/device_type.dart';
import '../core/mixins/dialog_mixins.dart';
import '../models/manager.dart';
import 'package:fut_chemistry/modals/manager_league_modal.dart';
import '../analytics/event.dart';


class ManagerNationModal extends StatefulWidget{
  const ManagerNationModal({Key? key}) : super(key: key);

  @override
  State<ManagerNationModal> createState() => _NationModalState();
}

class _NationModalState extends State<ManagerNationModal> with CommonDialogMixin {
  final appState = getIt<AppState>();

  List<Manager> managers = [];

  @override
  void initState() {
    managers = appState.metadataNotifier.value?.managers ?? [];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = DeviceDetector.getDeviceType(context);

    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(16),
        child: Material(
          color: Colors.black87,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                'SELECT MANAGER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: managers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (deviceType == DeviceType.phone) ? 4 : 8,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    int nationCode = managers[index].nationId;
                    String nationImgUrl =
                        "assets/img/nations/nation_large_$nationCode.png";
                    return GestureDetector(
                      onTap: () async {
                        await showFloatingModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.indigo,
                            builder: (context) => const ManagerLeagueModal(),
                        ).then((league) {
                        if (league == null) return;
                          appState.selectedManagerLeagueNotifier.value = league;
                          appState.selectedManagerNationNotifier.value = nationCode;
                          logFilter("manager", '$league-$nationCode');
                          Navigator.of(context).pop();
                        });

                      },
                      child: Column(
                        children: [
                          Image.asset(
                            nationImgUrl,
                            height: 50,
                            width: 50,
                          ),
                          Text(
                            managers[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
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
