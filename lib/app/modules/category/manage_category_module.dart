import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/modules/sd_sb_module.dart';
import 'package:saldo_sabio/app/modules/category/manage_category.dart';
import 'package:saldo_sabio/app/modules/category/manage_category_controller.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository_impl.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';
import 'package:saldo_sabio/app/services/category/category_service_impl.dart';

class ManageCategoryModule extends SdSbModule {
  ManageCategoryModule()
      : super(
          bindings: [
            Provider<CategoryRepository>(
              create: (context) => CategoryRepositoryImpl(
                sqlConnectionFactory: context.read(),
              ),
            ),
            Provider<CategoryService>(
              create: (context) => CategoryServiceImpl(
                categoryRepository: context.read(),
                userRepository: context.read(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => ManageCategoryController(
                categoryService: context.read(),
              ),
            )
          ],
          routers: {
            '/category/manage-category': (context) =>
                ManageCategory(controller: context.read()),
          },
        );
}
