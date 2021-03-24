import 'package:flutter/cupertino.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Perfil'),
          ),
        ],
      ),
    );
  }
}
