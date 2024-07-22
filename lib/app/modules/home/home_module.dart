import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/modules/sd_sb_module.dart';
import 'package:saldo_sabio/app/modules/home/home_controller.dart';
import 'package:saldo_sabio/app/modules/home/home_page.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository_impl.dart';
import 'package:saldo_sabio/app/repositories/transaction/transaction_repository.dart';
import 'package:saldo_sabio/app/repositories/transaction/transaction_repository_impl.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';
import 'package:saldo_sabio/app/services/category/category_service_impl.dart';
import 'package:saldo_sabio/app/services/transaction/transaction_service.dart';
import 'package:saldo_sabio/app/services/transaction/transaction_service_impl.dart';

class HomeModule extends SdSbModule {
  HomeModule()
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
              create: (context) => HomeController(
                categoryService: context.read(),
                transactionService: context.read(),
              ),
            ),
          ],
          routers: {
            '/home': (context) => HomePage(homeController: context.read()),
          },
        );
}
