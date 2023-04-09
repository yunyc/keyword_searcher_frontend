import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:alarmkeyword/component/notice_list_item.dart';
import 'package:alarmkeyword/services/auth_service.dart';
import 'package:alarmkeyword/services/rest_api_service.dart';

import '../component/appbar.dart';
import '../dto/noticeDTO.dart';




class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  _NoticeScreenStateState createState() => _NoticeScreenStateState();
}

class _NoticeScreenStateState extends State<NoticeScreen> {
  //late NoticeCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  late RestApiService _restApiService;
  List<NoticeDTO> _notices = [];

  @override
  void initState() {
    super.initState();
    _restApiService = RestApiService(Dio());
    _loadData();
    //_model = createModel(context, () => NoticeCopyModel());
  }

  Future<void> _loadData() async {
    var accessToken = await AuthService.instance.auth0AccessToken;
    var userId = await AuthService.instance.idToken?.userId;
    final notices = await _restApiService.getNotices(accessToken, userId!, true);
    setState(() {
      _notices = notices;
    });
  }

  @override
  void dispose() {
    //_model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      appBar: CustomAppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _notices.length,
                itemBuilder: (BuildContext context, int index) {
                  final notice = _notices[index];
                  return NoticeListItem(notice: notice, noticeChanged: _loadData);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



