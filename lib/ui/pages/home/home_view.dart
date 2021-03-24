import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_play/ui/pages/home/tabs/home/home_tab.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  static final tabs = [
    HomeTab(),
    ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs.elementAt(currentIndex),
      extendBody: true,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
            ),
            label: 'Perfil',
          ),
        ],
        onTap: (_index) {
          setState(() {
            currentIndex = _index;
          });
        },
      ),
    );
  }
}
