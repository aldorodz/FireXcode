import 'package:flutter/material.dart';

class Textmaterial extends StatelessWidget {
  final double? fontsize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  final String? fontFamily;
  const Textmaterial(
      {Key? key,
      this.fontWeight,
      this.color,
      required this.text,
      this.fontsize,
      this.fontFamily})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontsize,
          fontFamily: fontFamily),
    );
  }
}

class SelectableTextMaterial extends StatelessWidget {
  final double? fontsize;
  final FontWeight? fontWeight;
  final Color? color;
  final String text;
  final String? fontFamily;
  const SelectableTextMaterial(
      {Key? key,
      this.fontWeight,
      this.color,
      required this.text,
      this.fontsize,
      this.fontFamily})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontsize,
          fontFamily: fontFamily),
    );
  }
}

class TextFiledMaterialD extends StatelessWidget {
  final String? name;
  final double? fontSize;
  final TextEditingController? controller;
  final Color? color;
  final double? lableSize;
  final Color? textColor;
  final bool? obscureText;
  final int? maxline;
  const TextFiledMaterialD(
      {Key? key,
      this.name,
      this.controller,
      this.color,
      this.textColor,
      this.fontSize,
      this.lableSize,
      this.obscureText,
      this.maxline})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 5.0),
          child: Text(
            'Enter Your ' + name!,
            style: TextStyle(
              fontSize: lableSize ?? 15.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          color: color ?? Colors.grey[100],
          child: TextFormField(
            style: TextStyle(
              fontSize: fontSize,
              color: textColor ?? Colors.black,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter ' + name!;
              }
              return null;
            },
            maxLines: maxline,
            controller: controller,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: fontSize, color: textColor ?? Colors.black),
                contentPadding:
                    EdgeInsets.only(left: 10.0, right: 5.0, bottom: 5.0),
                hintText: ' ' + name!,
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
