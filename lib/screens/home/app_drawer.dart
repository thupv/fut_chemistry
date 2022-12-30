import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fut_chemistry/models/metadata.dart';

import '../../core/di.dart';
import '../../models/app.dart';
import '../../state/app_state.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final appState = getIt<AppState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        child: ValueListenableBuilder(
          valueListenable: appState.metadataNotifier,
          builder: (context, Metadata? data, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Chemistry Optimizer',
                        style: TextStyle(fontSize: 20)),
                    const Divider(),
                    data != null
                        ? Column(children: _buildAppWidgets(data.apps))
                        : Container(),
                    const Divider(),
                  ],
                ),
                const Text("From FUTFC Team with ❤")
              ],
            );
          },
        ),
      ),
    );
  }
}

List<Widget> _buildAppWidgets(List<App> apps) {
  return apps.map((app) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: CachedNetworkImage(imageUrl: app.iconURL),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    app.appName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    app.description,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }).toList();
}
