part of "auth_bloc.dart";

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final fbAuth.User? user;
  AuthState({required this.authStatus, this.user});

  factory AuthState.unknown() {
    return AuthState(authStatus: AuthStatus.unknown);
  }

  @override
  String toString() {
    return 'AuthState{authStatus: $authStatus, user: $user}';
  }

  @override
  List<Object?> get props => [authStatus, user]; //used ? because it can be null

  AuthState copyWith({AuthStatus? authStatus, fbAuth.User? user}) {
    return AuthState(
        authStatus: authStatus ?? this.authStatus, user: user ?? this.user);
  }
}
