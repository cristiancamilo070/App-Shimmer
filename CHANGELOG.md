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
