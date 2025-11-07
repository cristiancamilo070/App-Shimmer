import 'package:app_shimmer/app_shimmer.dart';
import 'package:app_shimmer/src/widgets/container_builder.dart';
import 'package:flutter/material.dart';

/// A list of shimmer containers arranged horizontally or vertically.
///
/// This widget displays multiple shimmer containers in either a horizontal
/// or vertical list layout.
///
/// ## Example
///
/// ```dart
/// AppShimmerContainerList(
///   itemCount: 5,
///   isColumn: false, // Horizontal
///   skeletonContainerStyle: ShimmerContainerStyle(
///     width: 100,
///     height: 100,
///   ),
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
/// )
/// ```
class AppShimmerContainerList extends StatelessWidget {
  /// Creates an [AppShimmerContainerList].
  const AppShimmerContainerList({
    required this.itemCount,
    required this.isColumn,
    required this.skeletonContainerStyle,
    this.customGradient,
    super.key,
  });

  /// The style configuration for each shimmer container in the list.
  final ShimmerContainerStyle skeletonContainerStyle;

  /// Optional custom gradient configuration for the shimmer animation.
  ///
  /// If null, [AppShimmerConstants.shimmerGradient] is used.
  final AppShimmerCustomGradient? customGradient;

  /// The number of shimmer containers to display.
  final int itemCount;

  /// Whether to arrange containers vertically (true) or horizontally (false).
  final bool isColumn;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      customGradient: customGradient,
      child: (!isColumn)
          ? SizedBox(
              height: skeletonContainerStyle.height ?? 0 + 20,
              width: skeletonContainerStyle.width * (itemCount) +
                  (itemCount) * AppShimmerConstants.defaultSpacing,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppShimmerConstants.defaultSpacing),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppShimmerContainerBuilder(
                          skeletonContainerStyle: skeletonContainerStyle,
                        ),
                        const SizedBox(
                            width: AppShimmerConstants.defaultSpacing),
                      ],
                    );
                  },
                ),
              ),
            )
          : SizedBox(
              width: skeletonContainerStyle.width,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppShimmerContainerBuilder(
                        skeletonContainerStyle: skeletonContainerStyle,
                      ),
                      const SizedBox(
                          height: AppShimmerConstants.defaultSpacing),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
