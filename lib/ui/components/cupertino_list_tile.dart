import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoListTile extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Color? textColor;
  final bool center;
  const CupertinoListTile(
      {Key? key,
      this.onTap,
      required this.title,
      this.textColor,
      this.center = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        tileColor: CupertinoTheme.of(context).barBackgroundColor,
        title: Text(
          title,
          style: textColor == null
              ? CupertinoTheme.of(context).textTheme.textStyle
              : CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(color: textColor!),
          textAlign: center ? TextAlign.center : TextAlign.start,
        ),
        trailing: center
            ? null
            : onTap == null
                ? null
                : Icon(
                    CupertinoIcons.chevron_forward,
                    color: CupertinoTheme.of(context)
                        .textTheme
                        .tabLabelTextStyle
                        .color,
                  ),
        dense: true,
      ),
    );
  }
}
