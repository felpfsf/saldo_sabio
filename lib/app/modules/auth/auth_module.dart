import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/modules/sd_sb_module.dart';
import 'package:saldo_sabio/app/modules/auth/login/login_controller.dart';
import 'package:saldo_sabio/app/modules/auth/login/login_page.dart';
import 'package:saldo_sabio/app/modules/auth/register/register_controller.dart';
import 'package:saldo_sabio/app/modules/auth/register/register_page.dart';
import 'package:saldo_sabio/app/modules/home/home_page.dart';

class AuthModule extends SdSbModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => LoginController(
                userService: context.read(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => RegisterController(
                userService: context.read(),
              ),
            ),
          ],
          routers: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/home': (context) => const HomePage(),
          },
        );
}
