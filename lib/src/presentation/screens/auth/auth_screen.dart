import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';
<<<<<<< HEAD
import 'package:saied_app/src/presentation/logic/blocs/auth_section/auth_section_bloc.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth_section/auth_section_evetns.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth_section/auth_section_states.dart';
import '../../components/body_auth_section_comp.dart';
import '../../components/logo_auth_section_comp.dart';
=======
import '../../components/body_auth_section_comp.dart';
import '../../components/logo_auth_section_comp.dart';
import '../../logic/blocs/auth/auth_bloc.dart';
import '../../logic/blocs/auth/auth_evetns.dart';
import '../../logic/blocs/auth/auth_states.dart';
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static Widget? loginSection;
  static Color? loginedColor;
  static Color? registeredColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
<<<<<<< HEAD
            child: BlocBuilder<AuthSectionBloc, AuthSectionStates>(
              builder: (context, state) {
                if (state is AuthSectionInitialState) {
                  loginSection = state.getLoginSection();
                  loginedColor = ColorsApp.underlineColor;
                  registeredColor = ColorsApp.backgroundColor;
                } else if (state is LoginSectionState) {
                  loginSection = state.getLoginSection();
                  loginedColor = ColorsApp.underlineColor;
                  registeredColor = ColorsApp.backgroundColor;
                } else if (state is RegisterSectionState) {
                  loginSection = state.getRegisterSection();
                  loginedColor = ColorsApp.backgroundColor;
                  registeredColor = ColorsApp.underlineColor;
                } else if (state is AuthSectionErrorState) {
=======
            child: BlocBuilder<AuthBloc, AuthStates>(
              builder: (context, state) {
                if (state is AuthInitialState) {
                  loginSection = state.getLoginSection();
                  loginedColor = ColorsApp.underlineColor;
                  registeredColor = ColorsApp.backgroundColor;
                } else if (state is LoginState) {
                  loginSection = state.getLoginSection();
                  loginedColor = ColorsApp.underlineColor;
                  registeredColor = ColorsApp.backgroundColor;
                } else if (state is RegisterState) {
                  loginSection = state.getRegisterSection();
                  loginedColor = ColorsApp.backgroundColor;
                  registeredColor = ColorsApp.underlineColor;
                } else if (state is AuthErrorState) {
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
                  loginSection = state.loginError();
                  loginedColor = ColorsApp.underlineColor;
                  registeredColor = ColorsApp.backgroundColor;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LogoAuthSectionComp(
                      loginonPressed: () {
<<<<<<< HEAD
                        context
                            .read<AuthSectionBloc>()
                            .add(LoginSectionEvent());
                      },
                      registeronPressed: () {
                        context
                            .read<AuthSectionBloc>()
                            .add(RegisterSectionEvent());
=======
                        context.read<AuthBloc>().add(LoginEvent());
                      },
                      registeronPressed: () {
                        context.read<AuthBloc>().add(RegisterEvent());
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
                      },
                      loginedColor: loginedColor!,
                      registeredColor: registeredColor!,
                    ),
                    BodyAuthSectionComp(loginSection: loginSection),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
