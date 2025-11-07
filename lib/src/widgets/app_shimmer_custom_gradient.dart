import 'package:flutter/material.dart';

/// Helper class to easily build a customizable LinearGradient
/// for shimmer effects.
///
/// Example:
/// ```dart
/// AppShimmerCustomGradient(
///   direction: ShimmerDirection.topToBottom,
///   colors: [
///     Color(0x00FFFFFF),
///     Color(0x33FFFFFF),
///     Color(0x66FFFFFF),
///     Color(0x33FFFFFF),
///     Color(0x00FFFFFF),
///   ],
/// )
/// ```
class AppShimmerCustomGradient {
  /// List of colors for the gradient
  final List<Color> colors;

  /// Stops for each color (optional)
  final List<double>? stops;

  /// Direction of shimmer sweep
  final ShimmerDirection direction;

  /// Tile mode of the gradient (default: decal)
  final TileMode tileMode;

  /// Creates a custom shimmer gradient
  const AppShimmerCustomGradient({
    required this.colors,
    this.stops,
    this.direction = ShimmerDirection.leftToRight,
    this.tileMode = TileMode.decal,
  });

  /// Returns the corresponding Flutter [LinearGradient]
  LinearGradient build() {
    final alignment = _mapDirectionToAlignment(direction);
    return LinearGradient(
      colors: colors,
      stops: stops,
      begin: alignment.$1,
      end: alignment.$2,
      tileMode: tileMode,
    );
  }

  /// Internal helper to map directions to alignment pairs
  (Alignment, Alignment) _mapDirectionToAlignment(ShimmerDirection direction) {
    switch (direction) {
      case ShimmerDirection.leftToRight:
        return (Alignment.centerLeft, Alignment.centerRight);
      case ShimmerDirection.rightToLeft:
        return (Alignment.centerRight, Alignment.centerLeft);
      case ShimmerDirection.topToBottom:
        return (Alignment.topCenter, Alignment.bottomCenter);
      case ShimmerDirection.bottomToTop:
        return (Alignment.bottomCenter, Alignment.topCenter);
      case ShimmerDirection.diagonalTopLeftToBottomRight:
        return (Alignment.topLeft, Alignment.bottomRight);
      case ShimmerDirection.diagonalBottomRightToTopLeft:
        return (Alignment.bottomRight, Alignment.topLeft);
    }
  }
}

/// Supported directions for shimmer gradient
enum ShimmerDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
  diagonalTopLeftToBottomRight,
  diagonalBottomRightToTopLeft,
}
