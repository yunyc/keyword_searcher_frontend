import 'package:flutter/material.dart';
import 'package:alarmkeyword/screen/screen_notice.dart';

import '../screen/screen _alarm.dart';
import '../screen/screen_saved_notice.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationBarDemoState();
}

class BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
  List<Widget> _children = [
    NoticeScreen(),
    AlarmScreen(),
    SavedNoticeScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: '크롤링 된 게시물',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.alarm),
            label: '알람',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: '보관함'
          )
        ],
      ),
    );
  }
}