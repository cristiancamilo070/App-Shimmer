/// Widget components for app_shimmer package.
///
/// This library exports all the shimmer widgets available in the package.
/// Each widget provides a pre-built shimmer loading effect for common UI patterns.
///
/// ## Main Exports
///
/// ### Core Widgets
///
/// * [AppShimmerAnimation] - Base wrapper that applies shimmer effect to any widget
/// * [AppShimmerContainer] - Single shimmer container with customizable style
/// * [AppShimmerContainerExpanded] - Shimmer container that expands to fill space
///
/// ### List & Tile Widgets
///
/// * [AppShimmerListTile] - Shimmer version of Flutter's ListTile
/// * [AppShimmerListTileListView] - ListView containing multiple shimmer list tiles
/// * [AppShimmerContainerList] - Horizontal or vertical list of shimmer containers
///
/// ### Grid Widget
///
/// * [AppShimmerGrid] - Grid layout with shimmer effects
///
/// ## Quick Examples
///
/// ### Basic Container
///
/// ```dart
/// AppShimmerContainer(
///   skeletonContainerStyle: ShimmerContainerStyle(
///     width: 200,
///     height: 100,
///   ),
/// )
/// ```
///
/// ### ListTile with Shimmer
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
/// )
/// ```
///
/// ### Grid Layout
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
/// ### Container List
///
/// ```dart
/// AppShimmerContainerList(
///   itemCount: 5,
///   isColumn: false, // Horizontal scroll
///   skeletonContainerStyle: ShimmerContainerStyle(
///     width: 100,
///     height: 100,
///   ),
/// )
/// ```
///
/// ## Widget Categories
///
/// ### Single Elements
/// Use [AppShimmerContainer] for individual shimmer placeholders.
///
/// ### Lists
/// Use [AppShimmerListTile] and [AppShimmerListTileListView] for
/// list-based loading states.
///
/// ### Grids
/// Use [AppShimmerGrid] for grid-based content like image galleries.
///
/// ### Custom Layouts
/// Use [AppShimmerContainerList] for custom horizontal or vertical
/// shimmer layouts.
///
/// ## Styling
///
/// All widgets accept [ShimmerContainerStyle] for customization:
/// - Width and height
/// - Border radius
/// - Box shape (rectangle or circle)
/// - Custom colors
///
/// See also:
///
/// * [ShimmerContainerStyle] - Style configuration model
/// * [AppShimmerConstants] - Default values and constants
/// * [HunchAnimation] - Underlying animation
library app_shimmer_widgets;

export 'app_shimmer_animation_wrapper.dart';
export 'app_shimmer_container.dart';
export 'app_shimmer_container_expanded.dart';
export 'app_shimmer_grid.dart';
export 'app_shimmer_list_tile.dart';
export 'app_shimmer_list_tile_list_view.dart';
export 'app_shimmer_container_list_view.dart';
