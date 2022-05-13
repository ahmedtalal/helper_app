<<<<<<< HEAD
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'package:saied_app/src/data/models/user_model.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth/auth_bloc.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth/auth_states.dart';
import 'package:saied_app/src/presentation/logic/blocs/actions/implementations/fire_auth_actions_provider_imp.dart';
import '../logic/blocs/actions/actions_helper.dart';
=======
import 'package:flutter/material.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';
import 'package:saied_app/src/core/utils/constants.dart';
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
import 'button_comp.dart';
import 'text_form_comp.dart';

class RegisterFormComp extends StatelessWidget {
  const RegisterFormComp({Key? key}) : super(key: key);
  static var formKey = GlobalKey<FormState>();
<<<<<<< HEAD
  static late String _name, _email, _password;
=======

>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 30,
              fontFamily: Constants.fontApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Nice to see you in our app,here is the register page and you can create new account from here",
            style: TextStyle(
              fontSize: 15,
              fontFamily: Constants.fontApp,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 15),
          TextFormComp(
            hinttitle: 'Enter your name',
            labelTitle: 'Full Name',
<<<<<<< HEAD
            onChangeListener: (newValue) {
              _name = newValue.toString();
            },
            onValidateListenser: (String? value) {
              if (value!.isEmpty) {
                return "this field is required";
              }
              return null;
            },
=======
            onChangeListener: (newValue) {},
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
            prefixIconData: Icons.person,
          ),
          const SizedBox(height: 15),
          TextFormComp(
            hinttitle: 'Enter your email',
            labelTitle: 'Email',
<<<<<<< HEAD
            onChangeListener: (newValue) {
              _email = newValue.toString();
            },
            prefixIconData: Icons.email,
            onValidateListenser: (String? value) {
              if (value!.isEmpty) {
                return "this field is required";
              }
              return null;
            },
=======
            onChangeListener: (newValue) {},
            prefixIconData: Icons.email,
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
          ),
          const SizedBox(height: 20),
          TextFormComp(
            hinttitle: 'Enter your password',
            labelTitle: 'Password',
<<<<<<< HEAD
            onChangeListener: (newValue) {
              _password = newValue.toString();
            },
            onValidateListenser: (String? value) {
              if (value!.isEmpty) {
                return "this field is required";
              }
              return null;
            },
            prefixIconData: Icons.lock,
          ),
          const SizedBox(height: 20),
          BlocConsumer<AuthBloc, AuthStates>(
            listener: (context, state) {
              if (state is AuthLoadedState) {
                state.afterSuccessAuth(context);
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return state.authLoadingOperation();
              } else if (state is AuthErrorState) {
                return state.errorAuthOperation();
              } else {
                return ButtonComp(
                  title: "Register",
                  onClick: () {
                    UserModel userModel = UserModel(
                      name: _name,
                      email: _email,
                      password: _password,
                      photo: " ",
                    );
                    ActionsHelper<FireAuthActionsProviderImp>()
                        .initActionProvider(FireAuthActionsProviderImp())
                        .onRegisterClick(context, formKey, userModel);
                  },
                  btnColor: ColorsApp.backgroundColor,
                );
              }
            },
          ),
=======
            onChangeListener: (newValue) {},
            prefixIconData: Icons.lock,
          ),
          const SizedBox(height: 20),
          ButtonComp(
            title: "Register",
            onClick: () {},
            btnColor: ColorsApp.backgroundColor,
          )
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
        ],
      ),
    );
  }
}
