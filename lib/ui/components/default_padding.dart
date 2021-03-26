import 'package:flutter/material.dart';

class DefaultPadding extends StatelessWidget {
  final Widget child;
  final double bottom;
  final double top;
  const DefaultPadding(
      {Key? key, required this.child, this.bottom = 20, this.top = 20})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: bottom, top: 20),
      child: child,
    );
  }
}
