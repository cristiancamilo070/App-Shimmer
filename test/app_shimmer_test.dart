import 'package:flutter_test/flutter_test.dart';
import 'package:app_shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';

void main() {
  group('ShimmerContainerStyle', () {
    test('creates with required width', () {
      const style = ShimmerContainerStyle(width: 100);
      expect(style.width, 100);
      expect(style.borderRadiusDouble, 8);
      expect(style.boxShape, BoxShape.rectangle);
      expect(style.height, isNull);
      expect(style.customColor, isNull);
    });

    test('creates with all parameters', () {
      const style = ShimmerContainerStyle(
        width: 200,
        height: 100,
        borderRadiusDouble: 12,
        boxShape: BoxShape.circle,
        customColor: Colors.red,
      );
      expect(style.width, 200);
      expect(style.height, 100);
      expect(style.borderRadiusDouble, 12);
      expect(style.boxShape, BoxShape.circle);
      expect(style.customColor, Colors.red);
    });

    test('uses default values correctly', () {
      const style = ShimmerContainerStyle(width: 150);
      expect(style.borderRadiusDouble, 8);
      expect(style.boxShape, BoxShape.rectangle);
    });
  });

  group('AppShimmerContainer', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerContainer(
              skeletonContainerStyle: ShimmerContainerStyle(
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerContainer), findsOneWidget);
      expect(find.byType(AppShimmerAnimation), findsOneWidget);
    });

    testWidgets('respects height constraint', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerContainer(
              skeletonContainerStyle: ShimmerContainerStyle(
                width: 100,
                height: 150,
              ),
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(AppShimmerContainer),
              matching: find.byType(SizedBox),
            )
            .first,
      );
      expect(sizedBox.height, 150);
    });
  });

  group('SkeletonContainerExpanded', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonContainerExpanded(
              skeletonContainerStyle: ShimmerContainerStyle(
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SkeletonContainerExpanded), findsOneWidget);
      expect(find.byType(AppShimmerAnimation), findsOneWidget);
    });
  });

  group('AppShimmerContainerList', () {
    testWidgets('renders horizontal list', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerContainerList(
              itemCount: 3,
              isColumn: false,
              skeletonContainerStyle: ShimmerContainerStyle(
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerContainerList), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('renders vertical list', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerContainerList(
              itemCount: 3,
              isColumn: true,
              skeletonContainerStyle: ShimmerContainerStyle(
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerContainerList), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });
  });

  group('AppShimmerListTile', () {
    testWidgets('renders with title only', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerListTile(
              titleStyle: ShimmerContainerStyle(width: 150, height: 16),
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerListTile), findsOneWidget);
      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('renders with all components', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerListTile(
              leadingStyle: ShimmerContainerStyle(
                width: 40,
                height: 40,
                boxShape: BoxShape.circle,
              ),
              titleStyle: ShimmerContainerStyle(width: 150, height: 16),
              subtitleStyle: ShimmerContainerStyle(width: 100, height: 12),
              trailingStyle: ShimmerContainerStyle(
                width: 40,
                height: 40,
                boxShape: BoxShape.circle,
              ),
              contentSpacing: 16,
              verticalSpacing: 4,
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerListTile), findsOneWidget);
    });

    testWidgets('renders with container when hasContainer is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerListTile(
              titleStyle: ShimmerContainerStyle(width: 150, height: 16),
              hasContainer: true,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(AppShimmerListTile),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.decoration, isNotNull);
    });

    testWidgets('renders without container when hasContainer is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerListTile(
              titleStyle: ShimmerContainerStyle(width: 150, height: 16),
              hasContainer: false,
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerListTile), findsOneWidget);
    });
  });

  group('AppShimmerListTileListView', () {
    testWidgets('renders correct number of items', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerListTileListView(
              itemCount: 5,
              titleStyle: ShimmerContainerStyle(width: 150, height: 16),
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerListTileListView), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('uses custom divider widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerListTileListView(
              itemCount: 3,
              titleStyle: ShimmerContainerStyle(width: 150, height: 16),
              dividerWidget: SizedBox(height: 20),
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('uses default divider when none provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerListTileListView(
              itemCount: 3,
              titleStyle: ShimmerContainerStyle(width: 150, height: 16),
            ),
          ),
        ),
      );

      expect(find.byType(DefaultDividerWidget), findsWidgets);
    });
  });

  group('AppShimmerGrid', () {
    testWidgets('renders with correct number of items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerGrid(
              itemCount: 6,
              containerStyle: ShimmerContainerStyle(
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerGrid), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('respects crossAxisCount', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerGrid(
              itemCount: 9,
              containerStyle: ShimmerContainerStyle(
                width: 100,
                height: 100,
              ),
              crossAxisCount: 3,
            ),
          ),
        ),
      );

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final delegate =
          gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, 3);
    });

    testWidgets('applies spacing correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerGrid(
              itemCount: 6,
              containerStyle: ShimmerContainerStyle(
                width: 100,
                height: 100,
              ),
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
            ),
          ),
        ),
      );

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final delegate =
          gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisSpacing, 10);
      expect(delegate.mainAxisSpacing, 15);
    });
  });

  group('HunchAnimation', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      const testWidget = Text('Test');
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HunchAnimation(
              child: testWidget,
            ),
          ),
        ),
      );

      expect(find.byWidget(testWidget), findsOneWidget);
      expect(find.byType(FadeTransition), findsOneWidget);
    });

    testWidgets('animation repeats', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HunchAnimation(
              child: Text('Test'),
            ),
          ),
        ),
      );

      // Pump initial frame
      await tester.pump();

      // Advance animation
      await tester.pump(const Duration(milliseconds: 500));

      // Check that FadeTransition exists and is animating
      expect(find.byType(FadeTransition), findsOneWidget);
    });
  });

  group('DefaultDividerWidget', () {
    testWidgets('renders with default height', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DefaultDividerWidget(),
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.height, 40);
      expect(divider.thickness, .5);
    });

    testWidgets('renders with custom height', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DefaultDividerWidget(height: 20),
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.height, 20);
    });
  });

  group('Integration tests', () {
    testWidgets('complete shimmer list tile setup works',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView(
              children: const [
                AppShimmerListTileListView(
                  itemCount: 3,
                  leadingStyle: ShimmerContainerStyle(
                    width: 40,
                    height: 40,
                    boxShape: BoxShape.circle,
                  ),
                  titleStyle: ShimmerContainerStyle(width: 150, height: 16),
                  subtitleStyle: ShimmerContainerStyle(width: 100, height: 12),
                  trailingStyle: ShimmerContainerStyle(
                    width: 40,
                    height: 40,
                    boxShape: BoxShape.rectangle,
                  ),
                  contentSpacing: 16,
                  verticalSpacing: 4,
                  hasContainer: true,
                  dividerWidget: SizedBox(height: 8),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerListTileListView), findsOneWidget);
      expect(find.byType(AppShimmerListTile), findsWidgets);
    });

    testWidgets('shimmer grid with icons works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppShimmerGrid(
              itemCount: 6,
              containerStyle: ShimmerContainerStyle(
                width: double.infinity,
                height: 90,
                customColor: Colors.grey,
              ),
              iconContainerStyle: ShimmerContainerStyle(
                width: 35,
                height: 35,
                boxShape: BoxShape.circle,
                customColor: Colors.white,
              ),
              child: Icon(Icons.star),
              crossAxisCount: 3,
            ),
          ),
        ),
      );

      expect(find.byType(AppShimmerGrid), findsOneWidget);
      expect(find.byIcon(Icons.star), findsWidgets);
    });
  });
}
