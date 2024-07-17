import 'package:saldo_sabio/app/core/notifier/sd_sb_change_notifier.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';

class HomeController extends SdSbChangeNotifier {
  final CategoryService _categoryService;

  HomeController({
    required CategoryService categoryService,
  }) : _categoryService = categoryService;
}
