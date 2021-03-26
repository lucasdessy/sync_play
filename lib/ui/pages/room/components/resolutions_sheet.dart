import 'package:flutter/cupertino.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class ResolutionsSheet extends StatelessWidget {
  final List<MuxedStreamInfo> resolutions;

  const ResolutionsSheet({Key? key, required this.resolutions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: resolutions
          .map<Widget>(
            (res) => CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop<MuxedStreamInfo?>(res);
              },
              child: Text('${res.videoQualityLabel}'),
            ),
          )
          .toList(),
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.of(context).pop<MuxedStreamInfo?>();
        },
        child: Text('Cancelar'),
      ),
    );
  }
}
