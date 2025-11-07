import 'package:app_shimmer_example/widgets/container_example_widget.dart';
import 'package:app_shimmer_example/widgets/grid_example_widget.dart';
import 'package:app_shimmer_example/widgets/list_tile_example_widget.dart';
import 'package:app_shimmer_example/widgets/list_view_example_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Test App Shimmer', home: const TestPage());
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool showShimmer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showShimmer = !showShimmer;
          });
        },
        backgroundColor: Color(0xffDE4242),
        child: Icon(Icons.remove_red_eye_outlined, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContainerExampleWidget(showShimmer: showShimmer),
                ListTileExampleWidget(showShimmer: showShimmer),
                ListViewExampleWidget(showShimmer: showShimmer),
                GridExampleWidget(showShimmer: showShimmer),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
