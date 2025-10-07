// ignore_for_file: deprecated_member_use

import 'hunch_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

/// The SkeletonContainerStyle class defines the style properties for a skeleton container, including
/// width, height, border radius, and box shape.
class ShimmerContainerStyle {
  final double width;
  final double? height;
  final double borderRadiusDouble;
  final BoxShape boxShape;
  final Color? customColor;

  const ShimmerContainerStyle({
    required this.width,
    this.height,
    this.borderRadiusDouble = 8,
    this.boxShape = BoxShape.rectangle,
    this.customColor,
  });
}

/// [shimmerGradient] is the editable linearGradient for [AppShimmerAnimation]
const shimmerGradient = LinearGradient(
  colors: [
    Color.fromARGB(0, 255, 255, 255),
    Color.fromARGB(40, 255, 255, 255),
    Color.fromARGB(82, 255, 255, 255),
    Color.fromARGB(40, 255, 255, 255),
    Color.fromARGB(0, 255, 255, 255),
  ],
  stops: [0.0, 0.3, 0.5, 0.7, 1],
  begin: Alignment.centerLeft, //topLeft,
  end: Alignment.centerRight, //bottomRight,
  tileMode: TileMode.decal,
);

/// The basic Skeleton Animation for any kind of widget
/// It takes a child widget and creates a skeleton animation effect.
class AppShimmerAnimation extends StatelessWidget {
  const AppShimmerAnimation({super.key, required this.child});
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

/// This is a Flutter widget class that displays a skeleton container with a specified style.
class AppShimmerContainer extends StatelessWidget {
  const AppShimmerContainer({super.key, required this.skeletonContainerStyle});

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

class SkeletonContainerExpanded extends StatelessWidget {
  const SkeletonContainerExpanded({
    super.key,
    required this.skeletonContainerStyle,
  });

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

/// The `AppShimmerContainerList` class is a stateless widget that displays a list of skeleton
/// containers either horizontally or vertically based on the `isColumn` parameter.
class AppShimmerContainerList extends StatelessWidget {
  const AppShimmerContainerList({
    super.key,
    required this.itemCount,
    required this.isColumn,
    required this.skeletonContainerStyle,
  });

  final ShimmerContainerStyle skeletonContainerStyle;
  final int itemCount;
  final bool isColumn;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      child:
          (!isColumn)
              ? SizedBox(
                height: skeletonContainerStyle.height ?? 0 + 20,
                width:
                    skeletonContainerStyle.width * (itemCount) +
                    (itemCount) * 10,
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

///  [AppShimmerListTile] class is a stateful widget that defines the style and layout of a skeleton
/// container for a title and subtitle.
class AppShimmerListTile extends StatelessWidget {
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

  final ShimmerContainerStyle? leadingStyle;
  final ShimmerContainerStyle titleStyle;
  final ShimmerContainerStyle? subtitleStyle;
  final ShimmerContainerStyle? paragraphStyle;
  final ShimmerContainerStyle? trailingStyle;
  final EdgeInsetsGeometry? padding;
  final double? contentSpacing;
  final double? verticalSpacing;
  final bool? hasContainer;

  @override
  Widget build(BuildContext context) {
    return AppShimmerAnimation(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          decoration:
              hasContainer == true
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

/// [AppShimmerListTileListView] is a stateful widget class that creates a skeleton title list with customizable styles and
/// properties.
class AppShimmerListTileListView extends StatelessWidget {
  const AppShimmerListTileListView({
    this.heightFull,
    super.key,
    required this.itemCount,
    //required this.scrollPhysics,
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
  final double? heightFull;
  final int itemCount;
  //final ScrollPhysics scrollPhysics;
  final ShimmerContainerStyle titleStyle;
  final ShimmerContainerStyle? leadingStyle;
  final ShimmerContainerStyle? subtitleStyle;
  final ShimmerContainerStyle? paragraphStyle;
  final ShimmerContainerStyle? trailingStyle;
  final EdgeInsetsGeometry? padding;
  final double? contentSpacing;
  final double? verticalSpacing;
  final bool? hasContainer;
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

class AppShimmerGrid extends StatelessWidget {
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

  final int itemCount;
  final ShimmerContainerStyle containerStyle;
  final ShimmerContainerStyle? iconContainerStyle;
  final Widget? child;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
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
                borderRadius:
                    iconContainerStyle.boxShape == BoxShape.rectangle
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

/// This widget works to simutate a container and a circle avatar
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
    ],
  );
}

/// This widget works to simutate a container and a circle avatar
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

class DefaultDividerWidget extends StatelessWidget {
  final double height;

  const DefaultDividerWidget({super.key, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: .5, height: height, color: Colors.grey.shade400);
  }
}
