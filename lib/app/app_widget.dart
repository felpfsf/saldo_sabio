import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/database/sql_adm_connection.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_loader.dart';
import 'package:saldo_sabio/app/presentation/home/home_module.dart';
// ignore: unused_import
import 'package:saldo_sabio/app/presentation/showcase/showcase_components_page.dart';
import 'package:saldo_sabio/app/presentation/showcase/showcase_module.dart';
import 'package:saldo_sabio/app/presentation/splash/splash_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqlAdmConnection = SqlAdmConnection();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(sqlAdmConnection);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqlAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      loader: SdSbLoader(),
      builder: (navigatorObserver) {
        return MaterialApp(
          theme: SaldoSabioTheme.themeData,
          navigatorObservers: [navigatorObserver],
          title: 'Saldo Sábio',
          // home: const ShowcaseComponentsPage(),
          home: const SplashPage(),
          routes: {
            ...ShowcaseModule().routers,
            ...HomeModule().routers,
          },
        );
      },
    );
  }
}
