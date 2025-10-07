// ignore_for_file: deprecated_member_use

import 'package:app_shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';

class ContainerExampleWidget extends StatelessWidget {
  const ContainerExampleWidget({super.key, required this.showShimmer});

  final bool showShimmer;
  @override
  Widget build(BuildContext context) {
    return Column(children: _buildContainerTestSection(context));
  }

  /// Builds the Container test section
  List<Widget> _buildContainerTestSection(BuildContext context) {
    return [
      Text('Container Test:', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 10),
      if (showShimmer) ...[
        const AppShimmerContainer(
          skeletonContainerStyle: ShimmerContainerStyle(width: 200, height: 50),
        ),
      ] else ...[
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xffBAABDA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(child: Text('Real Content')),
        ),
      ],
      const SizedBox(height: 20),
    ];
  }
}
