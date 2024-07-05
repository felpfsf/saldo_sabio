import 'package:flutter/material.dart';

class SdSbChangeNotifier extends ChangeNotifier {
  String? _error;
  bool _isLoading = false;
  bool _isSuccess = false;

  String? get error => _error;
  bool get hasError => _error != null;
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;

  void showLoading() => _isLoading = true;
  void hideLoading() => _isLoading = false;

  void success() => _isSuccess = true;
  void setError(String? error) => _error = error;

  void resetState() {
    setError(null);
    _isSuccess = false;
  }

  void showLoadingAdnResetState() {
    showLoading();
    resetState();
  }
}
