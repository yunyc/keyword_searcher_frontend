import 'package:alarmkeyword/screen/screen_setting.dart';
import 'package:flutter/material.dart';
import 'package:alarmkeyword/screen/screen_notice.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../screen/screen _alarm.dart';
import '../screen/screen_saved_notice.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  @override
  State<StatefulWidget> createState() => CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      automaticallyImplyLeading: false,
      title: Text(
        '',
        style: FlutterFlowTheme.of(context).title2.override(
          fontFamily: 'Lexend Deca',
          color: Color(0xFFFFFFFF),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SettingsWidget())
            );
          },
        ),
      ],
      centerTitle: false,
      elevation: 2,
    );
  }


}