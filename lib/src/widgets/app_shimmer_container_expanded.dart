import 'package:app_shimmer/src/models/app_shimmer_style_model.dart';
import 'package:app_shimmer/src/widgets/app_shimmer_animation_wrapper.dart';
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
///   child: SkeletonContainerExpanded(
///     skeletonContainerStyle: ShimmerContainerStyle(
///       width: double.infinity,
///       borderRadiusDouble: 8,
///     ),
///   ),
/// )
/// ```
class AppShimmerContainerExpanded extends StatelessWidget {
  /// Creates a [AppShimmerContainerExpanded].
  const AppShimmerContainerExpanded({
    required this.skeletonContainerStyle,
    super.key,
  });

  /// The style configuration for this shimmer container.
  final ShimmerContainerStyle skeletonContainerStyle;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      child: Expanded(
        child: AppShimmerContainerBuilder(
            skeletonContainerStyle: skeletonContainerStyle),
      ),
    );
  }
}
