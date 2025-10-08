import 'package:flutter/material.dart';

class AppShimmerConstants {
  /// The gradient used for the shimmer animation effect.
  ///
  /// This gradient creates a light sweep effect across the shimmer containers.
  static const shimmerGradient = LinearGradient(
    colors: [
      Color.fromARGB(0, 255, 255, 255),
      Color.fromARGB(40, 255, 255, 255),
      Color.fromARGB(82, 255, 255, 255),
      Color.fromARGB(40, 255, 255, 255),
      Color.fromARGB(0, 255, 255, 255),
    ],
    stops: [0.0, 0.3, 0.5, 0.7, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    tileMode: TileMode.decal,
  );

  /// Default spacing between shimmer elements.
  ///
  /// @returns: Default spacing value [double].
  static const double defaultSpacing = 10.0;

  /// Default border radius for shimmer containers.
  ///
  /// @returns: Default border radius value [double].
  static const double defaultBorderRadius = 8.0;

  /// Default shadow configuration for shimmer containers.
  ///
  /// @returns: List of box shadows [List<BoxShadow>].
  static List<BoxShadow> get defaultShadow => [
        BoxShadow(
          spreadRadius: 0.5,
          blurRadius: 0.5,
          color: Colors.grey.withValues(alpha: .5),
        ),
      ];

  /// Default container padding for shimmer elements.
  ///
  /// @returns: Default padding configuration [EdgeInsets].
  static const double defaultPadding = 16.0;
}
