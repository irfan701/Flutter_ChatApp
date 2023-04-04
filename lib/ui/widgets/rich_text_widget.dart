import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:flutter/gestures.dart';

Widget RichTextWidget(
    {text,
    text1,
    text2,
    text3,
    color,
    color1,
    color2,
    color3,
    fontSize,
    fontFamily,
    routeName}) {
  return RichText(
      text: TextSpan(
    text: text,
    style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily),
    children: [
      TextSpan(
        text: text1,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            color: color1,
            fontFamily: fontFamily),
      ),
      TextSpan(
        text: text2,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            color: color2,
            fontFamily: fontFamily),
      ),
      TextSpan(
          text: text3,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
              color: color3,
              fontFamily: fontFamily),
          recognizer: TapGestureRecognizer()
            ..onTap = () => Get.toNamed(routeName)),
    ],
  ));
}
