import 'package:firexcode/firexcode.dart';

extension Drawers on Widget {
  /// RoundedCorner Drawer
  Widget xRCdarwer({
    BorderRadius borderRadius = BorderRadius.zero,

    /// The semantic label of the dialog used by accessibility frameworks to
    /// announce screen transitions when the drawer is opened and closed.
    ///
    /// If this label is not provided, it will default to
    /// [MaterialLocalizations.drawerLabel].
    ///
    /// See also:
    ///
    ///  * [SemanticsConfiguration.namesRoute], for a description of how this
    ///    value is used.
    final String? semanticLabel,

    /// The z-coordinate at which to place this drawer relative to its parent.
    ///
    /// This controls the size of the shadow below the drawer.
    ///
    /// Defaults to 16, the appropriate elevation for drawers. The value is
    /// always non-negative.
    double elevation = 16.0,
    Key? key,
  }) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Drawer(
        elevation: elevation,
        key: key,
        semanticLabel: semanticLabel,
        child: this,
      ),
    );
  }
}
