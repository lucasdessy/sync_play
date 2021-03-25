import 'package:flutter/cupertino.dart';

class DiscardEditSheet extends StatelessWidget {
  const DiscardEditSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text('Descartar Alterações?'),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop<bool>(true);
          },
          isDestructiveAction: true,
          child: Text('Descartar'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.of(context).pop<bool>(false);
        },
        child: Text('Dispensar'),
      ),
    );
  }
}
