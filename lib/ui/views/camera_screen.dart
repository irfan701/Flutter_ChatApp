import 'package:camera/camera.dart';
import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/views/display_picture_screen.dart';
import 'package:chat_app_wechat/ui/views/video_view.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({
    super.key,
    required this.cameras,
  });
  final CameraDescription cameras;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool isRecording = false;

  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(widget.cameras, ResolutionPreset.high);
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  takePhoto(context) async {
    try {
      await _initializeControllerFuture;
      // final path =
      //     join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");

      XFile image = await _cameraController.takePicture();

      // .then((XFile file) {
      //   if (mounted) {
      //     if (file != null) {
      //       print("Picture Save to ${file.path}");
      //     }
      //   }
      // });
      //   print("LULU XX ${image}");

      if (mounted) {
        if (image != null) {
          final path = join(
              (await getTemporaryDirectory()).path, "${DateTime.now()}.png");
          print(path);

          print("Picture Save to ${image.path}");
        }
      }

      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: image.path,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  videoRecording() async {
    await _cameraController.startVideoRecording();
  }

  stopVideoRecording(context) async {
    XFile video = await _cameraController.stopVideoRecording();
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => VideoView(videoPath: video.path)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CameraPreview(_cameraController));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flash_off,
                          color: whiteColor,
                          size: 28,
                        )),
                    GestureDetector(
                      onLongPress: () {
                        videoRecording();
                        setState(() {
                          isRecording = true;
                        });
                      },
                      onLongPressUp: () {
                        stopVideoRecording(context);
                        setState(() {
                          isRecording = false;
                        });
                      },
                      onTap: () {
                        if (!isRecording) takePhoto(context);
                      },
                      child: isRecording
                          ? Icon(
                              Icons.radio_button_on,
                              color: Colors.red,
                              size: 80,
                            )
                          : Icon(
                              Icons.panorama_fish_eye,
                              color: Colors.white,
                              size: 70,
                            ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flip_camera_ios,
                          color: whiteColor,
                          size: 28,
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextStyleWidget(
                    label: "Hold for video,tap for photo",
                    color: whiteColor,
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        )
      ]),
    );
  }
}
