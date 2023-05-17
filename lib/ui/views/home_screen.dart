import 'package:camera/camera.dart';
import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/views/camera_screen.dart';
import 'package:chat_app_wechat/ui/views/chat/chat_screen.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.camera,
  });
  final CameraDescription camera;
  @override
  Widget build(BuildContext context) {
    var _tabs = [
      Tab(
        icon: Icon(Icons.camera_alt),
      ),
      Tab(
        text: "CHATS",
      ),
      Tab(
        text: "STATUS",
      ),
      Tab(
        text: "CALLS",
      ),
    ];

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

    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: TextStyleWidget(label: "WhatsApp"),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
              PopupMenuButton(
                onSelected: (Value) {
                  print(Value);
                },
                itemBuilder: (BuildContext context) {
                  return _popUpMenuItems;
                },
              )
            ],
            bottom: TabBar(indicatorColor: whiteColor, tabs: _tabs),
          ),
          body: TabBarView(
            children: [
              CameraScreen(cameras: camera),
              ChatScreen(),
              Container(
                color: lightGrey,
              ),
              Container(
                color: redColor,
              )
            ],
          ),
        ));
  }
}
