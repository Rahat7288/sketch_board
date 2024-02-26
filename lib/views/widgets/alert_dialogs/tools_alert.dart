import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/cubits/sketch_cubit.dart';
import '../brush_palette.dart';
import '../color_pallete.dart';

class ToolsMenu extends StatelessWidget {
  const ToolsMenu({super.key, required this.state});
  final SketchState state;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Row(
        children: [
          const Expanded(child: Text("Tools Bar")),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close))
        ],
      ),
      content: SizedBox(
        height: 450,
        child: Column(
          children: [
            SizedBox(
              // height: 500,
              width: 450,
              child: ColorPalette(
                color: state.color,
                onColorChanged: (Color value) =>
                    context.read<SketchCubit>().setColor(value),
              ),
            ),
            BrushPalette(
              brushType: state.brushType,
              brushSize: state.brushSize,
              onBrushTypeChanged: (BrushType value) =>
                  context.read<SketchCubit>().setBrushType(value),
              onBrushSizeChanged: (double value) =>
                  context.read<SketchCubit>().setBrushSize(value),
            ),
          ],
        ),
      ),
    );
  }
}
