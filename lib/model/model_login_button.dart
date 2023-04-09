
import 'package:alarmkeyword/dto/userDTO.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../component/bottom_navbar.dart';
import '../services/auth_service.dart';
import '../services/rest_api_service.dart';

class LoginButtonModel {
  ///  State fields for stateful widgets in this page.

  late BuildContext context;
  String? firebaseToken;

  bool isLoggedIn = false;
  String errorMessage = '';
  String? name;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  LoginButtonModel(this.context, String? this.firebaseToken);

  /// Initialization and disposal methods.

  void initState() {}

  void dispose() {}

  initAction() async {

    final bool isAuth = await AuthService.instance.init();
    if (isAuth) {
      setSuccessAuthState();
    } else {

    }
  }

  setSuccessAuthState() {
    isLoggedIn = true;
    name = AuthService.instance.idToken?.name;
  }

  Future<void> login() async {
    //setLoadingState();
    final message = await AuthService.instance.login();
    print(message);

    if (message == 'Success') {
      UserDTO userDTO = UserDTO(userId: AuthService.instance.idToken?.userId, firebaseToken: this.firebaseToken);

      final dio = Dio();
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
      RestApiService restApiService = RestApiService(dio);
      restApiService.createUserToken(AuthService.instance.auth0AccessToken, userDTO);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarDemo()),
            (Route<dynamic> route) => false,
      );
    } else {
      //errorMessage = message;
    }
  }

}
