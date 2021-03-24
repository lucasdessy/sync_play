import 'package:flutter/cupertino.dart';

class DefaultFilledButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const DefaultFilledButton({Key? key, this.onPressed, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: child,
    );
  }
}
