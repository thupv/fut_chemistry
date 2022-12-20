import 'package:flutter/material.dart';
import 'package:fut_chemistry/models/nation.dart';
import 'package:fut_chemistry/core/di.dart';
import 'package:fut_chemistry/state/app_state.dart';

import '../core/helpers/device_type.dart';

class NationModal extends StatefulWidget {
  const NationModal({Key? key}) : super(key: key);

  @override
  State<NationModal> createState() => _NationModalState();
}

class _NationModalState extends State<NationModal> {
  final appState = getIt<AppState>();

  List<Nation> nations = [];

  @override
  void initState() {
    nations = appState.metadataNotifier.value?.nations ?? [];
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
                'SELECT NATION',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: nations.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (deviceType == DeviceType.phone) ? 4 : 8,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    int nationCode = nations[index].code;
                    String nationImgUrl =
                        "assets/img/nations/nation_large_$nationCode.png";
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(nationCode);
                      },
                      child: Image.asset(
                        nationImgUrl,
                        height: 50,
                        width: 50,
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
