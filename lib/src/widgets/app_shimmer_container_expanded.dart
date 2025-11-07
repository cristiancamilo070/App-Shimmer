import 'package:app_shimmer/app_shimmer.dart';
import 'package:app_shimmer/src/widgets/container_builder.dart';
import 'package:flutter/material.dart';

/// An expanded shimmer container that fills available space.
///
/// Useful when you need a shimmer container that expands to fill
/// its parent's constraints.
///
/// ## Example
///
/// ```dart
/// Expanded(
///   child: AppShimmerContainerExpanded(
///     customGradient: AppShimmerCustomGradient(
///       direction: ShimmerDirection.topToBottom,
///       colors: [
///         Color(0x00FFFFFF),
///         Color(0x33FFFFFF),
///         Color(0x66FFFFFF),
///         Color(0x33FFFFFF),
///         Color(0x00FFFFFF),
///       ],
///       stops: [0.0, 0.25, 0.5, 0.75, 1.0],
///     ),
///
///     skeletonContainerStyle: ShimmerContainerStyle(
///       width: double.infinity,
///       borderRadiusDouble: 8,
///     ),
///   ),
/// )
/// ```
///
/// If [customGradient] is not provided, the default
/// [AppShimmerConstants.shimmerGradient] will be used.
class AppShimmerContainerExpanded extends StatelessWidget {
  /// Creates a [AppShimmerContainerExpanded].
  const AppShimmerContainerExpanded({
    required this.skeletonContainerStyle,
    this.customGradient,
    super.key,
  });

  /// The style configuration for this shimmer container.
  final ShimmerContainerStyle skeletonContainerStyle;

  /// Optional custom gradient configuration for the shimmer animation.
  ///
  /// If null, [AppShimmerConstants.shimmerGradient] is used.
  final AppShimmerCustomGradient? customGradient;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      customGradient: customGradient,
      child: Expanded(
        child: AppShimmerContainerBuilder(
          skeletonContainerStyle: skeletonContainerStyle,
        ),
      ),
    );
  }
}
