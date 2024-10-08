import 'package:flutter/material.dart';
import 'package:firexcode/src/Container/Container.dart';

class XCardTile extends StatelessWidget {
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final Widget? title;
  final Widget? subtitle1;
  final Widget? subtitle2;
  final Widget? leading;
  final double? rounded;
  final double? boxRounded;
  final Widget? boxChild;
  final Color? boxColor;
  final DecorationImage? image;

  const XCardTile(
      {Key? key,
      this.backgroundColor,
      this.margin,
      this.title,
      this.subtitle1,
      this.subtitle2,
      this.leading,
      this.rounded,
      this.boxRounded,
      this.boxChild,
      this.boxColor,
      this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return XContainer(
      onTap: () {},
      margin: EdgeInsets.all(20),
      rounded: rounded,
      color: backgroundColor,
      child: ListTile(
        title: title,
        leading: XContainer(
          rounded: boxRounded,
          height: 50,
          width: 50,
          color: boxColor,
          image: image,
          child: boxChild,
        ),
        subtitle: Row(
          mainAxisAlignment: subtitle1 == null
              ? MainAxisAlignment.start
              : subtitle2 == null
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            subtitle1 ?? Container(),
            subtitle2 ?? Container()
          ],
        ),
      ),
    );
  }
}
