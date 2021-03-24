import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/ui/pages/auth/auth_bloc.dart';
import 'components/login_fields.dart';

class AuthView extends GetView<AuthPageController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Login'),
          ),
          SliverToBoxAdapter(
            child: LoginFields(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
