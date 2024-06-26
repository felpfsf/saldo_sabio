import 'package:saldo_sabio/app/core/modules/saldo_sabio_module.dart';
import 'package:saldo_sabio/app/presentation/home/home_page.dart';

class HomeModule extends SaldoSabioModule {
  HomeModule()
      : super(
          bindings: [],
          routers: {
            '/home': (_) => const HomePage(),
          },
        );
}
