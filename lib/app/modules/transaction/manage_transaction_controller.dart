import 'package:saldo_sabio/app/core/notifier/sd_sb_change_notifier.dart';
import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';

class ManageTransactionController extends SdSbChangeNotifier {
  final CategoryService _categoryService;

  List<CategoryModel> categories = [];

  ManageTransactionController({
    required CategoryService categoryService,
  }) : _categoryService = categoryService;

  Future<void> getCategories() async {
    final response = await _categoryService.getCategories();
    categories = response;
    notifyListeners();
  }
}
