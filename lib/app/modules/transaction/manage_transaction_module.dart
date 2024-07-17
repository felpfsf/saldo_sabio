import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/modules/sd_sb_module.dart';
import 'package:saldo_sabio/app/modules/transaction/manage_transaction.dart';
import 'package:saldo_sabio/app/modules/transaction/manage_transaction_controller.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository_impl.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';
import 'package:saldo_sabio/app/services/category/category_service_impl.dart';

class ManageTransactionModule extends SdSbModule {
  ManageTransactionModule()
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
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => ManageTransactionController(
                categoryService: context.read(),
              ),
            ),
          ],
          routers: {
            '/transaction/manage-transaction': (context) =>
                ManageTransaction(controller: context.read()),
          },
        );
}
