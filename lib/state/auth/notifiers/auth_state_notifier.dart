import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zaad/state/auth/backend/authenticator.dart';
import 'package:zaad/state/auth/models/auth_result.dart';
import 'package:zaad/state/auth/models/auth_state.dart';

// This File Handel *** THE STATE *** So We Know Our States
class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
          results: AuthResults.success,
          isLoading: false,
          userId: _authenticator.userId);
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResults.success && userId != null) {
       
    }
  }
}
