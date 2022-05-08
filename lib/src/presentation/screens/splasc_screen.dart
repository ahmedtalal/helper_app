import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saied_app/src/config/screen_size.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'package:saied_app/src/presentation/components/button_comp.dart';
import 'package:saied_app/src/presentation/logic/providers/app_theme_provider.dart';
import 'package:saied_app/src/presentation/screens/auth/auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenSizeConfig.fullHeightScreen(context),
        width: ScreenSizeConfig.fullWidthScreen(context),
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(
          top: ScreenSizeConfig.setScreenHeight(context, 0.12),
        ),
        child: Column(
          children: [
            Image(
              image: const AssetImage(Constants.splashScreenImg),
              height: ScreenSizeConfig.setScreenHeight(context, 0.35),
              width: ScreenSizeConfig.fullWidthScreen(context),
            ),
            SizedBox(height: ScreenSizeConfig.setScreenHeight(context, 0.035)),
            const Text(
              "Helper App",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: Constants.fontApp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: ScreenSizeConfig.setScreenHeight(context, 0.02),
            ),
            Container(
              width: ScreenSizeConfig.fullWidthScreen(context),
              alignment: Alignment.centerRight,
              child: const Text(
                Constants.splashDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: Constants.fontApp,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ),
            SizedBox(height: ScreenSizeConfig.setScreenHeight(context, 0.1)),
            ButtonComp(
              title: "Get Started",
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                );
              },
              btnColor: ColorsApp.bodySectionColor,
            ),
            Consumer<AppThemeProvider>(
              builder: (context, value, child) {
                return ElevatedButton(
                    onPressed: () {
                      value.setTheme();
                    },
                    child: Text("data"));
              },
            )
          ],
        ),
      ),
    );
  }
}
