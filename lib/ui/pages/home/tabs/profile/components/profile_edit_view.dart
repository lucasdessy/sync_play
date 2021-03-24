import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Editar'),
          previousPageTitle: 'Perfil',
          trailing: CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            child: Text('Salvar'),
          ),
        ),
        child: Container()
        // CustomScrollView(
        //   slivers: [
        //     CupertinoSliverNavigationBar(
        //       largeTitle: Text('Editar'),
        //       previousPageTitle: 'Perfil',
        //       trailing: CupertinoButton(
        //         onPressed: () {},
        //         padding: EdgeInsets.zero,
        //         child: Text('Salvar'),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
