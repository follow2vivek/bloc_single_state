import 'package:bloc_single_state/app_button.dart';
import 'package:bloc_single_state/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => AuthCubit(), child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocSelector<AuthCubit, AuthState, LoginState>(
                selector: (state) {
                  return state.loginState;
                },
                builder: (context, state) {
                  return AppButton(
                    onTap: () {
                      context.read<AuthCubit>().login();
                    },
                    isLoading: state == LoginState.loading,
                    text: state == LoginState.loggedIn ? 'Logged In' : 'Log In',
                  );
                },
              ),
              SizedBox(height: 20),
              BlocSelector<AuthCubit, AuthState, LogoutState>(
                selector: (state) {
                  return state.logOutState;
                },
                builder: (context, state) {
                  return AppButton(
                    onTap: () {
                      context.read<AuthCubit>().logout();
                    },
                    isLoading: state == LogoutState.loading,
                    text: state == LogoutState.loggedOut
                        ? 'Logged Out'
                        : 'Log Out',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
