import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/ui/components/default_spacer.dart';
import 'package:sync_play/ui/components/list_tile_builder.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab_controller.dart';

class ProfileSection extends StatelessWidget {
  final ProfileTabController controller;

  const ProfileSection({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultSpacer(),
            CircleAvatar(
              radius: 45,
              backgroundColor:
                  CupertinoTheme.of(context).textTheme.tabLabelTextStyle.color,
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
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(
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
              controller.userName,
              textAlign: TextAlign.start,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .navTitleTextStyle
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            Text(
              controller.userEmail,
              textAlign: TextAlign.start,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .tabLabelTextStyle
                  .copyWith(fontSize: 14),
            ),
            DefaultSpacer(),
            ListTileBuilder(
              children: [
                GestureDetector(
                  onTap: () => controller.handleGoToEdit(context),
                  child: ListTile(
                    tileColor: CupertinoTheme.of(context).barBackgroundColor,
                    title: Text(
                      'Nome',
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                    ),
                    trailing: Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle
                          .color,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    tileColor: CupertinoTheme.of(context).barBackgroundColor,
                    title: Text(
                      'Histórico',
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                    ),
                    trailing: Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle
                          .color,
                    ),
                  ),
                ),
              ],
            ),
            DefaultSpacer(),
            ListTileBuilder(
              children: [
                GestureDetector(
                  onTap: () => controller.handleLogout(context),
                  child: ListTile(
                    tileColor: CupertinoTheme.of(context).barBackgroundColor,
                    title: Text(
                      'Sair',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(color: CupertinoColors.destructiveRed),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
