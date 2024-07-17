import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SdSbNavigator {
  SdSbNavigator._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get to => navigatorKey.currentState!;
}
