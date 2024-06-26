import 'package:flutter/material.dart';

class SaldoSabioNavGlobalKey {
  static SaldoSabioNavGlobalKey? _instance;

  final navKey = GlobalKey<NavigatorState>();

  SaldoSabioNavGlobalKey._();

  static SaldoSabioNavGlobalKey get instance =>
      _instance ??= SaldoSabioNavGlobalKey._();
}
