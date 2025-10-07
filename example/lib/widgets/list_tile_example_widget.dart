// ignore_for_file: deprecated_member_use

import 'package:app_shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';

class ListTileExampleWidget extends StatelessWidget {
  const ListTileExampleWidget({super.key, required this.showShimmer});

  final bool showShimmer;
  @override
  Widget build(BuildContext context) {
    return Column(children: _buildListTileTestSection(context));
  }

  /// Builds the ListTile test section
  List<Widget> _buildListTileTestSection(BuildContext context) {
    return [
      const SizedBox(height: 10),
      if (showShimmer) ...[
        ..._buildShimmerListTiles(context),
      ] else ...[
        ..._buildRealListTiles(context),
      ],
      const SizedBox(height: 10),
    ];
  }

  /// Builds shimmer ListTile widgets
  List<Widget> _buildShimmerListTiles(BuildContext context) {
    return [
      Text('ListTile without Container:',
          style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 12),
      const AppShimmerListTile(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        titleStyle: ShimmerContainerStyle(width: 150, height: 16),
        subtitleStyle: ShimmerContainerStyle(
          width: 100,
          height: 12,
          customColor: Color(0xff898AC4),
        ),
        leadingStyle: ShimmerContainerStyle(
          width: 40,
          height: 40,
          boxShape: BoxShape.circle,
          borderRadiusDouble: 10,
        ),
        trailingStyle: ShimmerContainerStyle(
          width: 40,
          height: 40,
          boxShape: BoxShape.rectangle,
          customColor: Color(0xff898AC4),
        ),
        contentSpacing: 16,
        verticalSpacing: 4,
        hasContainer: false,
      ),
      const SizedBox(height: 12),
      Text('ListTile with Container:',
          style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 12),
      const AppShimmerListTile(
        padding: EdgeInsets.zero,
        titleStyle: ShimmerContainerStyle(width: 150, height: 16),
        subtitleStyle: ShimmerContainerStyle(
          width: 100,
          height: 12,
          customColor: Color(0xff898AC4),
        ),
        leadingStyle: ShimmerContainerStyle(
          width: 40,
          height: 40,
          boxShape: BoxShape.circle,
        ),
        trailingStyle: ShimmerContainerStyle(
          width: 40,
          height: 40,
          boxShape: BoxShape.circle,
          customColor: Color(0xff898AC4),
        ),
        contentSpacing: 16,
        verticalSpacing: 4,
        hasContainer: true,
      ),
      const SizedBox(height: 4),
    ];
  }

  /// Builds real ListTile widgets
  List<Widget> _buildRealListTiles(BuildContext context) {
    return [
      Text('Without Container:', style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 12),
      ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        leading: const CircleAvatar(
          backgroundColor: Color(0xff898AC4),
          child: Text('A'),
        ),
        title: const Text('Real Title'),
        subtitle: const Text('Subtitle'),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 40,
            height: 40,
            color: const Color(0xff898AC4),
            alignment: Alignment.center,
            child: const Text('B', style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
      const SizedBox(height: 12),
      Text('With Container:', style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.5,
              blurRadius: 0.5,
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: const ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            backgroundColor: Color(0xff898AC4),
            child: Text('A'),
          ),
          title: Text('Real Title'),
          subtitle: Text('Subtitle'),
          trailing: CircleAvatar(
            backgroundColor: Color(0xff898AC4),
            child: Text('B'),
          ),
        ),
      ),
    ];
  }
}
