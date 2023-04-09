
import 'package:alarmkeyword/component/appbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alarmkeyword/component/alarm_list_item.dart';
import 'package:alarmkeyword/screen/screen%20_alarm_create.dart';
import 'package:provider/provider.dart';

import '../dto/alarmDTO.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../services/auth_service.dart';
import '../services/rest_api_service.dart';



class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late AlarmScreen _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late RestApiService _restApiService;
  List<AlarmDTO> _alarms = [];

  @override
  void initState() {
    super.initState();
    _restApiService = RestApiService(Dio());
    _loadData();
    //_model = AlarmScreen();
    //_model = createModel(context, () => NoticeCopyModel());
  }

  Future<void> _loadData() async {
    var accessToken = await AuthService.instance.auth0AccessToken;
    var userId = await AuthService.instance.idToken?.userId;
    print('userId: ');
    print(userId);
    final alarms = await _restApiService.getAlarms(accessToken, userId!);
    setState(() {
      _alarms = alarms;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AlarmCreateScreen(null, _loadData))
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _alarms.length,
                  itemBuilder: (BuildContext context, int index) {
                    final alarm = _alarms[index];
                    return new AlarmListItem(alarm: alarm, onAlarmChanged: _loadData);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
