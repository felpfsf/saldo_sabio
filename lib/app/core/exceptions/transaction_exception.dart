class TransactionException implements Exception {
  final String message;

  TransactionException({
    required this.message,
  });
}

final class TransactionError extends TransactionException {
  TransactionError({required super.message});
}
