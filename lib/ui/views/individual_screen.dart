import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualScreen extends StatelessWidget {
  const IndividualScreen({required this.items});
  final items;

  @override
  Widget build(BuildContext context) {
    var _popUpMenuItems = [
      PopupMenuItem(
        child: Text("New Group"),
        value: '/hello',
      ),
      PopupMenuItem(
        child: Text("New Broadcast"),
        value: '/about',
      ),
      PopupMenuItem(
        child: Text("Linked Device"),
        value: '/contact',
      ),
      PopupMenuItem(
        child: Text("Starred Message"),
        value: '/contact',
      ),
      PopupMenuItem(
        child: Text("Settings"),
        value: '/contact',
      )
    ];

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 80.w,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24.sp,
              ),
              CircleAvatar(
                child: SvgPicture.asset(
                  items.isGroup == true ? svgGroups : svgPerson,
                  color: Colors.white,
                  width: 36.w,
                  height: 36.h,
                ),
                backgroundColor: Colors.blueGrey,
                radius: 20.r,
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyleWidget(
                    label: items.name,
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold),
                TextStyleWidget(
                    label: "Last seen today at 12.00PM", fontSize: 13)
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ListView(),
            //TextField(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                          margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.emoji_emotions)),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.attach_file)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.camera_alt))
                                  ],
                                )),
                          ))),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, right: 5, left: 2),
                    child: CircleAvatar(
                      backgroundColor: accentColor,
                      radius: 25.r,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: whiteColor,
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
