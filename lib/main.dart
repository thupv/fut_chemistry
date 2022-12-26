import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'ads/admob_manager.dart';
import 'core/di.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:fut_chemistry/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AdmobManager.init();
  if(kIsWeb) {
    Hive.initFlutter();
  } else {
    Directory directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
  }
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fut Chemistry Web App",
      builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
