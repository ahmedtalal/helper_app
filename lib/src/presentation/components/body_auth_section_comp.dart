import 'package:flutter/material.dart';
import 'package:saied_app/src/config/screen_size.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'social_links_btn_comp.dart';

class BodyAuthSectionComp extends StatelessWidget {
  const BodyAuthSectionComp({
    Key? key,
    required this.loginSection,
  }) : super(key: key);

  final Widget? loginSection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          children: [
            loginSection!,
            const SizedBox(height: 10),
            Container(
              height: ScreenSizeConfig.setScreenHeight(context, 0.08),
              width: ScreenSizeConfig.fullWidthScreen(context),
              decoration: const BoxDecoration(
                border: BorderDirectional(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLinksBtn(
                    image: Constants.facebookImg,
                    onClickBtn: () {},
                  ),
                  SocialLinksBtn(
                    image: Constants.googleImg,
                    onClickBtn: () {},
                  ),
                  SocialLinksBtn(
                    image: Constants.twitterImg,
                    onClickBtn: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
