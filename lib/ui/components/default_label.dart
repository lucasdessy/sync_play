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
      style: CupertinoTheme.of(context).textTheme.textStyle,
      textAlign: TextAlign.left,
    );
  }
}
