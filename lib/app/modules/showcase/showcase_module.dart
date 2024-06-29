import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/modules/sd_sb_module.dart';
import 'package:saldo_sabio/app/modules/showcase/showcase_components_page.dart';

class ShowcaseModule extends SdSbModule {
  ShowcaseModule()
      : super(
          bindings: [Provider(create: (_) => Object())],
          routers: {
            '/showcase': (_) => const ShowcaseComponentsPage(),
          },
        );
}
