import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/modules/sd_sb_module.dart';
import 'package:saldo_sabio/app/modules/transaction/manage_transaction.dart';
import 'package:saldo_sabio/app/modules/transaction/manage_transaction_controller.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository_impl.dart';
import 'package:saldo_sabio/app/repositories/transaction/transaction_repository.dart';
import 'package:saldo_sabio/app/repositories/transaction/transaction_repository_impl.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';
import 'package:saldo_sabio/app/services/category/category_service_impl.dart';
import 'package:saldo_sabio/app/services/transaction/transaction_service.dart';
import 'package:saldo_sabio/app/services/transaction/transaction_service_impl.dart';

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
            Provider<TransactionRepository>(
              create: (context) => TransactionRepositoryImpl(
                sqliteConnectionFactory: context.read(),
              ),
            ),
            Provider<TransactionService>(
              create: (context) => TransactionServiceImpl(
                transactionRepository: context.read(),
                categoryRepository: context.read(),
                userRepository: context.read(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => ManageTransactionController(
                categoryService: context.read(),
                transactionService: context.read(),
              ),
            ),
          ],
          routers: {
            '/transaction/manage-transaction': (context) =>
                ManageTransaction(controller: context.read()),
          },
        );
}
