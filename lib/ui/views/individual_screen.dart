import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualScreen extends StatefulWidget {
  IndividualScreen({required this.items});

  final items;

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  // RxBool show = false.obs;
  TextEditingController _emojiController = TextEditingController();
  FocusNode focusNode = FocusNode();
  var show = false;

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        show = false;
        setState(() {});
      }
    });
    super.initState();
  }

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
                  widget.items.isGroup == true ? svgGroups : svgPerson,
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
                    label: widget.items.name,
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
        child: WillPopScope(
          child: Stack(
            children: [
              // Obx(
              //   () => ElevatedButton(
              //       onPressed: () => show.value == false
              //           ? show.value = true
              //           : show.value = false,
              //       //  show.value != show.value;

              //       child: Text("KEY")),
              // ),
              ListView(),
              //TextField(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  controller: _emojiController,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      prefixIcon: IconButton(
                                          onPressed: () {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            show = !show;
                                            setState(() {});
                                          },
                                          icon: Icon(Icons.emoji_emotions)),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (builder) =>
                                                        bottomSheet());
                                              },
                                              icon: Icon(Icons.attach_file)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.camera_alt))
                                        ],
                                      )),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, right: 5, left: 2),
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
                    // emojiSelect(),

                    show
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: 270.h,
                            child: emojiSelect(_emojiController),
                          )
                        : Container()
                  ],
                ),
              )
            ],
          ),
          onWillPop: () {
            if (show) {
              show = false;
              setState(() {});
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }
}

Widget emojiSelect(_emojiController) {
  return EmojiPicker(
    onEmojiSelected: (category, emoji) {
      _emojiController.text = _emojiController.text + emoji.emoji;

      //  print(emoji);
    },
    onBackspacePressed: () {
      // Do something when the user taps the backspace button (optional)
      // Set it to null to hide the Backspace-Button
    },
    config: Config(
      columns: 7,

      //    emojiSizeMax: 32 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
      // verticalSpacing: 0,
//horizontalSpacing: 0,
      //  gridPadding: EdgeInsets.zero,
      //  initCategory: Category.RECENT,
      // bgColor: Colors.black,
      indicatorColor: Colors.blue,
      iconColor: Colors.grey,
      iconColorSelected: Colors.blue,
      backspaceColor: Colors.blue,
      skinToneDialogBgColor: Colors.white,
      skinToneIndicatorColor: Colors.grey,
      enableSkinTones: true,
      showRecentsTab: true,
      recentsLimit: 28,
      noRecents: const Text(
        'No Recents',
        style: TextStyle(fontSize: 20, color: Colors.black26),
        textAlign: TextAlign.center,
      ), // Needs to be const Widget
      loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
      tabIndicatorAnimDuration: kTabScrollDuration,
      categoryIcons: const CategoryIcons(),
      buttonMode: ButtonMode.MATERIAL,
    ),
  );
}

Widget bottomSheet() {
  return Container(
    height: 200,
    width: 200,
    color: Colors.amber,
  );
}
