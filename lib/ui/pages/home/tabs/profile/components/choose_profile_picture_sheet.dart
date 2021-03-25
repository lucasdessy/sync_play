import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ChooseProfilePictureSheet extends StatelessWidget {
  const ChooseProfilePictureSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop<ImageSource?>(ImageSource.camera);
          },
          child: Text('Tirar foto'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
          Navigator.of(context).pop<ImageSource?>(ImageSource.gallery);
          },
          child: Text('Escolher foto'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
         Navigator.of(context).pop<ImageSource?>(null);
        },
        child: Text('Cancelar'),
      ),
    );
  }
}
