import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/exceptions/transaction_exception.dart';
import 'package:saldo_sabio/app/core/notifier/sd_sb_change_notifier.dart';
import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';
import 'package:saldo_sabio/app/services/transaction/transaction_service.dart';

class ManageTransactionController extends SdSbChangeNotifier {
  final CategoryService _categoryService;
  final TransactionService _transactionService;

  ManageTransactionController({
    required CategoryService categoryService,
    required TransactionService transactionService,
  })  : _categoryService = categoryService,
        _transactionService = transactionService;

  ValueNotifier<int?> _selectedCategoryVN = ValueNotifier<int?>(null);

  set selectedCategoryVN(ValueNotifier<int?> value) {
    resetState();
    _selectedCategoryVN = value;
    notifyListeners();
  }

  ValueNotifier<int?> get selectedCategoryVN => _selectedCategoryVN;

  DateTime? _pickedDate;

  List<CategoryModel> categories = [];

  set pickedDate(DateTime? value) {
    resetState();
    _pickedDate = value;
    notifyListeners();
  }

  DateTime? get pickedDate => _pickedDate;

  Future<void> getCategories() async {
    final response = await _categoryService.getCategories();
    categories = response;
    notifyListeners();
  }

  Future<void> saveTransaction({
    required String title,
    required String description,
    required num amount,
    required RecordTypeEnum recordType,
    required String userId,
  }) async {
    try {
      showLoadingAdnResetState();
      notifyListeners();

      if (_pickedDate == null) {
        setError('Data não selecionada');
        return;
      }

      if (_selectedCategoryVN.value == null) {
        setError('Categoria não selecionada');
        return;
      }

      final transactionDTO = (
        title: title,
        description: description,
        amount: amount,
        recordType: recordType,
        date: pickedDate!,
        categoryId: _selectedCategoryVN.value!,
        userId: userId,
      );

      await _transactionService.saveTransaction(transactionDTO);

      success();
    } on TransactionException catch (e, s) {
      log('❌ TransactionException - Erro ao salvar transação',
          error: e, stackTrace: s);
      setError('TransactionException - Erro ao salvar transação ${e.message}');
    } catch (e, s) {
      log('❌ Erro ao salvar transação', error: e, stackTrace: s);
      setError('Erro ao salvar transação ${e.toString()}');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
