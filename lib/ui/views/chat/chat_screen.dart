import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/models/ChatModel.dart';
import 'package:chat_app_wechat/ui/views/contact/select_contact.dart';

import 'package:chat_app_wechat/ui/views/individual_screen.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

// https://fonts.google.com/icons?selected=Material+Icons:person:&icon.query=person
//https://pub.dev/packages/flutter_svg/install

class ChatScreen extends StatelessWidget {
  // ChatScreen({required this.chatModel});
//  final ChatModel ChatModel;

  List<ChatModel> _chats = [
    ChatModel(
        name: "Irfan",
        isGroup: false,
        currentMessage: "Hi Everyone",
        time: "4.00",
        icon: svgPerson),
    ChatModel(
        name: "Aziz",
        isGroup: false,
        currentMessage: "Hlw",
        time: "5.00",
        icon: svgPerson),
    ChatModel(
        name: "Tanisa",
        isGroup: false,
        currentMessage: "I am not well",
        time: "6.00",
        icon: svgPerson),
    ChatModel(
        name: "Mukta",
        isGroup: true,
        currentMessage: "well-wisher",
        time: "7.00",
        icon: svgGroups),
    ChatModel(
        name: "Sabrina",
        isGroup: true,
        currentMessage: "Hi Mukta",
        time: "8.00",
        icon: svgGroups),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          var items = _chats[index];
          return InkWell(
            // hoverColor: Colors.red,
            // focusColor: Colors.green,
            autofocus: true,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IndividualScreen(items: items)));
            },
            child: Column(
              children: [
                ListTile(
                  //  focusColor: golden,
                  selectedColor: Colors.amber,
                  leading: CircleAvatar(
                    child: SvgPicture.asset(
                      items.isGroup == true ? svgGroups : svgPerson,
                      color: Colors.white,
                      width: 36.w,
                      height: 36.h,
                    ),
                    backgroundColor: Colors.blueGrey,
                    radius: 25.r,
                  ),
                  title: TextStyleWidget(
                      label: _chats[index].name,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                  subtitle: Row(
                    children: [
                      Icon(Icons.done_all),
                      SizedBox(
                        width: 5.w,
                      ),
                      TextStyleWidget(
                          label: items.currentMessage, fontSize: 13.sp)
                    ],
                  ),
                  trailing: Text("${items.time}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 80),
                  child: Divider(
                    thickness: 1.5,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
