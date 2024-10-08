import 'package:firexcode/firexcode.dart';

extension Xgradient on List {
  Gradient xLG(
      {final List<double>? stops,
      final GradientTransform? transform,
      final AlignmentGeometry begin = Alignment.centerLeft,
      final TileMode tileMode = TileMode.clamp,
      final AlignmentGeometry end = Alignment.centerRight}) {
    return LinearGradient(
      stops: stops,
      transform: transform,
      begin: begin,
      end: end, // 10% of the width, so there are ten blinds.
      colors: this as List<Color>, // whitish to gray
      tileMode: tileMode,
      // repeats the gradient over the canvas
    );
  }

  Gradient xLGMirror(
      {final List<double>? stops,
      final GradientTransform? transform,
      final AlignmentGeometry begin = Alignment.centerLeft,
      final AlignmentGeometry end = Alignment.centerRight}) {
    return LinearGradient(
      stops: stops,
      transform: transform,
      begin: begin,
      end: end, // 10% of the width, so there are ten blinds.
      colors: this as List<Color>, // whitish to gray
      tileMode: TileMode.mirror,
      // repeats the gradient over the canvas
    );
  }

  Gradient xLGrepeated(
      {final List<double>? stops,
      final GradientTransform? transform,
      final AlignmentGeometry begin = Alignment.centerLeft,
      final AlignmentGeometry end = Alignment.centerRight}) {
    return LinearGradient(
      stops: stops,
      transform: transform,
      begin: begin,
      end: end, // 10% of the width, so there are ten blinds.
      colors: this as List<Color>, // whitish to gray
      tileMode: TileMode.repeated,
      // repeats the gradient over the canvas
    );
  }

  Gradient xLGClamp(
      {final List<double>? stops,
      final GradientTransform? transform,
      final AlignmentGeometry begin = Alignment.centerLeft,
      final AlignmentGeometry end = Alignment.centerRight}) {
    return LinearGradient(
      stops: stops,
      transform: transform,
      begin: begin,
      end: end, // 10% of the width, so there are ten blinds.
      colors: this as List<Color>, // whitish to gray
      tileMode: TileMode.clamp,
      // repeats the gradient over the canvas
    );
  }
}
