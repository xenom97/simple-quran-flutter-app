import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_quran_flutter_app/screens/juz_list.dart';
import 'package:simple_quran_flutter_app/screens/surah_list.dart';
import 'package:simple_quran_flutter_app/screens/surah_list_detail.dart';

void main() => runApp(QuranApp());

class QuranApp extends StatefulWidget {
  @override
  _QuranAppState createState() => _QuranAppState();
}

class _QuranAppState extends State<QuranApp> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _currentTab == 0 ? SurahList() : JuzList(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white,
          elevation: 10,
          backgroundColor: Colors.black,
          onTap: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          currentIndex: _currentTab,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                FontAwesomeIcons.bookReader,
                color: Colors.amberAccent,
              ),
              icon: Icon(
                FontAwesomeIcons.bookReader,
                color: Colors.white,
                size: 26.0,
              ),
              title: Text('Surah'),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                FontAwesomeIcons.bookReader,
                color: Colors.amberAccent,
              ),
              icon: Icon(
                FontAwesomeIcons.bookOpen,
                color: Colors.white,
                size: 26.0,
              ),
              title: Text('Juz'),
            ),
          ],
        ),
      ),
    );
  }
}
