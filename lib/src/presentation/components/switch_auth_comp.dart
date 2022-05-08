import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saied_app/src/config/screen_size.dart';
import 'package:saied_app/src/presentation/logic/providers/app_theme_provider.dart';
import '../../core/utils/constants.dart';

class SwitchAuthComp extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final Color titleUnderlineColor;
  const SwitchAuthComp({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.titleUnderlineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: ScreenSizeConfig.setScreenHeight(context, 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title!,
                style: const TextStyle(
                  fontFamily: Constants.fontApp,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Container(
                width: double.infinity,
                height: 3.5,
                decoration: BoxDecoration(
                  color: titleUnderlineColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
