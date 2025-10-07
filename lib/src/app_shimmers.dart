// ignore_for_file: deprecated_member_use

/// A comprehensive Flutter shimmer loading library.
///
/// This library provides a collection of pre-built shimmer widgets
/// that can be used to display loading states in your application.
library;

import 'hunch_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

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
    this.borderRadiusDouble = 8,
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

/// The gradient used for the shimmer animation effect.
///
/// This gradient creates a light sweep effect across the shimmer containers.
const shimmerGradient = LinearGradient(
  colors: [
    Color.fromARGB(0, 255, 255, 255),
    Color.fromARGB(40, 255, 255, 255),
    Color.fromARGB(82, 255, 255, 255),
    Color.fromARGB(40, 255, 255, 255),
    Color.fromARGB(0, 255, 255, 255),
  ],
  stops: [0.0, 0.3, 0.5, 0.7, 1],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  tileMode: TileMode.decal,
);

/// The basic shimmer animation wrapper for any widget.
///
/// This widget wraps its child with shimmer animation effects using
/// [HunchAnimation] and [SkeletonTheme].
///
/// ## Example
///
/// ```dart
/// AppShimmerAnimation(
///   child: Container(
///     width: 100,
///     height: 100,
///     color: Colors.grey,
///   ),
/// )
/// ```
class AppShimmerAnimation extends StatelessWidget {
  /// Creates an [AppShimmerAnimation].
  const AppShimmerAnimation({super.key, required this.child});

  /// The widget to be animated with shimmer effect.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HunchAnimation(
      child: SkeletonTheme(
        themeMode: ThemeMode.system,
        shimmerGradient: shimmerGradient,
        child: SkeletonItem(child: child),
      ),
    );
  }
}

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
  const AppShimmerContainer({super.key, required this.skeletonContainerStyle});

  /// The style configuration for this shimmer container.
  final ShimmerContainerStyle skeletonContainerStyle;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      child: SizedBox(
        height: skeletonContainerStyle.height,
        child: _containerShimmer(
          skeletonContainerStyle: skeletonContainerStyle,
        ),
      ),
    );
  }
}

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
class SkeletonContainerExpanded extends StatelessWidget {
  /// Creates a [SkeletonContainerExpanded].
  const SkeletonContainerExpanded({
    super.key,
    required this.skeletonContainerStyle,
  });

  /// The style configuration for this shimmer container.
  final ShimmerContainerStyle skeletonContainerStyle;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      child: _containerShimmerExpanded(
        skeletonContainerStyle: skeletonContainerStyle,
      ),
    );
  }
}

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
    super.key,
    required this.itemCount,
    required this.isColumn,
    required this.skeletonContainerStyle,
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
              width:
                  skeletonContainerStyle.width * (itemCount) + (itemCount) * 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _containerShimmer(
                          skeletonContainerStyle: skeletonContainerStyle,
                        ),
                        const SizedBox(width: 10),
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
                      _containerShimmer(
                        skeletonContainerStyle: skeletonContainerStyle,
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
    );
  }
}

/// A shimmer version of Flutter's ListTile widget.
///
/// This widget mimics the layout of a ListTile with optional leading,
/// title, subtitle, and trailing shimmer elements.
///
/// ## Example
///
/// ```dart
/// AppShimmerListTile(
///   leadingStyle: ShimmerContainerStyle(
///     width: 40,
///     height: 40,
///     boxShape: BoxShape.circle,
///   ),
///   titleStyle: ShimmerContainerStyle(width: 150, height: 16),
///   subtitleStyle: ShimmerContainerStyle(width: 100, height: 12),
///   contentSpacing: 16,
///   verticalSpacing: 4,
///   hasContainer: true,
/// )
/// ```
class AppShimmerListTile extends StatelessWidget {
  /// Creates an [AppShimmerListTile].
  const AppShimmerListTile({
    super.key,
    this.leadingStyle,
    required this.titleStyle,
    this.subtitleStyle,
    this.padding,
    this.contentSpacing,
    this.verticalSpacing,
    this.paragraphStyle,
    this.trailingStyle,
    this.hasContainer,
  });

  /// Style for the leading element (typically a circular avatar).
  final ShimmerContainerStyle? leadingStyle;

  /// Style for the title element (required).
  final ShimmerContainerStyle titleStyle;

  /// Style for the subtitle element.
  final ShimmerContainerStyle? subtitleStyle;

  /// Style for an optional paragraph element below the subtitle.
  final ShimmerContainerStyle? paragraphStyle;

  /// Style for the trailing element.
  final ShimmerContainerStyle? trailingStyle;

  /// Padding around the entire list tile.
  final EdgeInsetsGeometry? padding;

  /// Horizontal spacing between elements (leading, content, trailing).
  final double? contentSpacing;

  /// Vertical spacing between title, subtitle, and paragraph.
  final double? verticalSpacing;

  /// Whether to wrap the list tile in a container with background and shadow.
  final bool? hasContainer;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          decoration: hasContainer == true
              ? BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
                )
              : null,
          padding: hasContainer == true ? const EdgeInsets.all(16) : null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingStyle?.width != null)
                _containerShimmer(skeletonContainerStyle: leadingStyle!),
              SizedBox(width: contentSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _containerShimmer(skeletonContainerStyle: titleStyle),
                    if (subtitleStyle?.width != null) ...[
                      SizedBox(height: verticalSpacing),
                      _containerShimmer(skeletonContainerStyle: subtitleStyle!),
                    ],
                    if (paragraphStyle?.width != null) ...[
                      SizedBox(height: verticalSpacing),
                      _containerShimmer(
                        skeletonContainerStyle: paragraphStyle!,
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: contentSpacing),
              if (trailingStyle?.width != null)
                _containerShimmer(skeletonContainerStyle: trailingStyle!),
            ],
          ),
        ),
      ),
    );
  }
}

/// A ListView containing multiple shimmer ListTile widgets.
///
/// This widget creates a scrollable list of shimmer list tiles with
/// optional dividers between items.
///
/// ## Example
///
/// ```dart
/// AppShimmerListTileListView(
///   itemCount: 5,
///   titleStyle: ShimmerContainerStyle(width: 150, height: 16),
///   subtitleStyle: ShimmerContainerStyle(width: 100, height: 12),
///   leadingStyle: ShimmerContainerStyle(
///     width: 40,
///     height: 40,
///     boxShape: BoxShape.circle,
///   ),
///   dividerWidget: SizedBox(height: 8),
/// )
/// ```
class AppShimmerListTileListView extends StatelessWidget {
  /// Creates an [AppShimmerListTileListView].
  const AppShimmerListTileListView({
    this.heightFull,
    super.key,
    required this.itemCount,
    this.leadingStyle,
    required this.titleStyle,
    this.paragraphStyle,
    this.trailingStyle,
    this.subtitleStyle,
    this.padding,
    this.contentSpacing,
    this.verticalSpacing,
    this.hasContainer,
    this.dividerWidget,
  });

  /// Total height of the list view. If null, the list will size itself.
  final double? heightFull;

  /// Number of shimmer list tiles to display.
  final int itemCount;

  /// Style for the title in each list tile (required).
  final ShimmerContainerStyle titleStyle;

  /// Style for the leading element in each list tile.
  final ShimmerContainerStyle? leadingStyle;

  /// Style for the subtitle in each list tile.
  final ShimmerContainerStyle? subtitleStyle;

  /// Style for the paragraph in each list tile.
  final ShimmerContainerStyle? paragraphStyle;

  /// Style for the trailing element in each list tile.
  final ShimmerContainerStyle? trailingStyle;

  /// Padding for each list tile.
  final EdgeInsetsGeometry? padding;

  /// Horizontal spacing between elements in each list tile.
  final double? contentSpacing;

  /// Vertical spacing between title, subtitle, and paragraph.
  final double? verticalSpacing;

  /// Whether to wrap each list tile in a container.
  final bool? hasContainer;

  /// Widget to use as divider between list tiles.
  final Widget? dividerWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: heightFull,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (BuildContext context, int index) {
              return dividerWidget ?? const DefaultDividerWidget(height: 1);
            },
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  AppShimmerListTile(
                    hasContainer: hasContainer,
                    padding: padding,
                    leadingStyle: leadingStyle,
                    subtitleStyle: subtitleStyle,
                    verticalSpacing: verticalSpacing,
                    contentSpacing: contentSpacing,
                    titleStyle: titleStyle,
                    paragraphStyle: paragraphStyle,
                    trailingStyle: trailingStyle,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

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
///   crossAxisCount: 3,
///   crossAxisSpacing: 8,
///   mainAxisSpacing: 8,
/// )
/// ```
class AppShimmerGrid extends StatelessWidget {
  /// Creates an [AppShimmerGrid].
  const AppShimmerGrid({
    super.key,
    required this.itemCount,
    required this.containerStyle,
    this.iconContainerStyle,
    this.child,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 0,
    this.childAspectRatio = 1,
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

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      child: GridView.builder(
        padding: const EdgeInsets.only(right: 16, left: 16),
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

/// Builds a basic shimmer container.
Widget _containerShimmer({
  required ShimmerContainerStyle skeletonContainerStyle,
}) {
  return Column(
    children: [
      Container(
        width: skeletonContainerStyle.width,
        height: skeletonContainerStyle.height,
        decoration: BoxDecoration(
          shape: skeletonContainerStyle.boxShape,
          color: skeletonContainerStyle.customColor ?? Colors.grey.shade300,
          borderRadius: (skeletonContainerStyle.boxShape == BoxShape.rectangle)
              ? BorderRadius.circular(
                  skeletonContainerStyle.borderRadiusDouble,
                )
              : null,
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.5,
              blurRadius: 0.5,
              color: Colors.grey.withOpacity(0.1),
            ),
          ],
        ),
      ),
    ],
  );
}

/// Builds an expanded shimmer container.
Widget _containerShimmerExpanded({
  required ShimmerContainerStyle skeletonContainerStyle,
}) {
  return Column(
    children: [
      Expanded(
        child: Container(
          width: skeletonContainerStyle.width,
          height: skeletonContainerStyle.height,
          decoration: BoxDecoration(
            shape: skeletonContainerStyle.boxShape,
            color: skeletonContainerStyle.customColor ?? Colors.grey.shade300,
            borderRadius:
                (skeletonContainerStyle.boxShape == BoxShape.rectangle)
                    ? BorderRadius.circular(
                        skeletonContainerStyle.borderRadiusDouble,
                      )
                    : null,
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.5,
                blurRadius: 0.5,
                color: Colors.grey.withOpacity(0.1),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

/// A default divider widget for use between shimmer list items.
///
/// This widget provides a simple horizontal divider with customizable height.
class DefaultDividerWidget extends StatelessWidget {
  /// Creates a [DefaultDividerWidget].
  const DefaultDividerWidget({super.key, this.height = 40});

  /// The height of the divider space.
  final double height;

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: .5, height: height, color: Colors.grey.shade400);
  }
}
