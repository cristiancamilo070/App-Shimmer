import 'package:flutter/material.dart';

/// A widget that provides a smooth fade in/out animation effect.
///
/// This widget wraps its child with a [FadeTransition] that continuously
/// animates between 30% and 100% opacity, creating a pulsing effect
/// commonly used in shimmer loading animations.
///
/// The animation repeats indefinitely with a duration of 1000 milliseconds
/// and automatically reverses direction.
///
/// ## Example
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
/// See also:
///
///  * [FadeTransition], which is used to animate the opacity.
///  * [AnimationController], which controls the animation.
class HunchAnimation extends StatefulWidget {
  /// Creates a [HunchAnimation] widget.
  ///
  /// The [child] parameter must not be null.
  const HunchAnimation({required this.child, super.key});

  /// The widget below this widget in the tree.
  ///
  /// This widget will be animated with a fade transition effect.
  final Widget child;

  @override
  State<HunchAnimation> createState() => _HunchAnimationState();
}

class _HunchAnimationState extends State<HunchAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      lowerBound: 0.3,
      upperBound: 1.0,
      animationBehavior: AnimationBehavior.normal,
    );
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: widget.child,
    );
  }
}
