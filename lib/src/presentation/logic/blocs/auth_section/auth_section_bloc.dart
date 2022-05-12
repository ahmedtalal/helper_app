import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_section_evetns.dart';
import 'auth_section_states.dart';

class AuthSectionBloc extends Bloc<AuthSectionEvents, AuthSectionStates> {
  AuthSectionBloc() : super(const AuthSectionInitialState()) {
    on<RegisterSectionEvent>(_registerSection);
    on<LoginSectionEvent>(_loginSection);
  }

  FutureOr<void> _registerSection(
      RegisterSectionEvent event, Emitter<AuthSectionStates> emit) async {
    try {
      emit(const RegisterSectionState());
    } catch (e) {
      emit(const AuthSectionErrorState());
    }
  }

  FutureOr<void> _loginSection(
      LoginSectionEvent event, Emitter<AuthSectionStates> emit) async {
    try {
      emit(const LoginSectionState());
    } catch (e) {
      emit(const AuthSectionErrorState());
    }
  }
}
