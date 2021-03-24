import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_play/ui/components/default_spacer.dart';

class ProfileEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Editar'),
            previousPageTitle: 'Perfil',
            trailing: CupertinoButton(
              onPressed: () {},
              child: Text('Salvar'),
            ),
          )
        ],
      ),
    );
  }
}
