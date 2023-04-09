import 'package:alarmkeyword/dto/selected_time.dart';
import 'package:alarmkeyword/dto/vbEnabled.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../dto/alarmDTO.dart';
import '../services/auth_service.dart';
import '../services/rest_api_service.dart';

class AlarmCreateModel {
  ///  State fields for stateful widgets in this page.

  late BuildContext context;
  Future<void> Function() onAlarmChanged;

  AlarmCreateModel(this.context, this.onAlarmChanged);

  final formKey = GlobalKey<FormState>();

  TextEditingController keywordFieldController = new TextEditingController();
  TextEditingController siteUrlController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  String timeSelectValue = SelectedTime.FIVE.description;
  String vbSelectValue = VbEnabled.TRUE.description;

  String? Function(String?)? keywordControllerValidator;
  String? Function(String?)? siteUrlControllerValidator;
  String? Function(String?)? descriptionControllerValidator;

  Future<bool> Function(AlarmDTO? alarm)?  showSaveDialog;

  Future<bool> _showSaveDialog(AlarmDTO? alarm) async {
    final shouldSave = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Save changes?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('예'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('아니오'),
          ),
        ],
      ),
    );

    if (shouldSave == true) {
      this.saveAlarm(alarm);
    }
    context.pop();

    return true;
  }

  String? _keywordControllerValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? _descrptionControllerValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? _siteUrlControllerValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    final urlPattern = r'^(http|https)://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$';
    final match = RegExp(urlPattern).firstMatch(val);
    if (match == null) {
      return 'Invalid URL';
    }

    return null;
  }



  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    siteUrlControllerValidator = _siteUrlControllerValidator;
    keywordControllerValidator = _keywordControllerValidator;
    descriptionControllerValidator = _descrptionControllerValidator;
    showSaveDialog = _showSaveDialog;


  }

  void dispose() {
    keywordFieldController?.dispose();
    siteUrlController?.dispose();
    descriptionController?.dispose();
  }

  Future<void> saveAlarm(AlarmDTO? updatedAlarm) async {
    var accessToken = await AuthService.instance.auth0AccessToken;
    var userId = await AuthService.instance.idToken?.userId;
    bool vbEnabled = false;

    if (this.vbSelectValue == '진동')
      vbEnabled = true;

    AlarmDTO createdAlarm = AlarmDTO(
      userId: userId,
      keyword: this.keywordFieldController.value.text,
      siteUrl: this.siteUrlController.value.text,
      description: this.descriptionController.value.text,
      refeshTime: SelectedTimeExtension.getByDescription(this.timeSelectValue),
      vbEnabled: vbEnabled,
      createdDate: DateTime.now(),
      crawlingDate: DateTime.now(),
    );

    print("userId: " + userId!);
    print("keyword: " + this.keywordFieldController.value.text);
    print("siteUrl: " + this.siteUrlController.value.text);
    print("description: " + this.descriptionController.value.text);
    print(SelectedTimeExtension.getByDescription(this.timeSelectValue));
    print(vbEnabled);

    final dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    RestApiService restApiService = RestApiService(dio);

    if (updatedAlarm == null) {
      await restApiService.createAlarm(accessToken, createdAlarm).then((value) => successMessage());
    } else {
      createdAlarm.id = updatedAlarm!.id;
      await restApiService.updateAlarm(updatedAlarm!.id, accessToken, createdAlarm).then((value) => successMessage());
    }
    print("onAlarmChanged start");
    onAlarmChanged();
    print("onAlarmChanged end");

  }

  successMessage() {}

}