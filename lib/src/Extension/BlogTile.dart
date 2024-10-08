import 'package:firexcode/firexcode.dart';

extension BlogTileX on DecorationImage {
  Widget xBlogTile({
    final Key? key,
    final Function? onTap,
    final Widget? child,
    final Color? backSideBackgroundColor,
    final double? cardElevation,
    final double? imageHeight,
    final Widget? title,
    final Widget? subTitle,
    final Widget? trailing,
    final ShapeBorder? shape,
    final Widget? leading,
    final EdgeInsetsGeometry? margin,
    final Function? tileOnTap,
    final double? backrounded,
    final DecorationImage? image,
    final BorderRadiusGeometry? backBorderRadius,
  }) {
    return XBlogTile(
      backBorderRadius: backBorderRadius,
      backSideBackgroundColor: backSideBackgroundColor,
      backrounded: backrounded,
      cardElevation: cardElevation,
      image: this,
      imageHeight: imageHeight,
      key: key,
      leading: leading,
      margin: margin,
      onTap: onTap,
      shape: shape,
      subTitle: subTitle,
      tileOnTap: tileOnTap,
      title: title,
      trailing: trailing,
      child: child,
    );
  }
}
