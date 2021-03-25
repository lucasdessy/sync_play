import 'package:flutter/cupertino.dart';

class DefaultLabel extends StatelessWidget {
  final String text;

  const DefaultLabel(
    this.text, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context)
          .textTheme
          .textStyle
          .copyWith(fontSize: 19, fontWeight: FontWeight.w500),
      textAlign: TextAlign.left,
    );
  }
}
