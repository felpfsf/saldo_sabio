import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:saldo_sabio/app/core/database/sql_adm_connection.dart';
import 'package:saldo_sabio/app/core/navigators/sd_sb_navigator.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_loader.dart';
import 'package:saldo_sabio/app/modules/auth/auth_module.dart';
import 'package:saldo_sabio/app/modules/home/home_module.dart';
import 'package:saldo_sabio/app/modules/splash/splash_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqlAdmConnection = SqlAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqlAdmConnection);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(sqlAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) => const SdSbLoader(),
      overlayColor: Colors.transparent,
      child: MaterialApp(
        theme: SaldoSabioTheme.themeData,
        navigatorKey: SdSbNavigator.navigatorKey,
        title: 'Saldo Sábio',
        home: const SplashPage(),
        routes: {
          ...AuthModule().routers,
          ...HomeModule().routers,
        },
      ),
    );
  }
}
