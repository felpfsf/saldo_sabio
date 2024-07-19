import 'dart:developer';

import 'package:saldo_sabio/app/core/notifier/sd_sb_change_notifier.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';

class ManageCategoryController extends SdSbChangeNotifier {
  final CategoryService _categoryService;

  ManageCategoryController({
    required CategoryService categoryService,
  }) : _categoryService = categoryService;

  Future<void> addCategory(String title) async {
    try {
      showLoadingAdnResetState();
      notifyListeners();

      if (title.isEmpty) {
        setError('Título não pode estar vazio');
        return;
      }

      await _categoryService.addCategory(title);

      success();
    } catch (e, s) {
      log('Erro ao adicionar categoria: $e $s');
      setError('Erro ao adicionar categoria');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
