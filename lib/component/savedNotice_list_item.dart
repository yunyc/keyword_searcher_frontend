
import 'package:alarmkeyword/dto/savedNoticeDTO.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:alarmkeyword/dto/noticeDTO.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/auth_service.dart';
import '../services/rest_api_service.dart';

class SavedNoticeListItem extends StatefulWidget {
  final SavedNoticeDTO notice;
  final Future<void> Function() noticeChanged;

  const SavedNoticeListItem({Key? key, required this.notice, required Future<void> Function() this.noticeChanged}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SavedNoticeListItemState();

}

class SavedNoticeListItemState extends State<SavedNoticeListItem> {

  void moveWebView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebView(
          initialUrl: widget.notice.siteUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final Offset position = box.localToGlobal(Offset.zero);
          final Size size = box.size;

          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(position.dx + size.width, position.dy, position.dx + size.width, position.dy),
            items: [
              PopupMenuItem(
              value: '삭제',
              child: Text('삭제'),
                ),
              ]
          ).then((value) async {
            var accessToken = await AuthService.instance.auth0AccessToken;
            final dio = Dio();
            dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
            RestApiService restApiService = RestApiService(dio);

            switch(value) {
              case '보관':
                restApiService.createSavedNotice(widget.notice.id, accessToken);
                // widget.noticeChanged();
                break;
              case '삭제':
                setState(() async {
                  final dio = Dio();
                  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
                  RestApiService restApiService = RestApiService(dio);
                  restApiService.deleteSavedNotice(widget.notice.id, accessToken);

                  widget.noticeChanged();

                });
                break;
            }

          });
        },
        child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 4,
          height: 90,
          decoration: BoxDecoration(
            color: Color(0xFF4B39EF),
            borderRadius:
            BorderRadius.circular(12),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional
                .fromSTEB(12, 0, 12, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  widget.notice.content,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color:
                    Color(0xFF101213),
                    fontSize: 14,
                    fontWeight:
                    FontWeight.normal,
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsetsDirectional
                      .fromSTEB(
                      0, 8, 0, 0),
                  child: Row(
                    mainAxisSize:
                    MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                        EdgeInsetsDirectional
                            .fromSTEB(0,
                            0, 4, 0),
                        child: Text(
                          'Due',
                          style: TextStyle(
                            fontFamily:
                            'Outfit',
                            color: Color(
                                0xFF57636C),
                            fontSize: 14,
                            fontWeight:
                            FontWeight
                                .normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.notice.crawledDate.toString(),
                          style: TextStyle(
                            fontFamily:
                            'Outfit',
                            color: Color(
                                0xFF101213),
                            fontSize: 14,
                            fontWeight:
                            FontWeight
                                .normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional
                            .fromSTEB(0,
                            0, 8, 0),
                        child: badges.Badge(
                          badgeContent: Text(
                            '!',
                            style: TextStyle(
                              fontFamily:
                              'Outfit',
                              color: Colors
                                  .white,
                              fontSize:
                              14,
                              fontWeight:
                              FontWeight
                                  .normal,
                            ),
                          ),
                          showBadge: true,
                          shape: badges
                              .BadgeShape
                              .circle,
                          badgeColor: Color(
                              0xFF4B39EF),
                          elevation: 4,
                          padding:
                          EdgeInsetsDirectional
                              .fromSTEB(
                              8,
                              8,
                              8,
                              8),
                          position: badges
                              .BadgePosition
                              .topStart(),
                          animationType: badges
                              .BadgeAnimationType
                              .scale,
                          toAnimate: true,
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional
                                .fromSTEB(
                                16,
                                4,
                                0,
                                0),
                            child: Text(
                              '알림',
                              style: TextStyle(
                                fontFamily:
                                'Outfit',
                                color: Color(
                                    0xFF4B39EF),
                                fontSize:
                                14,
                                fontWeight:
                                FontWeight
                                    .normal,
                              ),
                            ),
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
      ],
    )
    );
  }
}