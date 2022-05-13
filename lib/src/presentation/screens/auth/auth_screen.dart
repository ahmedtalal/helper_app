import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth_section/auth_section_bloc.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth_section/auth_section_evetns.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth_section/auth_section_states.dart';
import '../../components/body_auth_section_comp.dart';
import '../../components/logo_auth_section_comp.dart';

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
                        context
                            .read<AuthSectionBloc>()
                            .add(LoginSectionEvent());
                      },
                      registeronPressed: () {
                        context
                            .read<AuthSectionBloc>()
                            .add(RegisterSectionEvent());
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
