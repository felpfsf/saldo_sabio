import 'dart:developer';

import 'package:saldo_sabio/app/core/exceptions/auth_exception.dart';
import 'package:saldo_sabio/app/core/notifier/sd_sb_change_notifier.dart';
import 'package:saldo_sabio/app/services/user/user_service.dart';

class RegisterController extends SdSbChangeNotifier {
  final UserService _userService;

  RegisterController({
    required UserService userService,
  }) : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAdnResetState();
      notifyListeners();
      final user = await _userService.register(email, password);

      if (user != null) {
        success();
      } else {
        setError('❌ Erro ao cadastrar usuário');
      }
    } on AuthException catch (e, s) {
      log('❌ Error: $e', stackTrace: s);
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
