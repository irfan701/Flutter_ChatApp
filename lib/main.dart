import 'package:camera/camera.dart';
import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/views/home_screen.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.camera,
  });
  final CameraDescription camera;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'sans_regular',
          colorScheme: ColorScheme.light().copyWith(primary: primaryColor),
          //primarySwatch: Colors.greenAccent,
        ),
        home: HomeScreen(camera: camera),
      );
    });
  }
}
