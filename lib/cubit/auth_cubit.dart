import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  void login() async {
    emit(state.copyWith(loginState: LoginState.loading));
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(loginState: LoginState.loggedIn));
  }

  void logout() async {
    emit(state.copyWith(logOutState: LogoutState.loading));
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(logOutState: LogoutState.loggedOut));
  }
}
