import 'package:flutter/material.dart';
import 'package:firexcode/src/Container/Container.dart';
import 'package:firexcode/src/Modules/StoriesBar.dart';

class XStoriesBuilder extends StatelessWidget {
  final Color? addCircleColor;
  final String addText;
  final FontWeight? addtextFontWeight;
  final Color? addBackGroundColor;
  final String? fontfamily;
  final Color? backGroundColor;
  final Color? addtextColor;
  final double? addTextFontSize;
  final double backGroundHeight;
  final Widget? addChild;
  final int itemCount;
  final Function? addOnTap;
  final Widget Function(BuildContext, int) itemBuilder;

  const XStoriesBuilder(
      {Key? key,
      this.addCircleColor,
      required this.addText,
      this.addtextFontWeight,
      this.fontfamily,
      this.backGroundColor,
      this.addBackGroundColor,
      this.addtextColor,
      this.addTextFontSize,
      required this.backGroundHeight,
      required this.itemBuilder,
      required this.itemCount,
      this.addChild,
      this.addOnTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return XContainer(
        height: backGroundHeight,
        color: backGroundColor,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            XStorieBar(
                onTap: addOnTap,
                verticalSpace: 10,
                circleRadius: 25,
                circleColor: addCircleColor,
                color: addBackGroundColor,
                text: addText,
                textColor: addtextColor,
                fontWeight: addtextFontWeight,
                child: addChild),
            ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: itemCount,
                itemBuilder: itemBuilder)
          ],
        ));
  }
}
