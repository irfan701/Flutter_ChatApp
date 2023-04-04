import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: TextStyleWidget(label: "WhatsApp"),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
            ],
            bottom: TabBar(tabs: _tabs),
          ),
          body: TabBarView(
            children: [
              Container(
                color: redColor,
              ),
              Container(
                color: fontGrey,
              ),
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
