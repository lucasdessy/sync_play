import 'package:flutter/cupertino.dart';

class ListTileSpacer extends StatelessWidget {
  final double? height;

  const ListTileSpacer({Key? key, this.height = 1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Color(0xff282828),
    );
  }
}
