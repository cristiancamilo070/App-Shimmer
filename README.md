# App Shimmer

[![pub package](https://img.shields.io/pub/v/app_shimmer.svg)](https://pub.dev/packages/app_shimmer)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter Gems](https://img.shields.io/badge/Flutter%20Gems-Listed-blue?logo=flutter)](https://fluttergems.dev/packages/app_shimmer/)

A customizable and easy-to-use Flutter package for creating beautiful shimmer loading effects.  
Perfect for showing loading states in your app with pre-built widgets for ListTiles, ListViews, Grids, and custom containers.

> 🔥 **New in v1.0.4** — Full support for customizable shimmer gradients with directions and color control.  
> 💎 **Now featured on [Flutter Gems](https://fluttergems.dev/packages/app_shimmer/)** — discover and integrate with confidence.

---

## Features

✨ **Pre-built Shimmer Widgets**: Ready-to-use shimmer effects for common UI patterns  
🎨 **Highly Customizable**: Full control over colors, sizes, shapes, and now **gradient animations**  
📦 **Lightweight**: Minimal dependencies and optimized performance  
🚀 **Easy Integration**: Simple API that works out of the box  
🎯 **Type Safe**: Built with Flutter's latest best practices

---

## Widgets Included

- `AppShimmerContainer` — Single shimmer container
- `AppShimmerContainerList` — Horizontal or vertical list of shimmer containers
- `AppShimmerListTile` — Shimmer effect for ListTile layouts
- `AppShimmerListTileListView` — ListView of shimmer ListTiles
- `AppShimmerGrid` — Grid layout shimmer effect
- `AppShimmerContainerExpanded` — Expanded shimmer container

---

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  app_shimmer: ^1.0.4
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Container

```dart
import 'package:app_shimmer/app_shimmer.dart';

AppShimmerContainer(
  skeletonContainerStyle: ShimmerContainerStyle(
    width: 200,
    height: 100,
    borderRadiusDouble: 12,
  ),
)
```

### ListTile with Shimmer

```dart
AppShimmerListTile(
  padding: EdgeInsets.all(16),
  leadingStyle: ShimmerContainerStyle(
    width: 40,
    height: 40,
    boxShape: BoxShape.circle,
  ),
  titleStyle: ShimmerContainerStyle(
    width: 150,
    height: 16,
  ),
  subtitleStyle: ShimmerContainerStyle(
    width: 100,
    height: 12,
  ),
  trailingStyle: ShimmerContainerStyle(
    width: 40,
    height: 40,
    boxShape: BoxShape.circle,
  ),
  contentSpacing: 16,
  verticalSpacing: 4,
  hasContainer: true,
)
```

### ListView with Shimmer

```dart
AppShimmerListTileListView(
  itemCount: 5,
  hasContainer: true,
  titleStyle: ShimmerContainerStyle(
    width: 200,
    height: 16,
  ),
  subtitleStyle: ShimmerContainerStyle(
    width: 150,
    height: 12,
  ),
  leadingStyle: ShimmerContainerStyle(
    width: 40,
    height: 40,
    boxShape: BoxShape.circle,
  ),
  dividerWidget: SizedBox(height: 8),
)
```

### Grid with Shimmer

```dart
AppShimmerGrid(
  itemCount: 6,
  containerStyle: ShimmerContainerStyle(
    width: double.infinity,
    height: 90,
    borderRadiusDouble: 8,
    customColor: Colors.grey.shade300,
  ),
  iconContainerStyle: ShimmerContainerStyle(
    width: 35,
    height: 35,
    boxShape: BoxShape.circle,
  ),
  crossAxisCount: 3,
  crossAxisSpacing: 8,
  mainAxisSpacing: 8,
)
```

### Custom Colors

```dart
ShimmerContainerStyle(
  width: 200,
  height: 100,
  customColor: Color(0xFF898AC4), // Your custom color
  borderRadiusDouble: 12,
)
```

## ✨ Custom Gradients (v1.0.4+)

App Shimmer now supports **fully customizable shimmer gradients** through the new `AppShimmerCustomGradient` class.  
You can control the **direction**, **colors**, **stops**, and **tile mode** of the animation for unique lighting effects.

### Example

````dart
AppShimmerContainer(
  customGradient: AppShimmerCustomGradient(
    direction: ShimmerDirection.diagonalTopLeftToBottomRight,
    colors: const [
      Color(0x00FFFFFF),
      Color(0x33FFFFFF),
      Color(0x99FFFFFF),
      Color(0x33FFFFFF),
      Color(0x00FFFFFF),
    ],
    stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
  ),
  skeletonContainerStyle: const ShimmerContainerStyle(
    width: 200,
    height: 100,
    borderRadiusDouble: 8,
  ),
)

### Container List (Horizontal)

```dart
AppShimmerContainerList(
  itemCount: 5,
  isColumn: false, // Horizontal
  skeletonContainerStyle: ShimmerContainerStyle(
    width: 100,
    height: 100,
    borderRadiusDouble: 12,
  ),
)
````

## ShimmerContainerStyle Properties

| Property             | Type       | Default            | Description                                  |
| -------------------- | ---------- | ------------------ | -------------------------------------------- |
| `width`              | `double`   | required           | Width of the shimmer container               |
| `height`             | `double?`  | null               | Height of the shimmer container              |
| `borderRadiusDouble` | `double`   | 8                  | Border radius for rectangle shapes           |
| `boxShape`           | `BoxShape` | BoxShape.rectangle | Shape of the container (rectangle or circle) |
| `customColor`        | `Color?`   | null               | Custom color for the shimmer base            |

## Example

Check out the [example](example) folder for a complete working example with different shimmer patterns and use cases.

## Screenshots

<div align="center">
  <img src="https://github.com/cristiancamilo070/App-Shimmer/blob/main/example/assets/screenshots/screenshot_app_shimmer.png?raw=true" alt="App Shimmer Example" width="300"/>
</div>

_Shimmer loading effects for ListTiles, ListViews, and Grids_

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Authors

Created by **Cristian Cruz**

## Support

If you find this package useful, please give it a ⭐ on [GitHub](https://github.com/cristiancamilo070/App-Shimmer)!

For issues, feature requests, or questions, please visit our [issue tracker](https://github.com/cristiancamilo070/App-Shimmer/issues).
