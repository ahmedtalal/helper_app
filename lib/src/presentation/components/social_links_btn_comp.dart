import 'package:flutter/material.dart';

class SocialLinksBtn extends StatelessWidget {
  final String? image;
  final VoidCallback? onClickBtn;
  const SocialLinksBtn(
      {Key? key, required this.image, required this.onClickBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClickBtn!,
      icon: Image(
        image: AssetImage(image!),
        height: 30,
      ),
    );
  }
}
