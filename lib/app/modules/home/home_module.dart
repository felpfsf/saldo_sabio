import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/modules/sd_sb_module.dart';
import 'package:saldo_sabio/app/modules/home/home_controller.dart';
import 'package:saldo_sabio/app/modules/home/home_page.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository_impl.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';
import 'package:saldo_sabio/app/services/category/category_service_impl.dart';

class HomeModule extends SdSbModule {
  HomeModule()
      : super(
          bindings: [
            Provider<CategoryRepository>(
              create: (context) =>
                  CategoryRepositoryImpl(sqlConnectionFactory: context.read()),
            ),
            Provider<CategoryService>(
              create: (context) =>
                  CategoryServiceImpl(categoryRepository: context.read()),
            ),
            ChangeNotifierProvider(
              create: (context) =>
                  HomeController(categoryService: context.read()),
            ),
          ],
          routers: {
            '/home': (context) => HomePage(homeController: context.read()),
          },
        );
}
