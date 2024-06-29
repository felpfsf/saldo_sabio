import 'package:firebase_auth/firebase_auth.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  @override
  Future<User?> googleProviderSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  @override
  Future<User?> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User?> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
