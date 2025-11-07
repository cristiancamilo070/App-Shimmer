import 'package:app_shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';

/// A shimmer grid widget with customizable layout and item styles.
///
/// This widget creates a grid of shimmer items, perfect for displaying
/// loading states for grid-based content like image galleries or icon grids.
///
/// ## Example
///
/// ```dart
/// AppShimmerGrid(
///   itemCount: 6,
///   containerStyle: ShimmerContainerStyle(
///     width: double.infinity,
///     height: 90,
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
///   crossAxisCount: 3,
///   crossAxisSpacing: 8,
///   mainAxisSpacing: 8,
/// )
/// ```
class AppShimmerGrid extends StatelessWidget {
  /// Creates an [AppShimmerGrid].
  const AppShimmerGrid({
    required this.itemCount,
    required this.containerStyle,
    super.key,
    this.iconContainerStyle,
    this.child,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 0,
    this.childAspectRatio = 1,
    this.customGradient,
  });

  /// Number of items to display in the grid.
  final int itemCount;

  /// Style for the main container of each grid item.
  final ShimmerContainerStyle containerStyle;

  /// Optional style for an icon container within each grid item.
  final ShimmerContainerStyle? iconContainerStyle;

  /// Optional child widget to display in each grid item (e.g., an icon).
  final Widget? child;

  /// Number of columns in the grid.
  final int crossAxisCount;

  /// Horizontal spacing between grid items.
  final double crossAxisSpacing;

  /// Vertical spacing between grid items.
  final double mainAxisSpacing;

  /// Aspect ratio of each grid item.
  final double childAspectRatio;

  /// Optional custom gradient configuration for the shimmer animation.
  ///
  /// If null, [AppShimmerConstants.shimmerGradient] is used.
  final AppShimmerCustomGradient? customGradient;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      customGradient: customGradient,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: AppShimmerConstants.defaultPadding,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) {
          return _buildGridItemSkeleton(
            containerStyle: containerStyle,
            iconContainerStyle: iconContainerStyle,
            child: child,
          );
        },
      ),
    );
  }
}

/// Builds a single grid item with shimmer effect.
Widget _buildGridItemSkeleton({
  required ShimmerContainerStyle containerStyle,
  ShimmerContainerStyle? iconContainerStyle,
  Widget? child,
}) {
  return Container(
    height: 90,
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: containerStyle.customColor ?? Colors.grey.shade300,
              borderRadius: BorderRadius.circular(
                containerStyle.borderRadiusDouble,
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
        ),
        if (iconContainerStyle != null)
          Align(
            alignment: Alignment.center,
            child: Container(
              width: iconContainerStyle.width,
              height: iconContainerStyle.height,
              decoration: BoxDecoration(
                shape: iconContainerStyle.boxShape,
                color: iconContainerStyle.customColor ?? Colors.grey.shade200,
                borderRadius: iconContainerStyle.boxShape == BoxShape.rectangle
                    ? BorderRadius.circular(
                        iconContainerStyle.borderRadiusDouble,
                      )
                    : null,
                border: Border.all(
                  width: 1,
                  color: (iconContainerStyle.customColor ?? Colors.grey)
                      .withValues(alpha: 0.3),
                ),
              ),
              alignment: Alignment.center,
              child: child,
            ),
          )
        else if (child != null)
          Align(alignment: Alignment.center, child: child),
      ],
    ),
  );
}
