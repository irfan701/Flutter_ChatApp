import 'package:chat_app_wechat/ui/consts/consts.dart';

Widget TextStyleWidget(
    {label, double? fontSize, color, fontFamily, fontWeight, textAlign}) {
  return Text(label,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily,
          fontWeight: fontWeight));
}
