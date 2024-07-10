import 'package:money_formatter/money_formatter.dart';

String formatCurrency(double amount) {
  MoneyFormatterSettings fmsettings = MoneyFormatterSettings(
    symbol: 'R\$ ',
    thousandSeparator: '.',
    decimalSeparator: ',',
    fractionDigits: 2,
    symbolAndNumberSeparator: '',
    compactFormatType: CompactFormatType.short,
  );
  MoneyFormatter fmf = MoneyFormatter(amount: amount, settings: fmsettings);

  return fmf.output.symbolOnLeft;
}
