import 'package:flutter/material.dart';
import 'package:firexcode/src/Text/text_material.dart';

class XListTile extends StatefulWidget {
  final Color selectedColor;
  final Color unSelectedColor;
  final bool selected;
  final FontWeight? fontWeight;
  final IconData? icon;
  final String text;
  final double? iconSize;
  final Function? onTap;
  final Widget? trailing;
  final Widget? subtitle;
  const XListTile(
      {Key? key,
      required this.selectedColor,
      required this.unSelectedColor,
      required this.selected,
      this.fontWeight,
      this.icon,
      required this.text,
      this.iconSize,
      this.onTap,
      this.trailing,
      this.subtitle})
      : super(key: key);

  @override
  _XListTileState createState() => _XListTileState();
}

class _XListTileState extends State<XListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      iconColor:
          !widget.selected ? widget.unSelectedColor : widget.selectedColor,
      selectedColor:
          !widget.selected ? widget.unSelectedColor : widget.selectedColor,
      textColor:
          !widget.selected ? widget.unSelectedColor : widget.selectedColor,
      child: ListTile(
          subtitle: widget.subtitle,
          onTap: widget.onTap as void Function()?,
          trailing: widget.trailing,
          title: Textmaterial(
            text: widget.text,
            fontWeight: widget.fontWeight,
          ),
          // enabled: widget.selected,
          leading: widget.icon == null
              ? null
              : Icon(
                  widget.icon,
                  size: widget.iconSize,
                )),
    );
  }
}
