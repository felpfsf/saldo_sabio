import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:saldo_sabio/app/core/navigators/sd_sb_navigator.dart';
import 'package:saldo_sabio/app/services/user/user_service.dart';

class SdSbAuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth;
  final UserService _userService;

  SdSbAuthProvider({
    required FirebaseAuth auth,
    required UserService userService,
  })  : _auth = auth,
        _userService = userService;

  Future<void> logout() => _userService.logout();
  User? get currentUser => _auth.currentUser;

  void loadListener() {
    _auth.userChanges().listen((_) => notifyListeners());
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        SdSbNavigator.to.pushNamedAndRemoveUntil(
          '/home',
          (route) => false,
        );
      } else {
        SdSbNavigator.to.pushNamedAndRemoveUntil(
          '/login',
          (route) => false,
        );
      }
    });
  }
}
