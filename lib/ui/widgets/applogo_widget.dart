import 'package:chat_app_wechat/ui/consts/consts.dart';

Widget applogoWidget() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        icAppLogo,
        width: 77.w,
        height: 77.h,
      ),
    ),
    decoration: BoxDecoration(
        color: whiteColor, borderRadius: BorderRadius.circular(10.r)),
  );
}
