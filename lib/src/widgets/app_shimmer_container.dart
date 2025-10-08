import 'package:app_shimmer/src/models/app_shimmer_style_model.dart';
import 'package:app_shimmer/src/widgets/app_shimmer_animation_wrapper.dart';
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
///   skeletonContainerStyle: ShimmerContainerStyle(
///     width: 200,
///     height: 100,
///     borderRadiusDouble: 12,
///   ),
/// )
/// ```
class AppShimmerContainer extends StatelessWidget {
  /// Creates an [AppShimmerContainer].
  const AppShimmerContainer({required this.skeletonContainerStyle, super.key});

  /// The style configuration for this shimmer container.
  final ShimmerContainerStyle skeletonContainerStyle;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      child: SizedBox(
        height: skeletonContainerStyle.height,
        child: AppShimmerContainerBuilder(
          skeletonContainerStyle: skeletonContainerStyle,
        ),
      ),
    );
  }
}
