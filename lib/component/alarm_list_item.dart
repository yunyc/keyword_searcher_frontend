import 'package:alarmkeyword/dto/selected_time.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../dto/alarmDTO.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../screen/screen _alarm_create.dart';
import '../services/auth_service.dart';
import '../services/rest_api_service.dart';


class AlarmListItem extends StatefulWidget {

  final AlarmDTO alarm;
  final Future<void> Function() onAlarmChanged;

  const AlarmListItem({Key? key, required this.alarm, required Future<void> Function() this.onAlarmChanged}) : super(key: key);

  @override
  _AlarmListItemState createState() => _AlarmListItemState();

}

class _AlarmListItemState extends State<AlarmListItem> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child: InkWell(
        onLongPress: () {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final Offset position = box.localToGlobal(Offset.zero);
          final Size size = box.size;

          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(position.dx + size.width, position.dy, position.dx + size.width, position.dy),
            items: [
              PopupMenuItem(
                value: '보관',
                child: Text('보관'),
              ),
              PopupMenuItem(
                value: '삭제',
                child: Text('삭제'),
              ),
            ],
          ).then((value) async {

            switch(value) {
              case '삭제':
                setState(() async {
                  var accessToken = await AuthService.instance.auth0AccessToken;
                  final dio = Dio();
                  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
                  RestApiService restApiService = RestApiService(dio);
                  restApiService.deleteAlarm(widget.alarm.id, accessToken);
                  widget.onAlarmChanged();
                });
            }

          });
        },
        onTap: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AlarmCreateScreen(widget.alarm, widget.onAlarmChanged))
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x430F1113),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    12, 4, 12, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, 4, 0, 0),
                      child: SelectionArea(
                          child: Text(
                            widget.alarm.description,
                            style: FlutterFlowTheme.of(context)
                                .subtitle1
                                .override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    12, 4, 12, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        widget.alarm.siteUrl,
                        style: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF95A1AC),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, 4, 0, 0),
                      child: Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    12, 4, 12, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, 0, 0, 4),
                      child: Icon(
                        Icons.schedule,
                        color: Color(0xFF4B39EF),
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          4, 0, 0, 0),
                      child: Text(
                        widget.alarm.refeshTime.description,
                        style: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF4B39EF),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24, 0, 0, 4),
                      child: Icon(
                        Icons.location_on_sharp,
                        color: Color(0xFF4B39EF),
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          4, 0, 0, 0),
                      child: Text(
                        widget.alarm.keyword,
                        style: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF4B39EF),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}