import 'package:firebase_auth/firebase_auth.dart';

abstract interface class UserService {
  Future<User?> register(String email, String password);
  Future<User?> login(String email, String password);
  Future<User?> googleProviderSignIn();
  Future<void> logout();
}
