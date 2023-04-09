import 'package:chat_app_wechat/ui/consts/consts.dart';
import 'package:chat_app_wechat/ui/widgets/textstyle_widget.dart';

class ButtonCard extends StatelessWidget {
  ButtonCard({super.key, this.name, this.icon});

  final String? name;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              icon,
              size: 26,
              color: Colors.white,
            ),
            backgroundColor: Color(0XFF235D366),
            radius: 23.r,
          ),
          title: TextStyleWidget(
              label: name, fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
