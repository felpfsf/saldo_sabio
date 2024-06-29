import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saldo_sabio/app/core/exceptions/auth_exception.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _auth;

  UserRepositoryImpl({
    required FirebaseAuth auth,
  }) : _auth = auth;

  // emoji green check mark outlined ✅
  // emoji red x outlined ❌
  // emoji check mark ✔️

  @override
  Future<User?> googleProviderSignIn() async {
    final googleSignIn = GoogleSignIn();
    final user = await googleSignIn.signIn();

    if (user == null) {
      throw AuthError(message: '❌ Usuário não cadastrado');
    }

    final googleAuth = await user.authentication;

    final fbCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    var userCredential = await _auth.signInWithCredential(fbCredential);

    try {
      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      log('❌ Erro ao fazer login com o google', error: e, stackTrace: s);

      if (e.code == 'accout-exists-with-different-credential') {
        throw AuthError(
          message: '❌ Usuário já cadastrado com outra conta - ${e.message}',
        );
      }
      throw AuthError(
        message: e.message ?? '❌ Erro ao fazer login com o google',
      );
    }
  }

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      log('❌ Erro ao cadastrar usuário', error: e, stackTrace: s);
      if (e.code == 'email-already-in-use') {
        throw AuthError(message: '❌ Email já cadastrado');
      }
      throw AuthError(message: e.message ?? '❌ Erro ao cadastrar usuário');
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      log('❌ Erro ao logar usuário', error: e, stackTrace: s);

      if (e.code == 'invalid-crendential') {
        throw AuthError(message: 'Usuário ou senha inválidos');
      }
      throw AuthError(message: e.message ?? 'Erro ao logar usuário');
    } on PlatformException catch (e, s) {
      log('❌ Erro ao fazer login', error: e, stackTrace: s);
      throw AuthError(message: e.message ?? '❌ Erro ao fazer login');
    }
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    _auth.signOut();
  }
}
