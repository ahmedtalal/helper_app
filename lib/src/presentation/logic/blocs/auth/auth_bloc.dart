<<<<<<< HEAD
// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'package:saied_app/src/data/models/user_model.dart';
import 'package:saied_app/src/domain/entities/user_entity.dart';
import 'package:saied_app/src/domain/repositories/global/i_auth_repository.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth/auth_events.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth/auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final IAuthRepository? _iAuthRepo;
  UserEntity model = const UserModel();
  AuthBloc(this._iAuthRepo) : super(const AuthInitialState()) {
    on<LoginEvent>(_loginAction);
    on<RegisterEvent>(_registerAction);
    on<ForgetPasswordEvent>(_forgetPasswordAction);
    on<CheckCurrentUserEvent>(_checkCurrentUserAction);
    on<LogOutEvent>(_logOutAction);
  }

  FutureOr<void> _loginAction(LoginEvent event, Emitter<AuthStates> emit) {
    emit(const AuthLoadingState());
    Map<String, dynamic> result = _iAuthRepo!.login(model);
    if (result["response"] == Constants.successResponseType) {
      emit(const AuthLoadedState());
    } else if (result["response"] == Constants.failedResponseType) {
      emit(AuthErrorState(error: result["body"]));
    } else if (result["response"] == Constants.fireAuthException) {
      emit(AuthErrorState(error: result["body"]));
    }
  }

  FutureOr<void> _registerAction(
      RegisterEvent event, Emitter<AuthStates> emit) async {
    emit(const AuthLoadingState());
    Map<String, dynamic> result = await _iAuthRepo!.register(model);
    print(
        "the result from auth bloc section is ${result[Constants.responseKey]}");
    if (result[Constants.responseKey] == Constants.successResponseType) {
      emit(const AuthLoadedState());
    } else if (result[Constants.responseKey] == Constants.failedResponseType) {
      emit(AuthErrorState(error: result[Constants.bodyKey]));
    } else if (result[Constants.responseKey] == Constants.fireAuthException) {
      emit(AuthErrorState(error: result[Constants.bodyKey]));
    }
  }

  FutureOr<void> _forgetPasswordAction(
    ForgetPasswordEvent event,
    Emitter<AuthStates> emit,
  ) {
    emit(const AuthLoadingState());
    Map<String, dynamic> result = _iAuthRepo!.forgetPassword(model);
    if (result["response"] == Constants.successResponseType) {
      emit(const SuccessUpdatePasswordState());
    } else {
      emit(AuthErrorState(error: result["body"]));
    }
  }

  FutureOr<void> _checkCurrentUserAction(
    CheckCurrentUserEvent event,
    Emitter<AuthStates> emit,
  ) {
    emit(const AuthLoadingState());
    Map<String, dynamic> result = _iAuthRepo!.checkIsAuth();
    if (result["body"]) {
      emit(const AuthLoadedState());
    } else {
      emit(const AuthErrorState(error: "No user found for that email."));
    }
  }

  FutureOr<void> _logOutAction(LogOutEvent event, Emitter<AuthStates> emit) {
    emit(const AuthLoadingState());
    Map<String, dynamic> result = _iAuthRepo!.logOut();
    if (result["response"]) {
      emit(const LogOutAuthState());
    } else {
      emit(AuthErrorState(error: result["body"]));
=======
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
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
    }
  }
}
