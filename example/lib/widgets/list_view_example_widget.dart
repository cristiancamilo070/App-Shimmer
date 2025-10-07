// ignore_for_file: deprecated_member_use

import 'package:app_shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';

class ListViewExampleWidget extends StatelessWidget {
  const ListViewExampleWidget({super.key, required this.showShimmer});

  final bool showShimmer;
  @override
  Widget build(BuildContext context) {
    return Column(children: _buildListViewTestSection(context));
  }

  /// Builds the ListView test section
  List<Widget> _buildListViewTestSection(BuildContext context) {
    return [
      const SizedBox(height: 10),
      if (showShimmer) ...[
        ..._buildShimmerListView(context),
      ] else ...[
        ..._buildRealListView(context),
      ],
      const SizedBox(height: 20),
    ];
  }

  /// Builds shimmer ListView widgets
  List<Widget> _buildShimmerListView(BuildContext context) {
    return [
      Text('ListView without Container:',
          style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 12),
      const AppShimmerListTileListView(
        itemCount: 2,
        contentSpacing: 16,
        hasContainer: false,
        verticalSpacing: 4,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        dividerWidget: SizedBox(height: 8),
        titleStyle: ShimmerContainerStyle(width: 200, height: 16),
        subtitleStyle: ShimmerContainerStyle(
          width: 150,
          height: 12,
          customColor: Color(0xffC0C9EE),
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
          customColor: Color(0xffC0C9EE),
        ),
      ),
      const SizedBox(height: 8),
      Text('ListView with Container:',
          style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 12),
      const AppShimmerListTileListView(
        itemCount: 2,
        contentSpacing: 16,
        hasContainer: true,
        verticalSpacing: 4,
        padding: EdgeInsets.zero,
        dividerWidget: SizedBox(height: 8),
        titleStyle: ShimmerContainerStyle(width: 200, height: 16),
        subtitleStyle: ShimmerContainerStyle(
          width: 150,
          height: 12,
          customColor: Color(0xffEBD6FB),
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
          customColor: Color(0xffEBD6FB),
        ),
      ),
    ];
  }

  /// Builds real ListView widgets
  List<Widget> _buildRealListView(BuildContext context) {
    return [
      Text('Without Container:', style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 12),
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 4),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            leading: CircleAvatar(
              backgroundColor: const Color(0xffC0C9EE),
              child: Text('${index + 1}'),
            ),
            title: Text('Real Title ${index + 1}'),
            subtitle: Text('Subtitle ${index + 1}'),
            trailing: CircleAvatar(
              backgroundColor: const Color(0xffC0C9EE),
              child: Text(String.fromCharCode(65 + index)),
            ),
          );
        },
      ),
      Text('With Container:', style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 12),
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 4),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0,
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0xffEBD6FB),
                child: Text('${index + 1}'),
              ),
              title: Text('Real Title ${index + 1}'),
              subtitle: Text('Subtitle ${index + 1}'),
              trailing: CircleAvatar(
                backgroundColor: const Color(0xffEBD6FB),
                child: Text(String.fromCharCode(65 + index)),
              ),
            ),
          );
        },
      ),
    ];
  }
}
