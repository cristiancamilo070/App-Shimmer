import 'package:app_shimmer/src/models/app_shimmer_style_model.dart';
import 'package:app_shimmer/src/widgets/app_shimmer_list_tile.dart';
import 'package:flutter/material.dart';

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
    required this.itemCount,
    required this.titleStyle,
    this.heightFull,
    super.key,
    this.leadingStyle,
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
              return dividerWidget ?? const _DefaultDividerWidget(height: 1);
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

class _DefaultDividerWidget extends StatelessWidget {
  /// Creates a [_DefaultDividerWidget].
  const _DefaultDividerWidget({this.height = 40});

  /// The height of the divider space.
  final double height;

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: .5, height: height, color: Colors.grey.shade400);
  }
}
