import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/models/ChatModel.dart';
import 'package:chat_app_wechat/ui/views/contact/button_card.dart';
import 'package:chat_app_wechat/ui/views/contact/contact_card.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';
import 'package:flutter_svg/svg.dart';

class SelectContact extends StatelessWidget {
  SelectContact({super.key});

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
    var _popUpMenuItems = [
      PopupMenuItem(
        child: Text("Invite a friend"),
        value: '/hello',
      ),
      PopupMenuItem(
        child: Text("Contacts"),
        value: '/contacts',
      ),
      PopupMenuItem(
        child: Text("Refresh"),
        value: '/refresh',
      ),
      PopupMenuItem(
        child: Text("Help"),
        value: '/help',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyleWidget(
                label: "Select Contact",
                fontSize: 19,
                fontWeight: FontWeight.bold),
            TextStyleWidget(label: "256 Contacts", fontSize: 13),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton(
            onSelected: (Value) {
              print(Value);
            },
            itemBuilder: (BuildContext context) {
              return _popUpMenuItems;
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _chats.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ButtonCard(icon: Icons.group, name: "New Group");
          } else if (index == 1) {
            return ButtonCard(icon: Icons.person, name: "New Contact");
          }
          var items = _chats[index - 2];
          return ContactCard(
            items: items,
          );
        },
      ),
    );
  }
}
