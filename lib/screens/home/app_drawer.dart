import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fut_chemistry/models/app.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/di.dart';
import '../../models/metadata.dart';
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
          builder: (context, Metadata? metadata, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(appState.metadataNotifier.value?.appName ?? 'Fut Card Creator',
                        style: TextStyle(fontSize: 20)),
                    const Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('RATE TO SUPPORT US',
                        style: TextStyle(fontSize: 16)),
                    RatingBar.builder(
                      initialRating: 5,
                      minRating: 2,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 32,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) async {
                        if (rating > 3.0) {
                          var uri = Uri.parse(appState.metadataNotifier.value?.appStoreUrl ?? '');
                          var urlLaunchable = await canLaunchUrl(uri);
                          if (urlLaunchable) {
                            await launchUrl(uri);
                          } else {
                            print("URL can't be launched.");
                          }
                        } else {
                          final Uri params = Uri(
                              scheme: 'mailto',
                              path: 'futfc.team@gmail.com',
                              queryParameters: {
                                'subject': 'FUT_Card_Creator_Feedback',
                                'body': 'Feedback_for_FUT_Card_Creator',
                              });
                          String url = params.toString();
                          if (await canLaunchUrl(params)) {
                            await launchUrl(params);
                          } else {
                            print('Could not launch $url');
                          }
                        }
                      },
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('MORE APPS FOR FUT PLAYER',
                            style: TextStyle(fontSize: 16)),
                        Chip(
                          padding: EdgeInsets.all(0),
                          backgroundColor: Colors.redAccent,
                          label: Text(
                              '  ${appState.metadataNotifier.value!.apps.length.toString()}  ',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    metadata != null
                        ? Column(children: _buildAppWidgets(appState.metadataNotifier.value!.apps))
                        : Container(),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("From FUTFC Team with ❤"),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16)),
                      onPressed: () async {
                        final Uri params = Uri(
                            scheme: 'mailto',
                            path: 'futfc.team@gmail.com',
                            queryParameters: {
                              'subject': 'FUT_Card_Creator_Feedback',
                              'body': 'Feedback_for_FUT_Card_Creator',
                            });
                        String url = params.toString();
                        if (await canLaunchUrl(params)) {
                          await launchUrl(params);
                        } else {
                          print('Could not launch $url');
                        }
                      },
                      child: const Text('Contact us'),
                    ),
                  ],
                ),
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
      onTap: () async {
        var uri = Uri.parse(app.storeURL);
        var urlLaunchable = await canLaunchUrl(uri);
        if (urlLaunchable) {
          await launchUrl(uri);
        } else {
          print("URL can't be launched.");
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: CachedNetworkImage(imageUrl: app.iconURL),
            ),
            SizedBox(width: 12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    app.appName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    app.description,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontWeight: FontWeight.normal),
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
