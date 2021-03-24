import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/ui/pages/register/components/register_fields.dart';
import 'package:sync_play/ui/pages/register/register_bloc.dart';

class RegisterView extends GetView<RegisterPageController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Registrar'),
            previousPageTitle: 'Login',
          ),
          SliverToBoxAdapter(
            child: RegisterFields(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
