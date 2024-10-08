import 'package:firexcode/firexcode.dart';
import 'package:firexcode/src/refresh/main.dart';
import 'package:flutter/rendering.dart';

extension XNew on Widget {
  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget. If the [CircleAvatar] is to have an image, use
  /// [backgroundImage] instead.
  Widget xCircleAvatar({
    /// The color with which to fill the circle. Changing the background
    /// color will cause the avatar to animate to the new color.
    ///
    /// If a [backgroundColor] is not specified, the theme's
    /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
    /// [ThemeData.primaryColorDark] with light foreground colors.
    final Color? backgroundColor,

    /// The default text color for text in the circle.
    ///
    /// Defaults to the primary text theme color if no [backgroundColor] is
    /// specified.
    ///
    /// Defaults to [ThemeData.primaryColorLight] for dark background colors, and
    /// [ThemeData.primaryColorDark] for light background colors.
    final Color? foregroundColor,

    /// The background image of the circle. Changing the background
    /// image will cause the avatar to animate to the new image.
    ///
    /// If the [CircleAvatar] is to have the user's initials, use [child] instead.
    final ImageProvider? backgroundImage,

    /// The size of the avatar, expressed as the radius (half the diameter).
    ///
    /// If [radius] is specified, then neither [minRadius] nor [maxRadius] may be
    /// specified. Specifying [radius] is equivalent to specifying a [minRadius]
    /// and [maxRadius], both with the value of [radius].
    ///
    /// If neither [minRadius] nor [maxRadius] are specified, defaults to 20
    /// logical pixels. This is the appropriate size for use with
    /// [ListTile.leading].
    ///
    /// Changes to the [radius] are animated (including changing from an explicit
    /// [radius] to a [minRadius]/[maxRadius] pair or vice versa).
    final double? radius,

    /// The minimum size of the avatar, expressed as the radius (half the
    /// diameter).
    ///
    /// If [minRadius] is specified, then [radius] must not also be specified.
    ///
    /// Defaults to zero.
    ///
    /// Constraint changes are animated, but size changes due to the environment
    /// itself changing are not. For example, changing the [minRadius] from 10 to
    /// 20 when the [CircleAvatar] is in an unconstrained environment will cause
    /// the avatar to animate from a 20 pixel diameter to a 40 pixel diameter.
    /// However, if the [minRadius] is 40 and the [CircleAvatar] has a parent
    /// [SizedBox] whose size changes instantaneously from 20 pixels to 40 pixels,
    /// the size will snap to 40 pixels instantly.
    final double? minRadius,

    /// The maximum size of the avatar, expressed as the radius (half the
    /// diameter).
    ///
    /// If [maxRadius] is specified, then [radius] must not also be specified.
    ///
    /// Defaults to [double.infinity].
    ///
    /// Constraint changes are animated, but size changes due to the environment
    /// itself changing are not. For example, changing the [maxRadius] from 10 to
    /// 20 when the [CircleAvatar] is in an unconstrained environment will cause
    /// the avatar to animate from a 20 pixel diameter to a 40 pixel diameter.
    /// However, if the [maxRadius] is 40 and the [CircleAvatar] has a parent
    /// [SizedBox] whose size changes instantaneously from 20 pixels to 40 pixels,
    /// the size will snap to 40 pixels instantly.
    final double? maxRadius,
  }) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      backgroundImage: backgroundImage,
      foregroundColor: foregroundColor,
      key: key,
      maxRadius: maxRadius,
      minRadius: minRadius,
      radius: radius,
      child: this,
    );
  }

  Widget cardBannerButton(
      {Color buttonColor = Colors.red,
      double buttonWidth = 150,
      double buttonHeight = 30,
      double? rounded,
      Function? onTap}) {
    return MaterialXButton(
      color: buttonColor,
      width: buttonWidth,
      height: buttonHeight,
      onTap: onTap,
      rounded: rounded,
      child: this,
    );
  }

  Widget xRaisedButton(
      {bool autofocus = false,
      Clip clipBehavior = Clip.none,
      Color? color,
      FocusNode? focusNode,
      Key? key,
      MaterialTapTargetSize? materialTapTargetSize,
      void Function()? onLongPress,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape,
      BorderSide? side,
      ButtonTextTheme? textTheme,
      Widget? child,
      AlignmentGeometry? alignment,
      double? elevation,
      Duration? animationDuration,
      MouseCursor? disabledMouseCursor,
      Color? primary,
      Color? shadowColor,
      TextStyle? textStyle,
      VisualDensity? visualDensity,
      bool? enableFeedback,
      MouseCursor? enabledMouseCursor,
      Size? minimumSize,
      Color? onSurface,
      void Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: shape as OutlinedBorder?,
        alignment: alignment,
        animationDuration: animationDuration,
        disabledMouseCursor: disabledMouseCursor,
        primary: color,
        shadowColor: shadowColor,
        side: side,
        textStyle: textStyle,
        visualDensity: visualDensity,
        enableFeedback: enableFeedback,
        enabledMouseCursor: enabledMouseCursor,
        minimumSize: minimumSize,
        onSurface: onSurface,
        tapTargetSize: materialTapTargetSize,
        elevation: elevation,
        onPrimary: primary,
      ),
      key: key,
      focusNode: focusNode,
      onLongPress: onLongPress,
      child: this,
    );
  }

  Widget xElevatedButton(
      {bool autofocus = false,
      Clip clipBehavior = Clip.none,
      Color? color,
      FocusNode? focusNode,
      Key? key,
      MaterialTapTargetSize? materialTapTargetSize,
      void Function()? onLongPress,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape,
      BorderSide? side,
      ButtonTextTheme? textTheme,
      Widget? child,
      AlignmentGeometry? alignment,
      double? elevation,
      Duration? animationDuration,
      MouseCursor? disabledMouseCursor,
      Color? primary,
      Color? shadowColor,
      TextStyle? textStyle,
      VisualDensity? visualDensity,
      bool? enableFeedback,
      MouseCursor? enabledMouseCursor,
      Size? minimumSize,
      Color? onSurface,
      void Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: shape as OutlinedBorder?,
        alignment: alignment,
        animationDuration: animationDuration,
        disabledMouseCursor: disabledMouseCursor,
        primary: color,
        shadowColor: shadowColor,
        side: side,
        textStyle: textStyle,
        visualDensity: visualDensity,
        enableFeedback: enableFeedback,
        enabledMouseCursor: enabledMouseCursor,
        minimumSize: minimumSize,
        onSurface: onSurface,
        tapTargetSize: materialTapTargetSize,
        elevation: elevation,
        onPrimary: primary,
      ),
      key: key,
      focusNode: focusNode,
      onLongPress: onLongPress,
      child: this,
    );
  }

  Widget xFlatButton(
      {bool autofocus = false,
      Clip clipBehavior = Clip.none,
      Color? color,
      FocusNode? focusNode,
      Key? key,
      MaterialTapTargetSize? materialTapTargetSize,
      void Function()? onLongPress,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape,
      BorderSide? side,
      ButtonTextTheme? textTheme,
      Widget? child,
      AlignmentGeometry? alignment,
      double? elevation,
      Duration? animationDuration,
      MouseCursor? disabledMouseCursor,
      Color? primary,
      Color? shadowColor,
      TextStyle? textStyle,
      VisualDensity? visualDensity,
      bool? enableFeedback,
      MouseCursor? enabledMouseCursor,
      Size? minimumSize,
      Color? onSurface,
      void Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      style: TextButton.styleFrom(
        padding: padding,
        shape: shape as OutlinedBorder?,
        alignment: alignment,
        animationDuration: animationDuration,
        disabledMouseCursor: disabledMouseCursor,
        primary: primary,
        shadowColor: shadowColor,
        side: side,
        textStyle: textStyle,
        visualDensity: visualDensity,
        enableFeedback: enableFeedback,
        enabledMouseCursor: enabledMouseCursor,
        minimumSize: minimumSize,
        onSurface: onSurface,
        tapTargetSize: materialTapTargetSize,
        elevation: elevation,
        backgroundColor: color,
      ),
      key: key,
      focusNode: focusNode,
      onLongPress: onLongPress,
      child: this,
    );
  }

  Widget xTextButton(
      {bool autofocus = false,
      Clip clipBehavior = Clip.none,
      Color? color,
      FocusNode? focusNode,
      Key? key,
      MaterialTapTargetSize? materialTapTargetSize,
      void Function()? onLongPress,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape,
      BorderSide? side,
      ButtonTextTheme? textTheme,
      Widget? child,
      AlignmentGeometry? alignment,
      double? elevation,
      Duration? animationDuration,
      MouseCursor? disabledMouseCursor,
      Color? primary,
      Color? shadowColor,
      TextStyle? textStyle,
      VisualDensity? visualDensity,
      bool? enableFeedback,
      MouseCursor? enabledMouseCursor,
      Size? minimumSize,
      Color? onSurface,
      void Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      style: TextButton.styleFrom(
        padding: padding,
        shape: shape as OutlinedBorder?,
        alignment: alignment,
        animationDuration: animationDuration,
        disabledMouseCursor: disabledMouseCursor,
        primary: primary,
        shadowColor: shadowColor,
        side: side,
        textStyle: textStyle,
        visualDensity: visualDensity,
        enableFeedback: enableFeedback,
        enabledMouseCursor: enabledMouseCursor,
        minimumSize: minimumSize,
        onSurface: onSurface,
        tapTargetSize: materialTapTargetSize,
        elevation: elevation,
        backgroundColor: color,
      ),
      key: key,
      focusNode: focusNode,
      onLongPress: onLongPress,
      child: this,
    );
  }

  Widget xOutlineButton(
      {bool autofocus = false,
      Clip clipBehavior = Clip.none,
      FocusNode? focusNode,
      Key? key,
      void Function()? onLongPress,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape,
      Widget? child,
      Color? color,
      MaterialTapTargetSize? materialTapTargetSize,
      AlignmentGeometry? alignment,
      BorderSide? side,
      ButtonTextTheme? textTheme,
      double? elevation,
      Duration? animationDuration,
      MouseCursor? disabledMouseCursor,
      TextStyle? textStyle,
      VisualDensity? visualDensity,
      bool? enableFeedback,
      MouseCursor? enabledMouseCursor,
      Size? minimumSize,
      Color? onSurface,
      Color? primary,
      Color? shadowColor,
      void Function()? onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      style: OutlinedButton.styleFrom(
        padding: padding,
        shape: shape as OutlinedBorder?,
        alignment: alignment,
        animationDuration: animationDuration,
        disabledMouseCursor: disabledMouseCursor,
        primary: primary,
        shadowColor: shadowColor,
        side: side,
        textStyle: textStyle,
        visualDensity: visualDensity,
        enableFeedback: enableFeedback,
        enabledMouseCursor: enabledMouseCursor,
        minimumSize: minimumSize,
        onSurface: onSurface,
        tapTargetSize: materialTapTargetSize,
        elevation: elevation,
        backgroundColor: color,
      ),
      focusNode: focusNode,
      key: key,
      onLongPress: onLongPress,
      child: this,
    );
  }

  Widget xOutlinedButton(
      {bool autofocus = false,
      Clip clipBehavior = Clip.none,
      FocusNode? focusNode,
      Key? key,
      void Function()? onLongPress,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape,
      Widget? child,
      Color? color,
      MaterialTapTargetSize? materialTapTargetSize,
      AlignmentGeometry? alignment,
      BorderSide? side,
      ButtonTextTheme? textTheme,
      double? elevation,
      Duration? animationDuration,
      MouseCursor? disabledMouseCursor,
      TextStyle? textStyle,
      VisualDensity? visualDensity,
      bool? enableFeedback,
      MouseCursor? enabledMouseCursor,
      Size? minimumSize,
      Color? onSurface,
      Color? primary,
      Color? shadowColor,
      void Function()? onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      style: OutlinedButton.styleFrom(
        padding: padding,
        shape: shape as OutlinedBorder?,
        alignment: alignment,
        animationDuration: animationDuration,
        disabledMouseCursor: disabledMouseCursor,
        primary: primary,
        shadowColor: shadowColor,
        side: side,
        textStyle: textStyle,
        visualDensity: visualDensity,
        enableFeedback: enableFeedback,
        enabledMouseCursor: enabledMouseCursor,
        minimumSize: minimumSize,
        onSurface: onSurface,
        tapTargetSize: materialTapTargetSize,
        elevation: elevation,
        backgroundColor: color,
      ),
      focusNode: focusNode,
      key: key,
      onLongPress: onLongPress,
      child: this,
    );
  }

  Widget xLiquidPullToRefresh({
    required Future<void> Function() onRefresh,
    Color? color,
    Color? backgroundColor,
    bool Function(ScrollNotification) notificationPredicate =
        defaultScrollNotificationPredicate,
    double? height,
    int springAnimationDurationInMilliseconds = 1000,
    double borderWidth = 2.0,
    bool showChildOpacityTransition = true,
    ScrollController? scrollController,
    Key? key,
  }) {
    return XLiquidPullToRefresh(
      onRefresh: onRefresh,
      backgroundColor: backgroundColor,
      borderWidth: borderWidth,
      color: color,
      height: height,
      key: key,
      notificationPredicate: notificationPredicate,
      scrollController: scrollController,
      showChildOpacityTransition: showChildOpacityTransition,
      springAnimationDurationInMilliseconds:
          springAnimationDurationInMilliseconds,
      child: this,
    );
  }

  Widget xPullRefresh(
      {required Future<void> Function() onRefresh,
      Color? color,
      Color? backgroundColor,
      bool Function(ScrollNotification) notificationPredicate =
          defaultScrollNotificationPredicate,
      double strokeWidth = 2.0,
      double displacement = 40.0,
      bool showChildOpacityTransition = true,
      String? semanticsLabel,
      String? semanticsValue,
      Key? key,
      RefreshIndicatorTriggerMode triggerMode =
          RefreshIndicatorTriggerMode.onEdge}) {
    return RefreshIndicator(
      triggerMode: triggerMode,
      onRefresh: onRefresh,
      color: color,
      backgroundColor: backgroundColor,
      displacement: displacement,
      key: key,
      notificationPredicate: notificationPredicate,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      strokeWidth: strokeWidth,
      child: this,
    );
  }

  /// A widget that controls where a child of a [Stack] is positioned.
  ///
  /// A [Positioned] widget must be a descendant of a [Stack], and the path from
  /// the [Positioned] widget to its enclosing [Stack] must contain only
  /// [StatelessWidget]s or [StatefulWidget]s (not other kinds of widgets, like
  /// [RenderObjectWidget]s).
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=EgtPleVwxBQ}
  ///
  /// If a widget is wrapped in a [Positioned], then it is a _positioned_ widget
  /// in its [Stack]. If the [top] property is non-null, the top edge of this child
  /// will be positioned [top] layout units from the top of the stack widget. The
  /// [right], [bottom], and [left] properties work analogously.
  ///
  /// If both the [top] and [bottom] properties are non-null, then the child will
  /// be forced to have exactly the height required to satisfy both constraints.
  /// Similarly, setting the [right] and [left] properties to non-null values will
  /// force the child to have a particular width. Alternatively the [width] and
  /// [height] properties can be used to give the dimensions, with one
  /// corresponding position property (e.g. [top] and [height]).
  ///
  /// If all three values on a particular axis are null, then the
  /// [Stack.alignment] property is used to position the child.
  ///
  /// If all six values are null, the child is a non-positioned child. The [Stack]
  /// uses only the non-positioned children to size itself.
  ///
  /// See also:
  ///
  ///  * [AnimatedPositioned], which automatically transitions the child's
  ///    position over a given duration whenever the given position changes.
  ///  * [PositionedTransition], which takes a provided [Animation] to transition
  ///    changes in the child's position over a given duration.
  ///  * [PositionedDirectional], which adapts to the ambient [Directionality].
  Widget xPositioned({
    /// The distance that the child's left edge is inset from the left of the stack.
    ///
    /// Only two out of the three horizontal values ([left], [right], [width]) can be
    /// set. The third must be null.
    ///
    /// If all three are null, the [Stack.alignment] is used to position the child
    /// horizontally.
    final double? left,

    /// The distance that the child's top edge is inset from the top of the stack.
    ///
    /// Only two out of the three vertical values ([top], [bottom], [height]) can be
    /// set. The third must be null.
    ///
    /// If all three are null, the [Stack.alignment] is used to position the child
    /// vertically.
    final double? top,

    /// The distance that the child's right edge is inset from the right of the stack.
    ///
    /// Only two out of the three horizontal values ([left], [right], [width]) can be
    /// set. The third must be null.
    ///
    /// If all three are null, the [Stack.alignment] is used to position the child
    /// horizontally.
    final double? right,

    /// The distance that the child's bottom edge is inset from the bottom of the stack.
    ///
    /// Only two out of the three vertical values ([top], [bottom], [height]) can be
    /// set. The third must be null.
    ///
    /// If all three are null, the [Stack.alignment] is used to position the child
    /// vertically.
    final double? bottom,

    /// The child's width.
    ///
    /// Only two out of the three horizontal values ([left], [right], [width]) can be
    /// set. The third must be null.
    ///
    /// If all three are null, the [Stack.alignment] is used to position the child
    /// horizontally.
    final double? width,

    /// The child's height.
    ///
    /// Only two out of the three vertical values ([top], [bottom], [height]) can be
    /// set. The third must be null.
    ///
    /// If all three are null, the [Stack.alignment] is used to position the child
    /// vertically.
    final double? height,
    final Key? key,
  }) {
    return Positioned(
      bottom: bottom,
      height: height,
      key: key,
      left: left,
      right: right,
      top: top,
      width: width,
      child: this,
    );
  }

  Widget xChip(
      {final Widget? avatar,
      final Widget? label,
      final TextStyle? labelStyle,
      final EdgeInsetsGeometry? labelPadding,
      final ShapeBorder? shape,
      final Clip? clipBehavior,
      final FocusNode? focusNode,
      final bool? autofocus,
      final Color? backgroundColor,
      final EdgeInsetsGeometry? padding,
      final VisualDensity? visualDensity,
      final Widget? deleteIcon,
      final VoidCallback? onDeleted,
      final Color? deleteIconColor,
      final String? deleteButtonTooltipMessage,
      final MaterialTapTargetSize? materialTapTargetSize,
      final double? elevation,
      final Color? shadowColor,
      final Key? key,
      final BorderSide? side,
      final bool useDeleteButtonTooltip = true}) {
    return Chip(
      key: key,
      label: this,
      side: side,
      useDeleteButtonTooltip: useDeleteButtonTooltip,
      avatar: avatar,
      labelStyle: labelStyle,
      labelPadding: labelPadding,
      deleteIcon: deleteIcon,
      onDeleted: onDeleted,
      deleteIconColor: deleteIconColor,
      deleteButtonTooltipMessage: deleteButtonTooltipMessage,
      shape: shape as OutlinedBorder?,
      clipBehavior: clipBehavior ?? Clip.none,
      focusNode: focusNode,
      autofocus: autofocus ?? true,
      backgroundColor: backgroundColor,
      padding: padding,
      visualDensity: visualDensity,
      materialTapTargetSize: materialTapTargetSize,
      elevation: elevation ?? 0.0,
      shadowColor: shadowColor,
    );
  }

  /// The text to display as the tab's label.
  ///
  /// Must not be used in combination with [child].
  Widget xTab({
    final Key? key,

    /// The widget to be used as the tab's label.
    ///
    /// Usually a [Text] widget, possibly wrapped in a [Semantics] widget.
    ///
    /// Must not be used in combination with [text].
    final String? text,

    /// An icon to display as the tab's label.
    final Widget? icon,

    /// The margin added around the tab's icon.
    ///
    /// Only useful when used in combination with [icon], and either one of
    /// [text] or [child] is non-null.
    required final EdgeInsetsGeometry iconMargin,
  }) {
    return Tab(
      icon: icon,
      key: key,
      text: text,
      iconMargin: iconMargin,
      child: this,
    );
  }

  Widget xForm(
      {

      /// Enables the form to veto attempts by the user to dismiss the [ModalRoute]
      /// that contains the form.
      ///
      /// If the callback returns a Future that resolves to false, the form's route
      /// will not be popped.
      ///
      /// See also:
      ///
      ///  * [WillPopScope], another widget that provides a way to intercept the
      ///    back button.
      final WillPopCallback? onWillPop,

      /// Called when one of the form fields changes.
      ///
      /// In addition to this callback being invoked, all the form fields themselves
      /// will rebuild.
      final VoidCallback? onChanged,

      /// Used to enable/disable form fields auto validation and update their error
      /// text.
      ///
      /// {@macro flutter.widgets.FormField.autovalidateMode}
      final AutovalidateMode? autovalidateMode,
      Key? key}) {
    return Form(
      onChanged: onChanged,
      onWillPop: onWillPop,
      key: key,
      autovalidateMode: autovalidateMode,
      child: this,
    );
  }
}
