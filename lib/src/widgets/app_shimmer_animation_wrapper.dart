import 'package:app_shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

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
  const AppShimmerAnimation({required this.child, super.key});

  /// The widget to be animated with shimmer effect.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HunchAnimation(
      child: SkeletonTheme(
        themeMode: ThemeMode.system,
        shimmerGradient: AppShimmerConstants.shimmerGradient,
        child: SkeletonItem(child: child),
      ),
    );
  }
}
