import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/cubits/sketch_cubit.dart';
import '../widgets/brush_palette.dart';
import '../widgets/color_pallete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sketch Screen"),
      ),
      body: BlocBuilder<SketchCubit, SketchState>(
        builder: (BuildContext context, state) {
          return Stack(
            children: [
              GestureDetector(
                onPanDown: (details) =>
                    context.read<SketchCubit>().addPoint(details.localPosition),
                onPanUpdate: (details) =>
                    context.read<SketchCubit>().addPoint(details.localPosition),
                child: SizedBox(
                  height: 700,
                  width: 300,
                  child: RepaintBoundary(
                    key: UniqueKey(),
                    child: CustomPaint(
                      painter: SketchPainter(
                        points: state.points,
                        color: state.color,
                        brushType: state.brushType,
                        brushSize: state.brushSize,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 500,
                width: 200,
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
          );
        },
      ),
    );
  }
}

class SketchPainter extends CustomPainter {
  final List<Offset> points;
  final Color color;
  final BrushType brushType;
  final double brushSize;

  const SketchPainter({
    required this.points,
    required this.color,
    required this.brushType,
    required this.brushSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = brushSize;

    if (brushType == BrushType.pen) {
      for (int i = 0; i < points.length - 1; i++) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    } else if (brushType == BrushType.eraser) {
      // Implement eraser logic here, e.g., clear a larger area around each point
    }
  }

  @override
  bool shouldRepaint(SketchPainter oldDelegate) => true;
}
