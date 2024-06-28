import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/database/sql_connection_factory.dart';

class SqlAdmConnection with WidgetsBindingObserver {
  final conn = SqlConnectionFactory();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        log('🚀 Connection resumed');
        break;
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        log('🚀 Connection closed');
        conn.closeConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
