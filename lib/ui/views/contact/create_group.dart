import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/models/ChatModel.dart';
import 'package:chat_app_wechat/ui/views/contact/contact_card.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyleWidget(
                label: "New group", fontSize: 19, fontWeight: FontWeight.bold),
            TextStyleWidget(label: "Add Participants", fontSize: 13),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              )),
        ],
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          var items = _chats[index];
          return InkWell(
            onTap: () {
              if (items.select == false) {
                items.select = true;
                groups.add(items);
              } else {
                items.select = false;
                groups.remove(items);
              }
              setState(() {});
            },
            child: ContactCard(
              items: items,
            ),
          );
        },
      ),
    );
  }
}
