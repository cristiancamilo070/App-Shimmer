/// Constants and default values for app_shimmer package.
///
/// This library exports [AppShimmerConstants] which contains all default
/// values, gradients, and styling constants used throughout the package.
///
/// ## Main Export
///
/// * [AppShimmerConstants] - Static constants for shimmer effects including:
///   - `shimmerGradient` - The default gradient for shimmer animation
///   - `defaultSpacing` - Default spacing between elements (10.0)
///   - `defaultBorderRadius` - Default border radius (8.0)
///   - `defaultShadow` - Default shadow configuration
///   - `defaultPadding` - Default container padding (16.0)
///
/// ## Usage
///
/// Access constants directly from the class:
///
/// ```dart
/// import 'package:app_shimmer/app_shimmer.dart';
///
/// // Use default gradient
/// final gradient = AppShimmerConstants.shimmerGradient;
///
/// // Use default spacing
/// const spacing = AppShimmerConstants.defaultSpacing;
///
/// // Use default border radius
/// const radius = AppShimmerConstants.defaultBorderRadius;
/// ```
///
/// These constants ensure visual consistency across all shimmer widgets
/// while allowing customization when needed.
library;

export 'app_shimmer_constants.dart';
