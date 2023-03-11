import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'firebase/firebase_crashlytics.dart';
import 'firebase/firebase_options.dart';

void main() async {
  runZonedGuarded(
    () async {
      final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: binding);

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await CustomCrashlytics.initialize();

      await App.resolveDependencies();
      runApp(const App());
    },
    CustomCrashlytics.instance.recordError,
  );
}
