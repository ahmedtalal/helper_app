import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_evetns.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc() : super(const AuthInitialState()) {
    on<RegisterEvent>(_registerSection);
    on<LoginEvent>(_loginSection);
  }

  FutureOr<void> _registerSection(
      RegisterEvent event, Emitter<AuthStates> emit) async {
    try {
      emit(const RegisterState());
    } catch (e) {
      emit(const AuthErrorState());
    }
  }

  FutureOr<void> _loginSection(
      LoginEvent event, Emitter<AuthStates> emit) async {
    try {
      emit(const LoginState());
    } catch (e) {
      emit(const AuthErrorState());
    }
  }
}
