import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  ContactCard({super.key, this.items});
  var items;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: true,
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => IndividualScreen(items: items)));
      },
      child: Column(
        children: [
          ListTile(
            //  focusColor: golden,
            //  selectedColor: Colors.amber,
            leading: CircleAvatar(
              child: SvgPicture.asset(
                items.isGroup == true ? svgGroups : svgPerson,
                color: Colors.white,
                width: 30.w,
                height: 30.h,
              ),
              backgroundColor: Colors.blueGrey[200],
              radius: 23.r,
            ),
            title: TextStyleWidget(
                label: items.name,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
