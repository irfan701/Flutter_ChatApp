import 'dart:io';

import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/widgets/text_field_widget.dart';

class DisplayPictureScreen extends StatelessWidget {
  DisplayPictureScreen({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.title,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                size: 27,
              ))
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 150,
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      suffixIcon: CircleAvatar(
                        backgroundColor: Colors.tealAccent[700],
                        radius: 27,
                        child: Icon(Icons.check, color: Colors.white, size: 27),
                      ),
                      border: InputBorder.none,
                      hintText: 'Add Caption...',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 17)),
                ),
              ),
            )
          ])),
    );
  }
}
