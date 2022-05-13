import 'package:flutter/material.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';

import '../../../components/login_form_comp.dart';
import '../../../components/register_form_comp.dart';

abstract class AuthSectionStates {
  const AuthSectionStates();
}

class AuthSectionInitialState extends AuthSectionStates {
  const AuthSectionInitialState();
  Widget getLoginSection() => const LoginFormComp();
}

class LoginSectionState extends AuthSectionStates {
  const LoginSectionState();
  Widget getLoginSection() => const LoginFormComp();
}

class RegisterSectionState extends AuthSectionStates {
  const RegisterSectionState();
  Widget getRegisterSection() => const RegisterFormComp();
}

class AuthSectionErrorState extends AuthSectionStates {
  const AuthSectionErrorState();
  Widget loginError() => const CircularProgressIndicator(
        color: ColorsApp.backgroundColor,
        strokeWidth: 3,
        value: 5,
      );
}
