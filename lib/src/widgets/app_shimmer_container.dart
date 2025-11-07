import 'package:app_shimmer/app_shimmer.dart';
import 'package:app_shimmer/src/widgets/container_builder.dart';
import 'package:flutter/material.dart';

/// A shimmer container widget with customizable style.
///
/// This widget displays a single shimmer container with the specified style.
/// Perfect for placeholder content while data is loading.
///
/// ## Example
///
/// ```dart
/// AppShimmerContainer(
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
///   skeletonContainerStyle: ShimmerContainerStyle(
///     width: 200,
///     height: 100,
///     borderRadiusDouble: 12,
///   ),
/// )
/// ```
class AppShimmerContainer extends StatelessWidget {
  /// Creates an [AppShimmerContainer].
  const AppShimmerContainer(
      {required this.skeletonContainerStyle, this.customGradient, super.key});

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
      child: SizedBox(
        height: skeletonContainerStyle.height,
        child: AppShimmerContainerBuilder(
          skeletonContainerStyle: skeletonContainerStyle,
        ),
      ),
    );
  }
}
