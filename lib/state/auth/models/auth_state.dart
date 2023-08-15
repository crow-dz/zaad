import 'package:flutter/foundation.dart' show immutable;
import 'package:zaad/state/posts/typedefs/user_id.dart';

import 'auth_result.dart';

@immutable
class AuthState {
  final AuthResults? results;
  final bool isLoading;
  final UserId? userId;

 const AuthState({
    required this.results,
    required this.isLoading,
    required this.userId,
  });
  // in first signing AuthState in null
  // so we set unknown
 const AuthState.unknown()
      : results = null,
        isLoading = false,
        userId = null;

  // Changing Loading Value even with other values are  null
  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        results: results,
        isLoading: isLoading,
        userId: userId,
      );

  //  We use operator to check if is same class or not
  // override bool getter of equality
  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (results == other.results &&
          userId == other.userId &&
          isLoading == other.isLoading);

  @override
  int get hashCode => Object.hash(results, userId, isLoading);
}
