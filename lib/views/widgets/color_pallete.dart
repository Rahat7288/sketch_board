import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPalette extends StatelessWidget {
  final Color color;
  final ValueChanged<Color> onColorChanged;
  const ColorPalette({
    super.key,
    required this.color,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        right: 20,
        child: ColorPicker(
          pickerColor: color,
          onColorChanged: onColorChanged,
        ));
  }
}
