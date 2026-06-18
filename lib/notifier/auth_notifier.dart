import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:self_learn8/Repository/auth_repository.dart';
import 'package:self_learn8/model/auth_state.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authProvider = StateNotifierProvider(
  (ref) => AuthNotifier(ref.read(authRepositoryProvider)),
);

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;

  AuthNotifier(this.repository) : super(const AuthState());

  // 1. Future as Login
  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(isloading: true, error: null);

      final success = await repository.login(email, password);
      state = state.copyWith(isloading: false, islogged: success);
    } catch (e) {
      state = state.copyWith(isloading: false, error: e.toString());
    }
  }

  void logout() {
    state = const AuthState();
  }
}
