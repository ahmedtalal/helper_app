import 'package:flutter/material.dart';
import 'package:saied_app/src/config/screen_size.dart';
<<<<<<< HEAD
=======
import 'package:saied_app/src/core/utils/colors_app.dart';
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
import '../../core/utils/constants.dart';

class ButtonComp extends StatelessWidget {
  final VoidCallback? onClick;
  final String? title;
  final Color? btnColor;
  const ButtonComp({
    Key? key,
    required this.title,
    required this.onClick,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: btnColor,
          elevation: 3,
          fixedSize: Size(
            ScreenSizeConfig.setScreenwidth(context, 0.85),
            ScreenSizeConfig.setScreenHeight(context, 0.078),
          ),
        ),
        onPressed: onClick!,
        child: Text(
          title!,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: Constants.fontApp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
