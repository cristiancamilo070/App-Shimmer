import 'package:app_shimmer/src/constants/app_shimmer_constants.dart';
import 'package:app_shimmer/src/models/app_shimmer_style_model.dart';
import 'package:app_shimmer/src/widgets/app_shimmer_animation_wrapper.dart';
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
/// )
/// ```
class AppShimmerContainerList extends StatelessWidget {
  /// Creates an [AppShimmerContainerList].
  const AppShimmerContainerList({
    required this.itemCount,
    required this.isColumn,
    required this.skeletonContainerStyle,
    super.key,
  });

  /// The style configuration for each shimmer container in the list.
  final ShimmerContainerStyle skeletonContainerStyle;

  /// The number of shimmer containers to display.
  final int itemCount;

  /// Whether to arrange containers vertically (true) or horizontally (false).
  final bool isColumn;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
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
