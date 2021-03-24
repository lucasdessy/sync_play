import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_play/ui/pages/home/tabs/home/home_tab.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (ctx) => HomeTab(),
            );
          case 1:
            return CupertinoTabView(
              builder: (ctx) => ProfileTab(),
            );
        }
        return CupertinoTabView(
          builder: (ctx) => CupertinoPageScaffold(
              child: Center(
            child: Text(
              'Ocorreu um erro.',
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
          )),
        );
      },
      tabBar: CupertinoTabBar(
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
      ),
    );
  }
}
