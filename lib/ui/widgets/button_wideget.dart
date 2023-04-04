import 'package:chat_app_wechat/ui/consts/consts.dart';

Widget BtnWidget({label, backgroundColor, textColor, onPressed}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, padding: EdgeInsets.all(12)),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontFamily: bold, color: textColor),
      ));
}
