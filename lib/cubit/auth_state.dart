part of 'auth_cubit.dart';

enum LoginState { loading, error, loggedIn, none }

enum LogoutState { loading, error, loggedOut, none }

class AuthState extends Equatable {
  final LoginState loginState;
  final LogoutState logOutState;
  const AuthState({required this.loginState, required this.logOutState});
  
  factory AuthState.initial() {
    return const AuthState(
      loginState: LoginState.none,
      logOutState: LogoutState.none,
    );
  }
  AuthState copyWith({LoginState? loginState, LogoutState? logOutState}) {
    return AuthState(
      loginState: loginState ?? this.loginState,
      logOutState: logOutState ?? this.logOutState,
    );
  }

  @override
  List<Object> get props => [loginState, logOutState];
}
