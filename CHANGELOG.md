## 1.0.5

- **Added**: Cursor rule and `docs/SHIMMER_GENERATION.md` for generating shimmer from widgets (any editor / AI).
- **Added**: `tool/suggest_shimmer.dart` script to suggest app_shimmer snippets from Dart files.

## 1.0.4

- **Added**: `customGradient` parameter to all shimmer animation widgets for full control of shimmer direction, colors, and intensity.
- **Added**: New `AppShimmerCustomGradient` class for building custom `LinearGradient` configurations with flexible directions.
- **Improved**: Documentation examples updated to include gradient customization usage.
- **Improved**: Default shimmer behavior remains unchanged for backward compatibility.
- **Fixed**: Minor consistency updates in widget docs (`AppShimmerContainerExpanded`, `AppShimmerContainer`).

### Custom Gradient Support

You can now fully customize the shimmer animation by providing your own gradient configuration.

**Example:**

```dart
AppShimmerContainer(
  customGradient: AppShimmerCustomGradient(
    direction: ShimmerDirection.topToBottom,
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

## 1.0.3

* **Refactor**: Complete architecture restructure with modular organization
* **Improved**: Separated code into logical modules (animations, constants, models, widgets)
* **Added**: Comprehensive documentation for all export modules
* **Added**: `AppShimmerConstants` class with centralized default values
* **Improved**: Enhanced main library documentation with extensive examples
* **Improved**: Better code organization for maintainability and scalability
* **Fixed**: Export structure for better IDE auto-import support

### Architecture Changes

* **New structure**:
  - `src/animations/` - Animation components
  - `src/constants/` - Default values and configurations
  - `src/models/` - Data models and style definitions
  - `src/widgets/` - All shimmer widgets

* **New files**:
  - `app_shimmer_constants.dart` - Centralized constants
  - Individual export files with comprehensive documentation

## 1.0.2

* Fixed: Minor documentation improvements
* Updated: Example app with better demonstrations

## 1.0.1

* Fixed: Documentation improvements and screenshot added
* Updated: README.md with better examples and visual preview
* Improved: Repository URLs updated to match GitHub organization
* Added: Comprehensive dartdoc comments for all widgets

## 1.0.0

* **Initial release** 🎉
* Added `AppShimmerContainer` widget for single shimmer containers
* Added `AppShimmerContainerList` widget for horizontal/vertical shimmer lists
* Added `AppShimmerListTile` widget for ListTile shimmer effects
* Added `AppShimmerListTileListView` widget for ListView with shimmer tiles
* Added `AppShimmerGrid` widget for grid layout shimmer effects
* Added `SkeletonContainerExpanded` widget for expanded containers
* Customizable shimmer styles with `ShimmerContainerStyle`
* Support for circular and rectangular shapes
* Custom colors and border radius
* Flexible layouts (horizontal/vertical lists, grids)
* Smooth fade animations with configurable duration
* Comprehensive documentation and examples
* Full test coverage
```
