
import 'package:alarmkeyword/screen/screen_login_button.dart';
import 'package:alarmkeyword/services/auth_service.dart';
import 'package:flutter/material.dart';


class SettingsModel {
  BuildContext context;

  SettingsModel(this.context);

  /// Initialization and disposal methods.

  void initState() {}

  void dispose() {}

  Future<void> logout() async {
    var isLogout = await AuthService.instance.logout();

    if (isLogout) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginButtonWidget(null)),
            (Route<dynamic> route) => false,
      );
    }



  }

/// Additional helper methods are added here.

}
