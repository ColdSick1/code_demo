import 'package:code_demonstration/app.dart';
import 'package:code_demonstration/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(const App());
}
