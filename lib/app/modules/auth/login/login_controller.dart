import 'dart:developer';

import 'package:saldo_sabio/app/core/exceptions/auth_exception.dart';
import 'package:saldo_sabio/app/core/notifier/sd_sb_change_notifier.dart';
import 'package:saldo_sabio/app/services/user/user_service.dart';

class LoginController extends SdSbChangeNotifier {
  final UserService _userService;
  String? infoMessage;

  LoginController({
    required UserService userService,
  }) : _userService = userService;

  bool get hasInfo => infoMessage != null;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAdnResetState();
      infoMessage = null;
      notifyListeners();

      final user = await _userService.login(email, password);

      if (user != null) {
        success();
      } else {
        setError('❌ Usuário ou senha inválidos !');
      }
    } on AuthException catch (e, s) {
      log('❌ Error: $e', stackTrace: s);
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  googleSignIn() async {
    try {
      showLoadingAdnResetState();
      infoMessage = null;
      notifyListeners();
      final user = await _userService.googleProviderSignIn();

      if (user != null) {
        success();
      } else {
        _userService.logout();
        // setError('❌ Erro ao fazer login com o Google');
      }
    } on AuthException catch (e, s) {
      log('❌ Error: $e', stackTrace: s);

      _userService.logout();
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
