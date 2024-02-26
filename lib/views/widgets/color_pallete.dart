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
    return ColorPicker(
      colorPickerWidth: 200,
      pickerAreaBorderRadius: BorderRadius.circular(100),
      paletteType: PaletteType.hsv,
      enableAlpha: false,
      showLabel: false,
      pickerColor: color,
      onColorChanged: onColorChanged,
    );
  }
}
