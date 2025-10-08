/// Animation components for app_shimmer package.
///
/// This library exports the core animation widget used throughout
/// the shimmer package to create smooth loading effects.
///
/// ## Main Export
///
/// * [HunchAnimation] - A fade in/out animation that continuously pulses
///   between 30% and 100% opacity, creating the signature shimmer effect.
///
/// ## Usage
///
/// This animation is typically used internally by shimmer widgets,
/// but can also be used directly:
///
/// ```dart
/// HunchAnimation(
///   child: Container(
///     width: 100,
///     height: 100,
///     color: Colors.grey,
///   ),
/// )
/// ```
///
/// The animation:
/// - Runs indefinitely
/// - Reverses automatically
/// - Takes 1000ms per cycle
/// - Animates opacity from 0.3 to 1.0
///
/// See also:
///
/// * [AppShimmerAnimation] - Wraps content with shimmer theme and animation
library;

export 'app_shimmer_hunch_animation.dart';
