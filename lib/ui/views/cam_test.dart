import 'package:camera/camera.dart';
import 'package:chat_app_wechat/ui/consts/consts.dart';

class CamTest extends StatefulWidget {
  CamTest({super.key});

  @override
  State<CamTest> createState() => _CamTestState();
}

class _CamTestState extends State<CamTest> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (cameraController.value.isInitialized) {
    return Scaffold(
      body: Stack(children: [
        CameraPreview(cameraController),
        GestureDetector(
          onTap: () {
            cameraController.takePicture().then((XFile? file) {
              if (mounted) {
                if (file != null) {
                  print("Picture Save to ${file.path}");
                }
              }
            });
          },
          child: Text("Click me"),
        )
      ]),
    );
  }
}
//}
