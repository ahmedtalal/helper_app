import 'package:flutter/material.dart';
import 'package:saied_app/src/config/screen_size.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';
import '../../core/utils/constants.dart';
import 'switch_auth_comp.dart';

class LogoAuthSectionComp extends StatelessWidget {
  final VoidCallback loginonPressed;
  final VoidCallback registeronPressed;
  final Color loginedColor;
  final Color registeredColor;
  const LogoAuthSectionComp({
    Key? key,
    required this.loginonPressed,
    required this.registeronPressed,
    required this.loginedColor,
    required this.registeredColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        height: ScreenSizeConfig.setScreenHeight(context, 0.32),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: ScreenSizeConfig.setScreenHeight(context, 0.08),
            ),
            Container(
              width: ScreenSizeConfig.setScreenwidth(context, 0.21),
              height: ScreenSizeConfig.setScreenHeight(context, 0.11),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorsApp.logoColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image(
                height: ScreenSizeConfig.setScreenHeight(context, 0.07),
                color: Colors.white,
                fit: BoxFit.fill,
                width: ScreenSizeConfig.setScreenwidth(context, 0.08),
                image: const AssetImage(Constants.xLogo),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchAuthComp(
                  title: "Login",
                  onPressed: loginonPressed,
                  titleUnderlineColor: loginedColor,
                ),
                SwitchAuthComp(
                  title: "Register",
                  onPressed: registeronPressed,
                  titleUnderlineColor: registeredColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
