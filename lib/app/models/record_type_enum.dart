enum RecordTypeEnum {
  expense,
  income,
}

extension ParseToString on RecordTypeEnum {
  String toShortString() {
    switch (this) {
      case RecordTypeEnum.expense:
        return 'expense';
      case RecordTypeEnum.income:
        return 'income';
    }
  }
}
