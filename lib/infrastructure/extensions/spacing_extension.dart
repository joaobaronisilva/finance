import 'package:flutter/material.dart';

import '../infrastructure.dart';

/// Add extension method to [Spacing] handle responsiveness.
extension SpacingExtensions on Spacing {
  /// Current vlaue with [responsiveWidth] extension.
  double get width => value.responsiveWidth;

  /// Current value with [responsiveHeight] extension.
  double get height => value.responsiveHeight;

  /// Builds a [SizedBox] with vertical spacing using responsiveHeight.
  SizedBox get vertical => SizedBox(height: value.responsiveHeight);

  /// Builds a [SizedBox] with horizontal spacing using responsiveWidth.
  SizedBox get horizontal => SizedBox(width: value.responsiveWidth);
}
