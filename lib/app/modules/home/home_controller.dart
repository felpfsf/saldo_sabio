import 'package:saldo_sabio/app/core/notifier/sd_sb_change_notifier.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/models/summary_transaction_model.dart';
import 'package:saldo_sabio/app/models/transaction_model.dart';
import 'package:saldo_sabio/app/services/category/category_service.dart';
import 'package:saldo_sabio/app/services/transaction/transaction_service.dart';

class HomeController extends SdSbChangeNotifier {
  final TransactionService _transactionService;

  SummaryTransactionModel? incomeTransactions;
  SummaryTransactionModel? expenseTransactions;
  SummaryTransactionModel? totalTransactions;

  List<TransactionModel> allTransactions = [];

  HomeController({
    required CategoryService categoryService,
    required TransactionService transactionService,
  }) : _transactionService = transactionService;

  Future<void> loadTransactions() async {
    final transactions = await _transactionService.getTransactions();

    expenseTransactions = calculateExpenseTransactions(transactions);
    incomeTransactions = calculateIncomeTransactions(transactions);
    totalTransactions = calculateTotalTransactions(transactions);

    allTransactions = transactions;

    notifyListeners();
  }

  Future<void> refreshTransactions() async {
    showLoading();
    await loadTransactions();

    hideLoading();
    notifyListeners();
  }

  SummaryTransactionModel calculateTotalTransactions(
      List<TransactionModel> transactions) {
    double totalAmount = 0.0;

    double totalIncome = incomeTransactions?.totalAmount ?? 0.0;
    double totalExpense = expenseTransactions?.totalAmount ?? 0.0;

    totalAmount = totalIncome + totalExpense;

    return SummaryTransactionModel(
      totalAmount: totalAmount,
    );
  }

  SummaryTransactionModel calculateExpenseTransactions(
      List<TransactionModel> transactions) {
    double totalAmount = 0.0;
    DateTime lastEntryDate = DateTime.fromMillisecondsSinceEpoch(0);

    final expenseType = transactions.where(
      (t) => t.recordType == RecordTypeEnum.expense,
    );

    if (expenseType.isNotEmpty) {
      totalAmount = expenseType
          .map((e) => e.amount)
          .fold(0, (prev, element) => prev + element);

      lastEntryDate = expenseType
          .map((e) => e.date)
          .reduce((prev, element) => prev.isAfter(element) ? prev : element);
    }

    return SummaryTransactionModel(
      totalAmount: totalAmount,
      lastEntryDate: lastEntryDate,
      recordType: RecordTypeEnum.expense,
    );
  }

  SummaryTransactionModel calculateIncomeTransactions(
      List<TransactionModel> transactions) {
    double totalAmount = 0.0;
    DateTime lastEntryDate = DateTime.fromMillisecondsSinceEpoch(0);

    final incomeType = transactions.where(
      (transaction) => transaction.recordType == RecordTypeEnum.income,
    );

    if (incomeType.isNotEmpty) {
      totalAmount = incomeType
          .map((e) => e.amount)
          .fold(0, (prev, element) => prev + element);

      lastEntryDate = incomeType
          .map((e) => e.date)
          .reduce((prev, element) => prev.isAfter(element) ? prev : element);
    }

    return SummaryTransactionModel(
      totalAmount: totalAmount,
      lastEntryDate: lastEntryDate,
      recordType: RecordTypeEnum.income,
    );
  }
}
