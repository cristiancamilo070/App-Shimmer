import 'package:app_shimmer/src/constants/app_shimmer_constants.dart';
import 'package:flutter/material.dart';

/// Defines the style properties for a shimmer container.
///
/// This class encapsulates all the visual properties needed to create
/// a shimmer loading effect, including dimensions, shape, border radius,
/// and color.
///
/// ## Example
///
/// ```dart
/// ShimmerContainerStyle(
///   width: 200,
///   height: 100,
///   borderRadiusDouble: 12,
///   boxShape: BoxShape.rectangle,
///   customColor: Colors.grey.shade300,
/// )
/// ```
class ShimmerContainerStyle {
  /// Creates a shimmer container style.
  ///
  /// The [width] parameter is required. All other parameters are optional
  /// and have sensible defaults.
  const ShimmerContainerStyle({
    required this.width,
    this.height,
    this.borderRadiusDouble = AppShimmerConstants.defaultBorderRadius,
    this.boxShape = BoxShape.rectangle,
    this.customColor,
  });

  /// The width of the shimmer container.
  final double width;

  /// The height of the shimmer container.
  ///
  /// If null, the height will be determined by the container's content.
  final double? height;

  /// The border radius for rectangle-shaped containers.
  ///
  /// This property is ignored for circular containers.
  /// Defaults to 8.0.
  final double borderRadiusDouble;

  /// The shape of the shimmer container.
  ///
  /// Can be either [BoxShape.rectangle] or [BoxShape.circle].
  /// Defaults to [BoxShape.rectangle].
  final BoxShape boxShape;

  /// Optional custom color for the shimmer base.
  ///
  /// If null, a default grey color will be used.
  final Color? customColor;
}
