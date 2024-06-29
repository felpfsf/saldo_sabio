import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/app_widget.dart';
import 'package:saldo_sabio/app/core/auth/sd_sb_auth_provider.dart';
import 'package:saldo_sabio/app/core/database/sql_connection_factory.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => SqlConnectionFactory(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => SdSbAuthProvider(
            auth: context.read(),
            userService: context.read(),
          )..loadListener(),
          lazy: false,
        ),
      ],
      child: const AppWidget(),
    );
  }
}
