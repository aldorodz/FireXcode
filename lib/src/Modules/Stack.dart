import 'package:flutter/gestures.dart';
import 'package:firexcode/firexcode.dart';

class XStack {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final Key? key;
  final Clip? clipBehavior;
  final TextDirection? textDirection;

  XStack(
      {this.alignment,
      this.clipBehavior,
      this.fit,
      this.key,
      this.textDirection});

  Widget list(List<Widget> list) {
    return list.xStack(
      alignment: alignment,
      fit: fit,
      clipBehavior: clipBehavior,
      key: key,
      textDirection: textDirection,
    );
  }
}

XStack xStack = XStack();
XWrap xWrap = XWrap();
XCustomScrollView xCustomScrollView = XCustomScrollView();

class XCustomScrollView {
  Key? key;
  Axis scrollDirection = Axis.vertical;
  bool reverse = false;
  ScrollController? controller;
  bool? primary;
  ScrollPhysics? physics;
  bool shrinkWrap = false;
  Key? center;
  double anchor = 0.0;
  double? cacheExtent;
  int? semanticChildCount;
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;

  Widget list(List<Widget> list) {
    return list.xCustomScrollView(
      anchor: anchor,
      cacheExtent: cacheExtent,
      center: center,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      key: key,
      physics: physics,
      primary: primary,
      reverse: reverse,
      scrollDirection: scrollDirection,
      semanticChildCount: semanticChildCount,
      shrinkWrap: shrinkWrap,
    );
  }
}

class XWrap {
  /// The direction to use as the main axis.
  ///
  /// For example, if [direction] is [Axis.horizontal], the default, the
  /// children are placed adjacent to one another in a horizontal run until the
  /// available horizontal space is consumed, at which point a subsequent
  /// children are placed in a new run vertically adjacent to the previous run.
  final Axis? direction;

  /// How the children within a run should be placed in the main axis.
  ///
  /// For example, if [alignment] is [WrapAlignment.center], the children in
  /// each run are grouped together in the center of their run in the main axis.
  ///
  /// Defaults to [WrapAlignment.start].
  ///
  /// See also:
  ///
  ///  * [runAlignment], which controls how the runs are placed relative to each
  ///    other in the cross axis.
  ///  * [crossAxisAlignment], which controls how the children within each run
  ///    are placed relative to each other in the cross axis.
  final WrapAlignment? alignment;

  /// How much space to place between children in a run in the main axis.
  ///
  /// For example, if [spacing] is 10.0, the children will be spaced at least
  /// 10.0 logical pixels apart in the main axis.
  ///
  /// If there is additional free space in a run (e.g., because the wrap has a
  /// minimum size that is not filled or because some runs are longer than
  /// others), the additional free space will be allocated according to the
  /// [alignment].
  ///
  /// Defaults to 0.0.
  final double? spacing;

  /// How the runs themselves should be placed in the cross axis.
  ///
  /// For example, if [runAlignment] is [WrapAlignment.center], the runs are
  /// grouped together in the center of the overall [Wrap] in the cross axis.
  ///
  /// Defaults to [WrapAlignment.start].
  ///
  /// See also:
  ///
  ///  * [alignment], which controls how the children within each run are placed
  ///    relative to each other in the main axis.
  ///  * [crossAxisAlignment], which controls how the children within each run
  ///    are placed relative to each other in the cross axis.
  final WrapAlignment? runAlignment;

  /// How much space to place between the runs themselves in the cross axis.
  ///
  /// For example, if [runSpacing] is 10.0, the runs will be spaced at least
  /// 10.0 logical pixels apart in the cross axis.
  ///
  /// If there is additional free space in the overall [Wrap] (e.g., because
  /// the wrap has a minimum size that is not filled), the additional free space
  /// will be allocated according to the [runAlignment].
  ///
  /// Defaults to 0.0.
  final double? runSpacing;

  /// How the children within a run should be aligned relative to each other in
  /// the cross axis.
  ///
  /// For example, if this is set to [WrapCrossAlignment.end], and the
  /// [direction] is [Axis.horizontal], then the children within each
  /// run will have their bottom edges aligned to the bottom edge of the run.
  ///
  /// Defaults to [WrapCrossAlignment.start].
  ///
  /// See also:
  ///
  ///  * [alignment], which controls how the children within each run are placed
  ///    relative to each other in the main axis.
  ///  * [runAlignment], which controls how the runs are placed relative to each
  ///    other in the cross axis.
  final WrapCrossAlignment? crossAxisAlignment;

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  ///
  /// Defaults to the ambient [Directionality].
  ///
  /// If the [direction] is [Axis.horizontal], this controls order in which the
  /// children are positioned (left-to-right or right-to-left), and the meaning
  /// of the [alignment] property's [WrapAlignment.start] and
  /// [WrapAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and either the
  /// [alignment] is either [WrapAlignment.start] or [WrapAlignment.end], or
  /// there's more than one child, then the [textDirection] (or the ambient
  /// [Directionality]) must not be null.
  ///
  /// If the [direction] is [Axis.vertical], this controls the order in which
  /// runs are positioned, the meaning of the [runAlignment] property's
  /// [WrapAlignment.start] and [WrapAlignment.end] values, as well as the
  /// [crossAxisAlignment] property's [WrapCrossAlignment.start] and
  /// [WrapCrossAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and either the
  /// [runAlignment] is either [WrapAlignment.start] or [WrapAlignment.end], the
  /// [crossAxisAlignment] is either [WrapCrossAlignment.start] or
  /// [WrapCrossAlignment.end], or there's more than one child, then the
  /// [textDirection] (or the ambient [Directionality]) must not be null.
  final TextDirection? textDirection;

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  ///
  /// If the [direction] is [Axis.vertical], this controls which order children
  /// are painted in (down or up), the meaning of the [alignment] property's
  /// [WrapAlignment.start] and [WrapAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and either the [alignment]
  /// is either [WrapAlignment.start] or [WrapAlignment.end], or there's
  /// more than one child, then the [verticalDirection] must not be null.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the order in which
  /// runs are positioned, the meaning of the [runAlignment] property's
  /// [WrapAlignment.start] and [WrapAlignment.end] values, as well as the
  /// [crossAxisAlignment] property's [WrapCrossAlignment.start] and
  /// [WrapCrossAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and either the
  /// [runAlignment] is either [WrapAlignment.start] or [WrapAlignment.end], the
  /// [crossAxisAlignment] is either [WrapCrossAlignment.start] or
  /// [WrapCrossAlignment.end], or there's more than one child, then the
  /// [verticalDirection] must not be null.
  final VerticalDirection? verticalDirection;
  final Key? key;

  XWrap(
      {this.direction,
      this.alignment,
      this.spacing,
      this.runAlignment,
      this.runSpacing,
      this.crossAxisAlignment,
      this.textDirection,
      this.verticalDirection,
      this.key});

  Widget list(List<Widget> list) {
    return list.xWrap(
      alignment: alignment,
      crossAxisAlignment: crossAxisAlignment,
      direction: direction,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      spacing: spacing,
      verticalDirection: verticalDirection,
      key: key,
      textDirection: textDirection,
    );
  }
}
