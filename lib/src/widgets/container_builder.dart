import 'package:app_shimmer/src/constants/app_shimmer_constants.dart';
import 'package:app_shimmer/src/models/app_shimmer_style_model.dart';
import 'package:flutter/material.dart';

/// Internal widget that builds the actual container with shimmer styling.
///
/// This widget handles the visual rendering of shimmer containers
/// with proper styling, shadows, and shape configurations.
class AppShimmerContainerBuilder extends StatelessWidget {
  /// Style configuration for the container.
  final ShimmerContainerStyle skeletonContainerStyle;

  /// Creates a new shimmer container builder.
  ///
  /// @param style: Configuration for container appearance [ShimmerContainerStyle].
  const AppShimmerContainerBuilder(
      {required this.skeletonContainerStyle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: skeletonContainerStyle.width,
      height: skeletonContainerStyle.height,
      decoration: BoxDecoration(
        shape: skeletonContainerStyle.boxShape,
        color: skeletonContainerStyle.customColor ?? Colors.grey.shade300,
        borderRadius: (skeletonContainerStyle.boxShape == BoxShape.rectangle)
            ? BorderRadius.circular(skeletonContainerStyle.borderRadiusDouble)
            : null,
        boxShadow: AppShimmerConstants.defaultShadow,
      ),
    );
  }
}
