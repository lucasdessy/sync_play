import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_play/ui/components/cupertino_list_tile.dart';
import 'package:sync_play/ui/components/default_spacer.dart';
import 'package:sync_play/ui/components/list_tile_builder.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab_controller.dart';

class ProfileSection extends StatelessWidget {
  final ProfileTabController controller;

  const ProfileSection({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultSpacer(),
          GestureDetector(
            onTap: () => controller.handleChangeProfilePicture(context),
            child: CircleAvatar(
              radius: 45,
              backgroundColor: CupertinoColors.systemFill.resolveFrom(context),
              backgroundImage: NetworkImage(controller.userPic),
              child: Stack(
                children: [
                  if (controller.loading)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Center(
                        child: Container(
                          color: Colors.black.withOpacity(0.7),
                          width: double.infinity,
                          height: double.infinity,
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                    ),
                  ClipRRect(
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
                                        fontSize: 10,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
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
              CupertinoListTile(
                  title: 'Nome',
                  onTap: () => controller.handleGoToEdit(context)),
              CupertinoListTile(
                  title: 'Histórico',
                  onTap: () => controller.handleGoToHistoryPage(context)),
            ],
          ),
          DefaultSpacer(),
          ListTileBuilder(
            children: [
              CupertinoListTile(
                title: 'Sair',
                onTap: () => controller.handleLogout(context),
                textColor: CupertinoColors.destructiveRed,
                center: true,
              )
            ],
          ),
        ],
      ),
    );
  }
}
