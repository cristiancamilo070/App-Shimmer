# App Shimmer Example

This is a demonstration app showcasing all the widgets available in the `app_shimmer` package.

## Features Demonstrated

This example app demonstrates:

- **AppShimmerContainer** - Basic shimmer containers with custom styles
- **AppShimmerListTile** - Shimmer versions of ListTile with various configurations
- **AppShimmerListTileListView** - Complete ListView with shimmer effects
- **AppShimmerContainerList** - Horizontal and vertical shimmer container lists
- **AppShimmerGrid** - Grid layouts with shimmer effects
- **Custom Colors** - Different color schemes for shimmer effects
- **Toggle Feature** - Switch between shimmer and real content

## Running the Example

1. Clone the repository
2. Navigate to the example directory:
   ```bash
   cd example
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## What to Explore

The example app includes:

- **Container Examples** - Various shimmer container configurations
- **ListTile Examples** - Different ListTile layouts (with/without containers)
- **ListView Examples** - Scrollable lists with shimmer effects
- **Grid Examples** - Grid layouts with customizable spacing
- **Twice Container Lists** - Complex layouts with multiple list sections

## Toggle Button

Use the toggle button in the app bar to switch between:
- **Shimmer State** - Shows the loading shimmer effects
- **Real Content** - Shows actual content to compare with shimmer

## Learning from the Code

Check out the widget examples in:
- `lib/widgets/container_example_widget.dart`
- `lib/widgets/list_tile_example_widget.dart`
- `lib/widgets/list_view_example_widget.dart`
- `lib/widgets/grid_example_widget.dart`
- `lib/widgets/twice_container_list_example_widget.dart`

Each file demonstrates best practices for using the corresponding shimmer widgets.

## Customization

Feel free to modify the examples to:
- Change colors using `customColor` in `ShimmerContainerStyle`
- Adjust sizes with `width` and `height` parameters
- Experiment with different `borderRadiusDouble` values
- Try different `boxShape` options (rectangle vs circle)
- Modify spacing with `contentSpacing` and `verticalSpacing`

## Support

For more information about the package, visit the [main repository](https://github.com/cristiancamilo070/App-Shimmer).
