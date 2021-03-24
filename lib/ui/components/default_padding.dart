import 'package:flutter/material.dart';

class DefaultPadding extends StatelessWidget {
  final Widget child;

  const DefaultPadding({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: child,
    );
  }
}
