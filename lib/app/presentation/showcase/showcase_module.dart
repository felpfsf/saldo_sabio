import 'package:saldo_sabio/app/core/modules/sd_sb_module.dart';
import 'package:saldo_sabio/app/presentation/showcase/showcase_components_page.dart';

class ShowcaseModule extends SdSbModule {
  ShowcaseModule()
      : super(
          bindings: [],
          routers: {
            '/showcase': (_) => const ShowcaseComponentsPage(),
          },
        );
}
