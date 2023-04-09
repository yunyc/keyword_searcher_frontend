import 'package:alarmkeyword/setting/setting_fcm.dart';
import 'package:flutter/material.dart';
import 'package:alarmkeyword/screen/screen_login_button.dart';
import 'package:alarmkeyword/screen/screen_notice.dart';
import 'package:alarmkeyword/screen/screen_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  String? firebaseToken = await fcmSetting();
  runApp(MyApp(firebaseToken));
}



class MyApp extends StatelessWidget {
  final String? firebaseToken;

  const MyApp(this.firebaseToken);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(this.firebaseToken),
      routes: {
        '/home': (context) => LoginButtonWidget(this.firebaseToken),
      },
    );
  }
}


