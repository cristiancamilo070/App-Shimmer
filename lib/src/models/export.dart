/// Data models for app_shimmer package.
///
/// This library exports the [ShimmerContainerStyle] model which is used
/// to configure the appearance of all shimmer widgets in the package.
///
/// ## Main Export
///
/// * [ShimmerContainerStyle] - Defines visual properties for shimmer containers:
///   - `width` (required) - Container width
///   - `height` (optional) - Container height
///   - `borderRadiusDouble` - Border radius (default: 8.0)
///   - `boxShape` - Shape: rectangle or circle (default: rectangle)
///   - `customColor` - Custom base color (default: grey)
///
/// ## Usage
///
/// Create style configurations for shimmer widgets:
///
/// ```dart
/// import 'package:app_shimmer/app_shimmer.dart';
///
/// // Rectangle with custom color
/// const style = ShimmerContainerStyle(
///   width: 200,
///   height: 100,
///   borderRadiusDouble: 12,
///   customColor: Color(0xFF898AC4),
/// );
///
/// // Circle avatar style
/// const avatarStyle = ShimmerContainerStyle(
///   width: 40,
///   height: 40,
///   boxShape: BoxShape.circle,
/// );
/// ```
///
/// This style is used by all shimmer widgets:
/// * [AppShimmerContainer]
/// * [AppShimmerListTile]
/// * [AppShimmerGrid]
/// * [AppShimmerContainerList]
///
/// See also:
///
/// * [AppShimmerConstants] - Default values for style properties
library;

export 'app_shimmer_style_model.dart';
