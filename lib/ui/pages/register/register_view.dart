import 'package:flutter/cupertino.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Registrar'),
          ),
        ],
      ),
    );
  }
}
