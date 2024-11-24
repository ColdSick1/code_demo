// import 'package:common/services/http/http_without_auth/http_without_auth.dart';
// import 'package:core/app_config.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:code_demonstration/app.dart';
import 'package:code_demonstration/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:rive/rive.dart';
// import 'package:seeds_altay/core/di/di.dart';
// import 'package:seeds_altay/core/services/push_notification/push_service.dart';
// import 'package:seeds_altay/core/utils/bloc_observer/bloc_observer.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

// import 'app.dart';
// import 'core/config/firebase/dev/firebase_options.dart' as dev;
// import 'core/config/firebase/prod/firebase_options.dart' as prod;
// import 'gen/assets.gen.dart';

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
