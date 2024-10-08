import 'package:flutter/material.dart';

import 'package:firexcode/src/Text/h_tag.dart';

class XTitle extends StatelessWidget {
  final double? leftPadding;
  final String title;
  final Color? color;
  const XTitle({Key? key, this.leftPadding, required this.title, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding ?? 10),
      child: H1(
        color: color,
        text: title,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class XTitleWidget extends StatelessWidget {
  final double? leftPadding;
  final Widget? child;
  const XTitleWidget({Key? key, this.leftPadding, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding ?? 10),
      child: child,
    );
  }
}
