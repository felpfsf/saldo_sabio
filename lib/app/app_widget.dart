import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_loader.dart';
import 'package:saldo_sabio/app/presentation/home/home_module.dart';
import 'package:saldo_sabio/app/presentation/showcase/components_showcase_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      loader: SdSbLoader(),
      builder: (navigatorObserver) {
        return MaterialApp(
          theme: SaldoSabioTheme.themeData,
          navigatorObservers: [navigatorObserver],
          title: 'Saldo Sábio',
          home: const ShowcaseComponentsPage(),
          routes: {
            ...HomeModule().routers,
          },
        );
      },
    );
  }
}
