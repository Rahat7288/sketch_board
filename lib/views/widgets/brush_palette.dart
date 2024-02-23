import 'package:flutter/material.dart';

import '../../controllers/cubits/sketch_cubit.dart';

class BrushPalette extends StatelessWidget {
  final BrushType brushType;
  final double brushSize;
  final ValueChanged<BrushType> onBrushTypeChanged;
  final ValueChanged<double> onBrushSizeChanged;

  const BrushPalette({
    required this.brushType,
    required this.brushSize,
    required this.onBrushTypeChanged,
    required this.onBrushSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      right: 20,
      child: Column(
        children: [
          BrushTypePicker(
            selectedBrushType: brushType,
            onBrushTypeChanged: onBrushTypeChanged,
          ),
          SizedBox(height: 20),
          BrushSizePicker(
            selectedBrushSize: brushSize,
            onBrushSizeChanged: onBrushSizeChanged,
          ),
        ],
      ),
    );
  }
}

class BrushTypePicker extends StatelessWidget {
  final BrushType selectedBrushType;
  final ValueChanged<BrushType> onBrushTypeChanged;

  const BrushTypePicker({
    required this.selectedBrushType,
    required this.onBrushTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.edit,
              color: selectedBrushType == BrushType.pen
                  ? Colors.blue
                  : Colors.grey),
          onPressed: () => onBrushTypeChanged(BrushType.pen),
        ),
        IconButton(
          icon: Icon(Icons.clear,
              color: selectedBrushType == BrushType.eraser
                  ? Colors.blue
                  : Colors.grey),
          onPressed: () => onBrushTypeChanged(BrushType.eraser),
        ),
      ],
    );
  }
}

class BrushSizePicker extends StatelessWidget {
  final double selectedBrushSize;
  final ValueChanged<double> onBrushSizeChanged;

  const BrushSizePicker({
    required this.selectedBrushSize,
    required this.onBrushSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Size: ${selectedBrushSize.toStringAsFixed(1)}'),
        Slider(
          value: selectedBrushSize,
          min: 1.0,
          max: 10.0,
          onChanged: onBrushSizeChanged,
        ),
      ],
    );
  }
}
