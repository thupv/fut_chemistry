import 'package:flutter/material.dart';
import 'package:fut_chemistry/models/club.dart';
import 'package:fut_chemistry/core/di.dart';
import 'package:fut_chemistry/state/app_state.dart';
import '../analytics/event.dart';

import '../core/helpers/device_type.dart';

class ClubModal extends StatefulWidget {

  const ClubModal({Key? key}) : super(key: key);

  @override
  State<ClubModal> createState() => _ClubModalState();
}

class _ClubModalState extends State<ClubModal> {
  final appState = getIt<FutAppState>();
  int? filterLeagueId;

  List<Club> clubs = [];
  List<Club> filteredClubs = [];

  @override
  void initState() {
    super.initState();
    filterLeagueId = appState.selectedClubLeagueNotifier.value;
    clubs = appState.metadataNotifier.value?.clubs ?? [];
    filteredClubs = clubs
        .where((element) => element.leagueId == filterLeagueId || filterLeagueId == null)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = DeviceDetector.getDeviceType(context);

    return SafeArea(
      child: Padding(
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
                'SELECT CLUB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: filteredClubs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: deviceType == DeviceType.phone ? 4 : 8,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    String clubUrl = "assets/img/clubs/small/club_small_${filteredClubs[index].id}.png";
                    return GestureDetector(
                      onTap: () {
                        logFilter("club", filteredClubs[index].id.toString());
                        Navigator.of(context).pop(filteredClubs[index].id);
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              clubUrl,
                              height: 50,
                              width: 50,
                            ),
                            Text(filteredClubs[index].code.toUpperCase()),
                          ],
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
