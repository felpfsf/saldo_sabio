import 'package:flutter/material.dart';

class SdobNavGlobalKey {
  static SdobNavGlobalKey? _instance;

  SdobNavGlobalKey._();

  static final navKey = GlobalKey<NavigatorState>();
  static SdobNavGlobalKey get instance => _instance ??= SdobNavGlobalKey._();
}
