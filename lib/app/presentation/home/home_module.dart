import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/modules/sd_sb_module.dart';
import 'package:saldo_sabio/app/presentation/home/home_page.dart';

class HomeModule extends SdSbModule {
  HomeModule()
      : super(
          bindings: [Provider(create: (_) => Object())],
          routers: {
            '/home': (_) => const HomePage(),
          },
        );
}
