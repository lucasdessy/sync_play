import 'package:flutter/cupertino.dart';

class LogoutSheet extends StatelessWidget {
  const LogoutSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text('Deseja sair?'),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop<bool>(true);
          },
          isDestructiveAction: true,
          child: Text('Sair'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.of(context).pop<bool>(false);
        },
        child: Text('Cancelar'),
      ),
    );
  }
}
