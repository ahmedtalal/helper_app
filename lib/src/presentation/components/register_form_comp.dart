import 'package:flutter/material.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'button_comp.dart';
import 'text_form_comp.dart';

class RegisterFormComp extends StatelessWidget {
  const RegisterFormComp({Key? key}) : super(key: key);
  static var formKey = GlobalKey<FormState>();

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
            onChangeListener: (newValue) {},
            prefixIconData: Icons.person,
          ),
          const SizedBox(height: 15),
          TextFormComp(
            hinttitle: 'Enter your email',
            labelTitle: 'Email',
            onChangeListener: (newValue) {},
            prefixIconData: Icons.email,
          ),
          const SizedBox(height: 20),
          TextFormComp(
            hinttitle: 'Enter your password',
            labelTitle: 'Password',
            onChangeListener: (newValue) {},
            prefixIconData: Icons.lock,
          ),
          const SizedBox(height: 20),
          ButtonComp(
            title: "Register",
            onClick: () {},
            btnColor: ColorsApp.backgroundColor,
          )
        ],
      ),
    );
  }
}
