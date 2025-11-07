import 'package:app_shimmer/app_shimmer.dart';
import 'package:app_shimmer/src/widgets/container_builder.dart';
import 'package:flutter/material.dart';

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
    required this.titleStyle,
    super.key,
    this.leadingStyle,
    this.subtitleStyle,
    this.padding,
    this.contentSpacing,
    this.verticalSpacing,
    this.paragraphStyle,
    this.trailingStyle,
    this.hasContainer,
    this.customGradient,
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

  /// Optional custom gradient configuration for the shimmer animation.
  ///
  /// If null, [AppShimmerConstants.shimmerGradient] is used.
  final AppShimmerCustomGradient? customGradient;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      customGradient: customGradient,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          decoration: hasContainer == true
              ? BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: AppShimmerConstants.defaultShadow,
                )
              : null,
          padding: hasContainer == true
              ? const EdgeInsets.all(AppShimmerConstants.defaultPadding)
              : null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingStyle?.width != null)
                AppShimmerContainerBuilder(
                    skeletonContainerStyle: leadingStyle!),
              SizedBox(width: contentSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppShimmerContainerBuilder(
                        skeletonContainerStyle: titleStyle),
                    if (subtitleStyle?.width != null) ...[
                      SizedBox(height: verticalSpacing),
                      AppShimmerContainerBuilder(
                          skeletonContainerStyle: subtitleStyle!),
                    ],
                    if (paragraphStyle?.width != null) ...[
                      SizedBox(height: verticalSpacing),
                      AppShimmerContainerBuilder(
                        skeletonContainerStyle: paragraphStyle!,
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: contentSpacing),
              if (trailingStyle?.width != null)
                AppShimmerContainerBuilder(
                    skeletonContainerStyle: trailingStyle!),
            ],
          ),
        ),
      ),
    );
  }
}
