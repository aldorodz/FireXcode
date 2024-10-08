import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const H1({Key? key, this.fontWeight, this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 32),
    );
  }
}

class H2 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const H2({Key? key, this.fontWeight, this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 24),
    );
  }
}

class H3 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const H3({Key? key, this.fontWeight, this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 19),
    );
  }
}

class H4 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const H4({Key? key, this.fontWeight, this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 16),
    );
  }
}

class H5 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const H5({Key? key, this.fontWeight, this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 14),
    );
  }
}

class H6 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const H6({Key? key, this.fontWeight, this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 13),
    );
  }
}

class SelectableTextH1 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const SelectableTextH1({Key? key, this.fontWeight, this.color, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 32),
    );
  }
}

class SelectableTextH2 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const SelectableTextH2({Key? key, this.fontWeight, this.color, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 24),
    );
  }
}

class SelectableTextH3 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const SelectableTextH3({Key? key, this.fontWeight, this.color, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 19),
    );
  }
}

class SelectableTextH4 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const SelectableTextH4({Key? key, this.fontWeight, this.color, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 16),
    );
  }
}

class SelectableTextH5 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const SelectableTextH5({Key? key, this.fontWeight, this.color, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 14),
    );
  }
}

class SelectableTextH6 extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  const SelectableTextH6({Key? key, this.fontWeight, this.color, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text!,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 13),
    );
  }
}
