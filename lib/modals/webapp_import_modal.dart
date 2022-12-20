import 'package:flutter/material.dart';
import 'package:fut_chemistry/core/extensions/latin_extended.dart';

import '../core/di.dart';
import '../models/player.dart';
import '../state/app_state.dart';

class WebAppImportModal extends StatefulWidget {
  const WebAppImportModal({super.key});

  @override
  State<WebAppImportModal> createState() => _NameSearchModalState();
}

class _NameSearchModalState extends State<WebAppImportModal> {
  late String _webAppUrl = '';
  bool isImporting = false;
  final appState = getIt<AppState>();

  @override
  void initState() {
    super.initState();
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Please input squad URL",
                        ),
                        onChanged: (content) {
                          _webAppUrl = content;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(200, 60), //////// HERE
                        ),
                        onPressed: isImporting ? null : () async {
                          setState(() {
                            isImporting = true;
                          });
                          await appState.selectedCardsNotifier
                              .importWebApp(_webAppUrl, (bool isSuccess) {
                            setState(() {
                              isImporting = false;
                            });
                            if (!mounted) return;
                            if (isSuccess) {
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: isImporting
                            ? const SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                              )
                            : const Text('Import'),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/img/web_app_import_guide.jpg'),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
