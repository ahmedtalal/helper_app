import 'package:flutter/material.dart';
import 'package:saied_app/src/config/screen_size.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'button_comp.dart';
import 'text_form_comp.dart';

class LoginFormComp extends StatelessWidget {
  const LoginFormComp({Key? key}) : super(key: key);
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
            "nice to see you again,if you have an account you can login from here",
            style: TextStyle(
              fontSize: 15,
              fontFamily: Constants.fontApp,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 15),
          TextFormComp(
            hinttitle: 'Enter your email',
            labelTitle: 'Email',
            onChangeListener: (newValue) {},
            onValidateListenser: (String? value) {
              if (value!.isEmpty) {
                return "this field is required";
              }
              return null;
            },
            prefixIconData: Icons.email,
          ),
          const SizedBox(height: 15),
          TextFormComp(
            hinttitle: 'Enter your password',
            labelTitle: 'Password',
            onChangeListener: (newValue) {},
            onValidateListenser: (String? value) {
              if (value!.isEmpty) {
                return "this field is required";
              }
              return null;
            },
            prefixIconData: Icons.lock,
          ),
          Container(
            width: ScreenSizeConfig.fullWidthScreen(context),
            height: ScreenSizeConfig.setScreenHeight(context, 0.045),
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                /// move ip forget password page here
              },
              child: const Text(
                "Forgot Password ?",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: Constants.fontApp,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          ButtonComp(
            title: "Login",
            onClick: () {},
            btnColor: ColorsApp.backgroundColor,
          )
        ],
      ),
    );
  }
}
