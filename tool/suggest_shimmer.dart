#!/usr/bin/env dart
// ignore_for_file: avoid_print
//
// Script que analiza un archivo Dart en busca de widgets Flutter comunes
// y sugiere el código app_shimmer equivalente.
//
// Uso: dart run tool/suggest_shimmer.dart <ruta_al_archivo.dart>
// Ejemplo: dart run tool/suggest_shimmer.dart example/lib/widgets/list_tile_example_widget.dart

import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Uso: dart run tool/suggest_shimmer.dart <archivo.dart>');
    print('Ejemplo: dart run tool/suggest_shimmer.dart example/lib/main.dart');
    exit(1);
  }

  final path = args.first;
  final file = File(path);
  if (!file.existsSync()) {
    print('Archivo no encontrado: $path');
    exit(1);
  }

  final content = file.readAsStringSync();
  final suggestions = <String>[];

  // ListView (con ListTile o itemBuilder que devuelve listas)
  if (_hasListView(content)) {
    if (_hasListTile(content)) {
      suggestions.add(_snippetListTileListView());
    } else {
      suggestions.add(_snippetContainerList());
    }
  }

  // ListTile aislado (sin ListView)
  if (_hasListTile(content) && !_hasListView(content)) {
    suggestions.add(_snippetListTile());
  }

  // GridView
  if (_hasGridView(content)) {
    suggestions.add(_snippetGrid());
  }

  // Container con dimensiones
  if (_hasSizedContainer(content)) {
    suggestions.add(_snippetContainer());
  }

  if (suggestions.isEmpty) {
    print('No se detectaron patrones típicos (ListView, ListTile, GridView, Container con size).');
    print('Puedes pedir en Cursor: "genera el shimmer para este widget" con la regla del proyecto.');
    exit(0);
  }

  print('=== Sugerencias app_shimmer para: $path ===\n');
  print("import 'package:app_shimmer/app_shimmer.dart';\n");
  for (var i = 0; i < suggestions.length; i++) {
    print('--- Sugerencia ${i + 1} ---');
    print(suggestions[i]);
    print('');
  }
  print('Ajusta tamaños (width/height) y estilos según tu diseño.');
}

bool _hasListView(String s) =>
    s.contains('ListView.') || s.contains('ListView(');

bool _hasListTile(String s) => s.contains('ListTile(');

bool _hasGridView(String s) =>
    s.contains('GridView.') || s.contains('GridView(');

bool _hasSizedContainer(String s) {
  final hasContainer = s.contains('Container(');
  final hasWidth = s.contains('width:') || s.contains('width :');
  final hasHeight = s.contains('height:') || s.contains('height :');
  return hasContainer && (hasWidth || hasHeight);
}

String _snippetListTile() {
  return '''
AppShimmerListTile(
  leadingStyle: ShimmerContainerStyle(
    width: 40,
    height: 40,
    boxShape: BoxShape.circle,
  ),
  titleStyle: ShimmerContainerStyle(width: 150, height: 16),
  subtitleStyle: ShimmerContainerStyle(width: 100, height: 12),
  trailingStyle: ShimmerContainerStyle(width: 40, height: 40),
  contentSpacing: 16,
  verticalSpacing: 4,
  hasContainer: false,
)''';
}

String _snippetListTileListView() {
  return '''
AppShimmerListTileListView(
  itemCount: 5,
  titleStyle: ShimmerContainerStyle(width: 200, height: 16),
  subtitleStyle: ShimmerContainerStyle(width: 150, height: 12),
  leadingStyle: ShimmerContainerStyle(
    width: 40,
    height: 40,
    boxShape: BoxShape.circle,
  ),
  trailingStyle: ShimmerContainerStyle(width: 40, height: 40, boxShape: BoxShape.circle),
  dividerWidget: SizedBox(height: 8),
  hasContainer: true,
)''';
}

String _snippetContainerList() {
  return '''
AppShimmerContainerList(
  itemCount: 5,
  isColumn: true,
  skeletonContainerStyle: ShimmerContainerStyle(
    width: double.infinity,
    height: 80,
    borderRadiusDouble: 12,
  ),
)''';
}

String _snippetGrid() {
  return '''
AppShimmerGrid(
  itemCount: 6,
  containerStyle: ShimmerContainerStyle(
    width: double.infinity,
    height: 90,
    borderRadiusDouble: 8,
  ),
  iconContainerStyle: ShimmerContainerStyle(
    width: 35,
    height: 35,
    boxShape: BoxShape.circle,
  ),
  crossAxisCount: 3,
  crossAxisSpacing: 8,
  mainAxisSpacing: 8,
)''';
}

String _snippetContainer() {
  return '''
AppShimmerContainer(
  skeletonContainerStyle: ShimmerContainerStyle(
    width: 200,
    height: 100,
    borderRadiusDouble: 12,
  ),
)''';
}
