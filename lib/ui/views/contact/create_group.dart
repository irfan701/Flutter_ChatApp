import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/models/ChatModel.dart';
import 'package:chat_app_wechat/ui/views/components/avatar_card.dart';
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
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson),
    ChatModel(
        name: "Bristy",
        isGroup: false,
        currentMessage: "Nothing",
        time: "9.00",
        icon: svgPerson)
  ];

  List groupMember = [];

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
      body: Stack(children: [
        ListView.builder(
          itemCount: _chats.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: groupMember.length > 0 ? 90 : 10,
              );
            }

            var items = _chats[index - 1];

            return InkWell(
              onTap: () {
                if (items.select == false) {
                  items.select = true;
                  groupMember.add(items);
                  print(groupMember);
                } else {
                  items.select = false;
                  groupMember.remove(items);
                }
                setState(() {});
              },
              child: ContactCard(
                items: items,
              ),
            );
          },
        ),
        groupMember.length > 0
            ? Column(
                children: [
                  Container(
                    height: 75,
                    color: Colors.white,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _chats.length,
                        itemBuilder: (_, index) {
                          if (_chats[index].select == true) {
                            return InkWell(
                                onTap: () {
                                  groupMember.remove(_chats[index]);
                                  _chats[index].select = false;
                                  setState(() {});
                                },
                                child: avatarCard(_chats[index]));
                          } else {
                            return Container();
                          }
                        }),
                  ),
                  Divider(
                    thickness: 1,
                  )
                ],
              )
            : Container(),
      ]),
    );
  }
}
