import 'package:flutter/material.dart';

// ====================================
//              Begin Fades
// ====================================
// ============= FadeIn
class FadeIn extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  FadeIn(
      {this.child,
      this.duration = const Duration(milliseconds: 300),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = CurvedAnimation(curve: Curves.easeOut, parent: controller);

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: animation.value,
            child: widget.child,
          );
        });
  }
}

// ============= FadeInDown
class FadeInDown extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInDown(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FadeInDownState createState() => _FadeInDownState();
}

class _FadeInDownState extends State<FadeInDown>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: widget.from * -1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(0, animation.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= FadeInDownBig
class FadeInDownBig extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInDownBig(
      {this.child,
      this.duration = const Duration(milliseconds: 1300),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 600})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => FadeInDown(
      duration: duration,
      delay: delay,
      controller: controller,
      manualTrigger: manualTrigger,
      animate: animate,
      from: from,
      child: child);
}

// ============= FadeInUp
class FadeInUp extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInUp(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FadeInUpState createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: widget.from, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(0, animation.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= FadeInUpBig
class FadeInUpBig extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInUpBig(
      {this.child,
      this.duration = const Duration(milliseconds: 1300),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 600})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => FadeInUp(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from,
        child: child,
      );
}

// ============= FadeInLeft
class FadeInLeft extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInLeft(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FadeInLeftState createState() => _FadeInLeftState();
}

class _FadeInLeftState extends State<FadeInLeft>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: widget.from * -1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(animation.value, 0),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= FadeInLeftBig
class FadeInLeftBig extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInLeftBig(
      {this.child,
      this.duration = const Duration(milliseconds: 1300),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 600})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => FadeInLeft(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from,
        child: child,
      );
}

// ============= FadeInRight
class FadeInRight extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInRight(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FadeInRightState createState() => _FadeInRightState();
}

class _FadeInRightState extends State<FadeInRight>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: widget.from, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(animation.value, 0),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= FadeInRightBig
class FadeInRightBig extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInRightBig(
      {this.child,
      this.duration = const Duration(milliseconds: 1200),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 600})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => FadeInRight(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from,
        child: child,
      );
}
// ====================================
//              End Fades
// ====================================

// ====================================
//              Begin Bounce
// ====================================
// ============= BounceInDown
class BounceInDown extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  BounceInDown(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 75})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _BounceInDownState createState() => _BounceInDownState();
}

class _BounceInDownState extends State<BounceInDown>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    animation = Tween<double>(begin: widget.from * -1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(0, animation.value),
              child: Opacity(opacity: opacity.value, child: widget.child));
        });
  }
}

// ============= BounceInUp
class BounceInUp extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  BounceInUp(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 75})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => BounceInDown(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from * -1,
        child: child,
      );
}

// ============= BounceInLeft
class BounceInLeft extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  BounceInLeft(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 75})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _BounceInLeftState createState() => _BounceInLeftState();
}

class _BounceInLeftState extends State<BounceInLeft>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);
    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    animation = Tween<double>(begin: widget.from * -1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(animation.value, 0),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= BounceInRight
class BounceInRight extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  BounceInRight(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 75})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => BounceInLeft(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from * -1,
        child: child,
      );
}
// ====================================
//              End Bounce
// ====================================

// ====================================
//          Begin Elastics
// ====================================
// ============= ElasticIn
class ElasticIn extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  ElasticIn(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _ElasticInState createState() => _ElasticInState();
}

class _ElasticInState extends State<ElasticIn>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bouncing;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.45)));

    bouncing = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: bouncing.value,
            child: Opacity(
              opacity: opacity.value,
              child: widget.child,
            ),
          );
        });
  }
}

// ============= ElasticInDown
class ElasticInDown extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;
  final double to;

  ElasticInDown(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 200,
      this.to = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _ElasticInDownState createState() => _ElasticInDownState();
}

class _ElasticInDownState extends State<ElasticInDown>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bouncing;
  late Animation<double> falling;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.45)));

    falling = Tween<double>(begin: widget.from * -1, end: widget.to * -1)
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.30, curve: Curves.linear)));

    bouncing = Tween<double>(begin: widget.to * -1, end: 0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.30, 1, curve: Curves.elasticOut)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(
                  0,
                  (falling.value == (widget.to * -1))
                      ? bouncing.value
                      : falling.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= ElasticInUp
class ElasticInUp extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  ElasticInUp(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 200})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => ElasticInDown(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from * -1,
        to: 100,
        child: child,
      );
}

// ============= ElasticInLeft
class ElasticInLeft extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;
  final double to;

  ElasticInLeft(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 200,
      this.to = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _ElasticInLeftState createState() => _ElasticInLeftState();
}

class _ElasticInLeftState extends State<ElasticInLeft>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bouncing;
  late Animation<double> falling;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.45)));

    falling = Tween<double>(begin: widget.from * -1, end: widget.to * -1)
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.30, curve: Curves.linear)));

    bouncing = Tween<double>(begin: widget.to * -1, end: 0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.30, 1, curve: Curves.elasticOut)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(
                  (falling.value == (widget.to * -1))
                      ? bouncing.value
                      : falling.value,
                  0),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= ElasticInRight
class ElasticInRight extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  ElasticInRight(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 200})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => ElasticInLeft(
      duration: duration,
      delay: delay,
      controller: controller,
      manualTrigger: manualTrigger,
      animate: animate,
      from: from * -1,
      to: -100,
      child: child);
}
// ====================================
//          End Elastics
// ====================================

// ====================================
//          Begin Flips
// ====================================

// ============= FlipInX
class FlipInX extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  FlipInX(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FlipInXState createState() => _FlipInXState();
}

class _FlipInXState extends State<FlipInX> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    rotation = Tween<double>(begin: 1.5, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()..rotateX(rotation.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= FlipInY
class FlipInY extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  FlipInY(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FlipInYState createState() => _FlipInYState();
}

class _FlipInYState extends State<FlipInY> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    rotation = Tween<double>(begin: 1.5, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()..rotateY(rotation.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ====================================
//          End Flips
// ====================================

// ====================================
//          Begin SlideIns
// ====================================
// ============= SlideInUp
class SlideInUp extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  SlideInUp(
      {this.child,
      this.duration = const Duration(milliseconds: 600),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _SlideInUpState createState() => _SlideInUpState();
}

class _SlideInUpState extends State<SlideInUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: widget.from, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(0, animation.value), child: widget.child);
        });
  }
}

// ============= SlideInDown
class SlideInDown extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  SlideInDown(
      {this.child,
      this.duration = const Duration(milliseconds: 600),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => SlideInUp(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from * -1,
        child: child,
      );
}

// ============= SlideInLeft
class SlideInLeft extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  SlideInLeft(
      {this.child,
      this.duration = const Duration(milliseconds: 600),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _SlideInLeftState createState() => _SlideInLeftState();
}

class _SlideInLeftState extends State<SlideInLeft>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: widget.from * -1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(animation.value, 0), child: widget.child);
        });
  }
}

// ============= SlideInRight
class SlideInRight extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  SlideInRight(
      {this.child,
      this.duration = const Duration(milliseconds: 600),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => SlideInLeft(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from * -1,
        child: child,
      );
}
// ====================================
//          End SlideIns
// ====================================

// ====================================
//          Begin Special Ins
// ====================================

// ============= JelloIn
class JelloIn extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  JelloIn(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _JelloInState createState() => _JelloInState();
}

class _JelloInState extends State<JelloIn> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    rotation = Tween<double>(begin: 1.5, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(0, 0, rotation.value + 1)
                ..rotateX(rotation.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}
// ====================================
//          End Special Ins
// ====================================

// ====================================
//       Begin Attention Seekers
// ====================================
// ============= Bounce
class Bounce extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  Bounce(
      {this.child,
      this.duration = const Duration(milliseconds: 1300),
      this.delay = const Duration(milliseconds: 0),
      this.infinite = false,
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 50})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _BounceState createState() => _BounceState();
}

class _BounceState extends State<Bounce> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationBounce;

  late Animation<double> animationUp;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animationUp = Tween<double>(begin: 0, end: widget.from * -1).animate(
        CurvedAnimation(
            curve: Interval(0, 0.35, curve: Curves.easeInOut),
            parent: controller));

    animationBounce = Tween<double>(begin: widget.from * -1, end: 0.0).animate(
        CurvedAnimation(
            curve: Interval(0.35, 1, curve: Curves.bounceOut),
            parent: controller));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        (widget.infinite) ? controller.repeat() : controller.forward();
      });
    } else if (!widget.animate) {
      controller.reverse();
    } else if (!widget.animate) {
      controller.reverse();
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(
                  0,
                  (animationUp.value == (widget.from * -1))
                      ? animationBounce.value
                      : animationUp.value),
              child: widget.child);
        });
  }
}

// ============= Flash
class Flash extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  Flash(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.infinite = false,
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<Flash> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityOut1;
  late Animation<double> opacityIn1;
  late Animation<double> opacityOut2;
  late Animation<double> opacityIn2;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    opacityOut1 = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.25)));
    opacityIn1 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.25, 0.5)));
    opacityOut2 = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75)));
    opacityIn2 = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.75, 1)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        (widget.infinite) ? controller.repeat() : controller.forward();
      });
    } else if (!widget.animate) {
      controller.reverse();
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
              opacity: (controller.value < 0.25)
                  ? opacityOut1.value
                  : (controller.value < 0.5)
                      ? opacityIn1.value
                      : (controller.value < 0.75)
                          ? opacityOut2.value
                          : opacityIn2.value,
              child: widget.child);
        });
  }
}

// ============= Pulse
class Pulse extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  Pulse(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.infinite = false,
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _PulseState createState() => _PulseState();
}

class _PulseState extends State<Pulse> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationInc;
  late Animation<double> animationDec;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animationInc = Tween<double>(begin: 1, end: 1.5).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.5, curve: Curves.easeOut)));

    animationDec = Tween<double>(begin: 1.5, end: 1).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.5, 1, curve: Curves.easeIn)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        (widget.infinite) ? controller.repeat() : controller.forward();
      });
    } else if (!widget.animate) {
      controller.reverse();
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: (controller.value < 0.5)
                ? animationInc.value
                : animationDec.value,
            child: widget.child,
          );
        });
  }
}

// ============= Swing
class Swing extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  Swing(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.infinite = false,
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _SwingState createState() => _SwingState();
}

class _SwingState extends State<Swing> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationRotation1;
  late Animation<double> animationRotation2;
  late Animation<double> animationRotation3;
  late Animation<double> animationRotation4;
  late Animation<double> animationRotation5;
  late Animation<double> animationRotation6;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animationRotation1 = Tween<double>(begin: 0, end: -0.5).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.1666, curve: Curves.easeOut)));

    animationRotation2 = Tween<double>(begin: -0.5, end: 0.5).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.1666, 0.3333, curve: Curves.easeInOut)));

    animationRotation3 = Tween<double>(begin: 0.5, end: -0.5).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.3333, 0.4999, curve: Curves.easeInOut)));

    animationRotation4 = Tween<double>(begin: -0.5, end: 0.4).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.4999, 0.6666, curve: Curves.easeInOut)));

    animationRotation5 = Tween<double>(begin: 0.4, end: -0.4).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.6666, 0.8333, curve: Curves.easeInOut)));

    animationRotation6 = Tween<double>(begin: -0.4, end: 0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.8333, 1, curve: Curves.easeOut)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        (widget.infinite) ? controller.repeat() : controller.forward();
      });
    } else if (!widget.animate) {
      controller.reverse();
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          var angle = (animationRotation1.value != -0.5)
              ? animationRotation1.value
              : (animationRotation2.value != 0.5)
                  ? animationRotation2.value
                  : (animationRotation3.value != -0.5)
                      ? animationRotation3.value
                      : (animationRotation4.value != 0.4)
                          ? animationRotation4.value
                          : (animationRotation5.value != -0.4)
                              ? animationRotation5.value
                              : animationRotation6.value;

          return Transform.rotate(
            angle: angle,
            child: widget.child,
          );
        });
  }
}

// ============= Spin
class Spin extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double spins;

  Spin(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.infinite = false,
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.spins = 1})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _SpinState createState() => _SpinState();
}

class _SpinState extends State<Spin> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> spin;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    spin = Tween<double>(begin: 0, end: widget.spins * 2)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        (widget.infinite) ? controller.repeat() : controller.forward();
      });
    } else if (!widget.animate) {
      controller.reverse();
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: spin.value * 3.1415926535,
            child: widget.child,
          );
        });
  }
}

// ============= SpinPerfect
class SpinPerfect extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double spins;

  SpinPerfect(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.infinite = false,
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.spins = 1})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _SpinPerfectState createState() => _SpinPerfectState();
}

class _SpinPerfectState extends State<SpinPerfect>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> spin;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    spin = Tween<double>(begin: 0, end: widget.spins * 2)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        (widget.infinite) ? controller.repeat() : controller.forward();
      });
    } else if (!widget.animate) {
      controller.reverse();
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: spin.value * 3.141516,
            child: widget.child,
          );
        });
  }
}

// ============= Dance
class Dance extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  Dance(
      {this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.infinite = false,
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _DanceState createState() => _DanceState();
}

class _DanceState extends State<Dance> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> step1;
  late Animation<double> step2;
  late Animation<double> step3;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    step1 = Tween<double>(begin: 0, end: -0.2).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.3333, curve: Curves.bounceOut)));

    step2 = Tween<double>(begin: -0.2, end: 0.2).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.3333, 0.6666, curve: Curves.bounceOut)));

    step3 = Tween<double>(begin: 0.2, end: 0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.6666, 1, curve: Curves.bounceOut)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        (widget.infinite) ? controller.repeat() : controller.forward();
      });
    } else if (!widget.animate) {
      controller.reverse();
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          final animation = (step1.value != -0.2)
              ? step1.value
              : (step2.value != 0.2)
                  ? step2.value
                  : step3.value;

          return Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.skew(0, animation),
              child: widget.child);
        });
  }
}

// ============= Roulette
class Roulette extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double spins;

  Roulette(
      {this.child,
      this.duration = const Duration(milliseconds: 3500),
      this.delay = const Duration(milliseconds: 0),
      this.infinite = false,
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.spins = 2})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _RouletteState createState() => _RouletteState();
}

class _RouletteState extends State<Roulette>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> spin;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    spin = Tween<double>(begin: 0, end: widget.spins * 2)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        (widget.infinite) ? controller.repeat() : controller.forward();
      });
    } else if (!widget.animate) {
      controller.reverse();
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: spin.value * 3.141516,
            child: widget.child,
          );
        });
  }
}

// ====================================
//       End Attention Seekers
// ====================================

// ====================================
//       FadeOuts Animations
// ====================================
// ============= FadeOut
class FadeOut extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  FadeOut(
      {this.child,
      this.duration = const Duration(milliseconds: 300),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = false})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FadeOutState createState() => _FadeOutState();
}

class _FadeOutState extends State<FadeOut> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(curve: Curves.easeOut, parent: controller));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: animation.value,
            child: widget.child,
          );
        });
  }
}

// ============= FadeOutDown
class FadeOutDown extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeOutDown(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = false,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FadeOutDownState createState() => _FadeOutDownState();
}

class _FadeOutDownState extends State<FadeOutDown>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: 0, end: widget.from)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacity = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(0, animation.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= FadeOutDownBig
class FadeOutDownBig extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeOutDownBig(
      {this.child,
      this.duration = const Duration(milliseconds: 1300),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = false,
      this.from = 600})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => FadeOutDown(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from,
        child: child,
      );
}

// ============= FadeOutUp
class FadeOutUp extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeOutUp(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = false,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FadeOutUpState createState() => _FadeOutUpState();
}

class _FadeOutUpState extends State<FadeOutUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: 0.0, end: widget.from * -1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacity = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(0, animation.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= FadeOutUpBig
class FadeOutUpBig extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeOutUpBig(
      {this.child,
      this.duration = const Duration(milliseconds: 1300),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = false,
      this.from = 600})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => FadeOutUp(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from,
        child: child,
      );
}

// ============= FadeOutLeft
class FadeOutLeft extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeOutLeft(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = false,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _FadeOutLeftState createState() => _FadeOutLeftState();
}

class _FadeOutLeftState extends State<FadeOutLeft>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: 0, end: widget.from * -1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacity = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(animation.value, 0),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

// ============= FadeOutLeftBig
class FadeOutLeftBig extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeOutLeftBig(
      {this.child,
      this.duration = const Duration(milliseconds: 1300),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = false,
      this.from = 600})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => FadeOutLeft(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from,
        child: child,
      );
}

// ============= FadeOutRight
class FadeOutRight extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeOutRight(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = false,
      this.from = 100})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => FadeOutLeft(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from * -1,
        child: child,
      );
}

// ============= FadeOutRightBig
class FadeOutRightBig extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeOutRightBig(
      {this.child,
      this.duration = const Duration(milliseconds: 1200),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = false,
      this.from = 600})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  Widget build(BuildContext context) => FadeOutLeft(
        duration: duration,
        delay: delay,
        controller: controller,
        manualTrigger: manualTrigger,
        animate: animate,
        from: from * -1,
        child: child,
      );
}

// ====================================
//          End FadeOuts
// ====================================

// ====================================
//     Begin ZoomIn/out Animations
// ====================================
// ============= ZoomIn
class ZoomIn extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  ZoomIn(
      {this.child,
      this.duration = const Duration(milliseconds: 500),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 1.0})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _ZoomInState createState() => _ZoomInState();
}

class _ZoomInState extends State<ZoomIn> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fade;
  late Animation<double> opacity;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);
    fade = Tween(begin: 0.0, end: widget.from)
        .animate(CurvedAnimation(curve: Curves.easeOut, parent: controller));

    opacity = Tween<double>(begin: 0.0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: fade,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: fade.value,
            child: Opacity(
              opacity: opacity.value,
              child: widget.child,
            ),
          );
        });
  }
}

// ============= ZoomOut
class ZoomOut extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  ZoomOut(
      {this.child,
      this.duration = const Duration(milliseconds: 500),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 0.0})
      : assert(() {
          if (manualTrigger == true && controller == null) {
            throw FlutterError('If you want to use manualTrigger:true, \n\n'
                'Then you must provide the controller property, that is a callback like:\n\n'
                ' ( controller: AnimationController) => yourController = controller \n\n');
          }
          return true;
        }());

  @override
  _ZoomOutState createState() => _ZoomOutState();
}

class _ZoomOutState extends State<ZoomOut> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> zoom;
  late Animation<double> opacity;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    zoom = Tween(begin: 1.0, end: widget.from)
        .animate(CurvedAnimation(curve: Curves.easeOut, parent: controller));

    opacity = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.65)));

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () => controller.forward());
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: zoom.value,
            child: Opacity(
              opacity: opacity.value,
              child: widget.child,
            ),
          );
        });
  }
}

// ====================================
//      End ZoomIn/out Animations
// ====================================
