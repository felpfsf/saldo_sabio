import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/app_widget.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: const AppWidget(),
    );
  }
}
