import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileSpacer extends StatelessWidget {
  final double? height;

  const ListTileSpacer({Key? key, this.height = 1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:
          CupertinoTheme.brightnessOf(context) == Brightness.light ? 0.4 : 1,
      color: CupertinoTheme.brightnessOf(context) == Brightness.light
          ? Color(0xffbfbfbf)
          : Color(0xff282828),
    );
  }
}
