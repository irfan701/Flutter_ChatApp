import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/consts.dart';

Widget avatarCard(items) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(children: [
          CircleAvatar(
            child: SvgPicture.asset(
              //   items.isGroup == true ? svgGroups : svgPerson,
              svgPerson,
              color: Colors.white,
              width: 30.w,
              height: 30.h,
            ),
            backgroundColor: Colors.blueGrey[200],
            radius: 23.r,
          ),
          //  items.select ?
          Positioned(
            bottom: 4,
            right: 5,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 11,
              child: Icon(
                Icons.clear,
                color: Colors.white,
                size: 13,
              ),
            ),
          )
          // : Container()
        ]),
        SizedBox(
          height: 2,
        ),
        TextStyleWidget(label: items.name, fontSize: 12),
      ],
    ),
  );
}
