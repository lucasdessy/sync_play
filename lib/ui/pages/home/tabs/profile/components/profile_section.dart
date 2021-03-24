import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_play/ui/components/default_spacer.dart';
import 'package:sync_play/ui/components/list_tile_spacer.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab_controller.dart';

class ProfileSection extends StatelessWidget {
  final ProfileTabController controller;
  late final CupertinoThemeData theme;

  ProfileSection({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    theme = CupertinoTheme.of(context);
    return Material(
      color: theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultSpacer(),
          CircleAvatar(
            radius: 45,
            backgroundColor: theme.textTheme.tabLabelTextStyle.color,
            backgroundImage: NetworkImage(controller.userPic),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.black.withOpacity(0.8),
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Text(
                          'EDITAR',
                          style: theme.textTheme.textStyle.copyWith(
                              fontSize: 9,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        )),
                  ),
                ),
              ),
            ),
          ),
          DefaultSpacer(),
          Text(
            controller.userName ?? 'Sem nome',
            textAlign: TextAlign.start,
            style: theme.textTheme.navTitleTextStyle
                .copyWith(fontSize: 24, fontWeight: FontWeight.w300),
          ),
          Text(
            controller.userEmail ?? 'Sem email',
            textAlign: TextAlign.start,
            style: theme.textTheme.tabLabelTextStyle.copyWith(fontSize: 14),
          ),
          DefaultSpacer(),
          ListTileSpacer(),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              tileColor: theme.barBackgroundColor,
              title: Text(
                'Nome',
                style: theme.textTheme.textStyle,
              ),
              trailing: Icon(
                CupertinoIcons.chevron_forward,
                color: theme.textTheme.tabLabelTextStyle.color,
              ),
            ),
          ),
          ListTileSpacer(),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              tileColor: theme.barBackgroundColor,
              title: Text(
                'Histórico',
                style: theme.textTheme.textStyle,
              ),
              trailing: Icon(
                CupertinoIcons.chevron_forward,
                color: theme.textTheme.tabLabelTextStyle.color,
              ),
            ),
          ),
          ListTileSpacer(),
          DefaultSpacer(),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              tileColor: theme.barBackgroundColor,
              title: Text(
                'Sair',
                style: theme.textTheme.textStyle
                    .copyWith(color: CupertinoColors.destructiveRed),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
