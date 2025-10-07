// lib/widgets/grid_example_widget.dart
// ignore_for_file: deprecated_member_use
import 'package:app_shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';

class GridExampleWidget extends StatelessWidget {
  const GridExampleWidget({super.key, required this.showShimmer});

  final bool showShimmer;

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildGridTestSection(context));
  }

  /// Builds the Grid test section
  List<Widget> _buildGridTestSection(BuildContext context) {
    return [
      Text('Grid:', style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 12),
      const SizedBox(height: 10),
      if (showShimmer) ...[
        ..._buildShimmerGrid(context),
      ] else ...[
        ..._buildRealGrid(context),
      ],
      const SizedBox(height: 20),
    ];
  }

  /// Builds shimmer Grid widgets
  List<Widget> _buildShimmerGrid(BuildContext context) {
    return [
      const SizedBox(height: 12),
      AppShimmerGrid(
        itemCount: 6,
        containerStyle: ShimmerContainerStyle(
          width: double.infinity,
          height: 90,
          borderRadiusDouble: 3,
          customColor: Color(0xff325288).withValues(alpha: 0.5),
        ),
        iconContainerStyle: ShimmerContainerStyle(
          width: 35,
          height: 35,
          boxShape: BoxShape.circle,
          customColor: Colors.white,
        ),
        child: Icon(
          Icons.info_outlined,
          size: 15,
          color: Color(0xff325288),
        ),
      ),
      const SizedBox(height: 12),
    ];
  }

  /// Builds real Grid widgets
  List<Widget> _buildRealGrid(BuildContext context) {
    return [
      GridView.builder(
        padding: const EdgeInsets.only(right: 16, left: 16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 0,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Image.network(
              'https://eskipaper.com/images/happy-dog-2.jpg',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    ];
  }
}
