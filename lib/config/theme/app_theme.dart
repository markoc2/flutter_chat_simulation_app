import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.orange,
  Colors.black,
  Colors.green,
  Colors.blue
];

class AppTheme {
  final int selectedColor;
  final Brightness selectedBrightness;

  AppTheme({this.selectedBrightness = Brightness.light, this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length,
            'selected Color Between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        brightness: selectedBrightness);
  }
}
