import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';

Widget homeBtnWidget(
    {double? width, double? height, iconName, label, onPressed}) {
  return Container(
    // padding: EdgeInsets.on(10),
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: whiteColor, borderRadius: BorderRadius.circular(10.r)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconName,
          width: 26.w,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextStyleWidget(
            label: label, fontFamily: semibold, color: darkFontGrey),
      ],
    ),
  );
}
