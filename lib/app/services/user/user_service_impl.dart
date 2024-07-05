import 'package:firebase_auth/firebase_auth.dart';
import 'package:saldo_sabio/app/repositories/user/user_repository.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;

  UserServiceImpl({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<User?> googleProviderSignIn() =>
      _userRepository.googleProviderSignIn();

  @override
  Future<User?> login(String email, String password) =>
      _userRepository.login(email, password);

  @override
  Future<void> logout() => _userRepository.logout();

  @override
  Future<User?> register(String email, String password) =>
      _userRepository.register(email, password);
}
