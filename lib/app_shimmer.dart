/// App Shimmer - A comprehensive Flutter shimmer loading library
///
/// This library provides customizable shimmer loading effects for Flutter
/// applications. It includes pre-built widgets for common UI patterns such as
/// ListTiles, ListViews, Grids, and custom containers.
///
/// ## Features
///
/// * ✨ Pre-built shimmer widgets for common layouts
/// * 🎨 Highly customizable through [ShimmerContainerStyle]
/// * 📦 Lightweight with minimal dependencies
/// * 🚀 Easy integration with simple API
/// * 🎯 Type-safe with comprehensive documentation
/// * ⚡ Smooth animations with configurable duration
///
/// ## Quick Start
///
/// ### Installation
///
/// Add to your `pubspec.yaml`:
///
/// ```yaml
/// dependencies:
///   app_shimmer: ^1.0.0
/// ```
///
/// ### Basic Usage
///
/// ```dart
/// import 'package:app_shimmer/app_shimmer.dart';
///
/// // Simple container shimmer
/// AppShimmerContainer(
///   skeletonContainerStyle: ShimmerContainerStyle(
///     width: 200,
///     height: 100,
///     borderRadiusDouble: 12,
///   ),
/// )
/// ```
///
/// ### ListTile Shimmer
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
///   hasContainer: true,
/// )
/// ```
///
/// ### Grid Shimmer
///
/// ```dart
/// AppShimmerGrid(
///   itemCount: 6,
///   containerStyle: ShimmerContainerStyle(
///     width: double.infinity,
///     height: 90,
///   ),
///   crossAxisCount: 3,
/// )
/// ```
///
/// ## Available Widgets
///
/// ### Core Widgets
/// * [AppShimmerContainer] - Single shimmer container
/// * [AppShimmerContainerExpanded] - Expanded shimmer container
/// * [AppShimmerAnimation] - Animation wrapper for any widget
///
/// ### List Widgets
/// * [AppShimmerListTile] - Shimmer ListTile
/// * [AppShimmerListTileListView] - ListView of shimmer tiles
/// * [AppShimmerContainerList] - Horizontal/vertical shimmer list
///
/// ### Grid Widget
/// * [AppShimmerGrid] - Grid layout with shimmer
///
/// ## Styling
///
/// Customize appearance using [ShimmerContainerStyle]:
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
///
/// ### Circle Avatar Style
///
/// ```dart
/// ShimmerContainerStyle(
///   width: 40,
///   height: 40,
///   boxShape: BoxShape.circle,
/// )
/// ```
///
/// ## Advanced Usage
///
/// ### Custom Animation Wrapper
///
/// ```dart
/// AppShimmerAnimation(
///   child: YourCustomWidget(),
/// )
/// ```
///
/// ### Container List (Horizontal)
///
/// ```dart
/// AppShimmerContainerList(
///   itemCount: 5,
///   isColumn: false,
///   skeletonContainerStyle: ShimmerContainerStyle(
///     width: 100,
///     height: 100,
///   ),
/// )
/// ```
///
/// ## Constants
///
/// Access default values via [AppShimmerConstants]:
/// * `shimmerGradient` - Default shimmer gradient
/// * `defaultSpacing` - Default spacing (10.0)
/// * `defaultBorderRadius` - Default border radius (8.0)
/// * `defaultPadding` - Default padding (16.0)
///
/// ## Examples
///
/// For complete examples, check the `/example` folder in the repository:
/// https://github.com/cristiancamolo070/app_shimmer/tree/main/example
///
/// ## Support
///
/// * 📚 Documentation: https://pub.dev/packages/app_shimmer
/// * 🐛 Issues: https://github.com/cristiancamolo070/app_shimmer/issues
/// * ⭐ GitHub: https://github.com/cristiancamolo070/app_shimmer
library;

export 'src/animations/export.dart';
export 'src/constants/export.dart';
export 'src/models/export.dart';
export 'src/widgets/export.dart';
