import 'package:chat_app_wechat/ui/consts/consts.dart';

Widget TextStyleWidget(
    {label, double? fontSize, color, fontFamily, fontWeight}) {
  return Text(label,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily,
          fontWeight: fontWeight));
}
