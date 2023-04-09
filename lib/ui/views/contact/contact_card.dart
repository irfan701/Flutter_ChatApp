import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  ContactCard({super.key, this.items});
  var items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 53,
            width: 50,
            child: Stack(children: [
              CircleAvatar(
                child: SvgPicture.asset(
                  items.isGroup == true ? svgGroups : svgPerson,
                  color: Colors.white,
                  width: 30.w,
                  height: 30.h,
                ),
                backgroundColor: Colors.blueGrey[200],
                radius: 23.r,
              ),
              items.select
                  ? Positioned(
                      bottom: 4,
                      right: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 11,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    )
                  : Container()
            ]),
          ),
          title: TextStyleWidget(
              label: items.name, fontSize: 15.sp, fontWeight: FontWeight.bold),
          subtitle:
              TextStyleWidget(label: items.currentMessage, fontSize: 13.sp),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 20, left: 80),
        //   child: Divider(
        //     thickness: 1.5,
        //   ),
        // )
      ],
    );
  }
}
