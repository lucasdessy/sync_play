import 'package:flutter/cupertino.dart';

class DefaultButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const DefaultButton({Key? key, this.onPressed, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
