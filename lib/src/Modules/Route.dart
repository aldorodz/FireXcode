import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firexcode/src/Modules/SizeTransition.dart';
import 'package:firexcode/src/Modules/Trasition/ExitRoute.dart';
import 'package:firexcode/src/Modules/Trasition/FadeRoute.dart';
import 'package:firexcode/src/Modules/Trasition/RotationRoute.dart';
import 'package:firexcode/src/Modules/Trasition/ScaleRoute.dart';
import 'package:firexcode/src/Modules/Trasition/SlideRoute.dart';

class XRoutePage {
  final BuildContext context;
  final Widget child;

  XRoutePage(this.context, this.child);
  void sizeTransitionPush() {
    Navigator.push(context, XSizeRoute(page: child));
  }

  void cupertinoPagePush() {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => child));
  }

  void materialPagePush() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => child));
  }

  void slideRightPush() {
    Navigator.push(context, XRightRoute(page: child));
  }

  void slideLeftPush() {
    Navigator.push(context, XLeftRoute(page: child));
  }

  void slideTopPush() {
    Navigator.push(context, XTopRoute(page: child));
  }

  void slideLBottomPush() {
    Navigator.push(context, XBottomRoute(page: child));
  }

  void scalePush() {
    Navigator.push(context, XScaleRoute(page: child));
  }

  void rotationPush() {
    Navigator.push(context, XRotationRoute(page: child));
  }

  void fadePush() {
    Navigator.push(context, XFadeRoute(page: child));
  }

  void exitPush(exitPageChild) {
    Navigator.push(
        context, XEnterExitRoute(enterPage: child, exitPage: exitPageChild));
  }
}
