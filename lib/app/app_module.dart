import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/app_widget.dart';
import 'package:saldo_sabio/app/core/auth/sd_sb_auth_provider.dart';
import 'package:saldo_sabio/app/core/database/sql_connection_factory.dart';
import 'package:saldo_sabio/app/repositories/user/user_repository.dart';
import 'package:saldo_sabio/app/repositories/user/user_repository_impl.dart';
import 'package:saldo_sabio/app/services/user/user_service.dart';
import 'package:saldo_sabio/app/services/user/user_service_impl.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => FirebaseAuth.instance,
        ),
        Provider(
          create: (_) => SqlConnectionFactory(),
          lazy: false,
        ),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            auth: context.read(),
          ),
        ),
        Provider<UserService>(
          create: (context) => UserServiceImpl(
            userRepository: context.read(),
          ),
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
