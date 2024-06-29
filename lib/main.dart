import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/app_module.dart';
import 'package:saldo_sabio/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppModule());
}
