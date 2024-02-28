import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_board/controllers/constants/app_color.dart';

import '../../controllers/cubits/sketch_cubit.dart';
import '../widgets/alert_dialogs/tools_alert.dart';
import '../widgets/buttons/icon_button_with_button_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchCubit, SketchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Sketch Screen"),
            centerTitle: false,
            actions: [
              iconButtonWithName(
                  bName: 'Save', bWidth: 120, bColor: AppColor.saveButtonColor),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: GestureDetector(
              // onPanStart: (offsets) =>
              //     context.read<SketchCubit>().addPoint(offsets.localPosition),
              onPanUpdate: (offsets) {
                final renderBox = context.findRenderObject() as RenderBox;
                final localPosition =
                    renderBox.globalToLocal(offsets.globalPosition);
                context.read<SketchCubit>().addPoint(localPosition);
              },
              onPanDown: (offsets) => context.read<SketchCubit>().stopDrawing(),
              onPanEnd: (offsets) => context.read<SketchCubit>().stopDrawing(),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                // color: Colors.green,
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
          ),

          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<SketchCubit>().undo();
                  },
                  child: const Icon(Icons.undo),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<SketchCubit>().redo();
                  },
                  child: const Icon(Icons.redo),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext buildContext) => ToolsMenu(
                              state: state,
                            ));
                  },
                  child: const Center(
                    child: Icon(Icons.palette),
                  ),
                ),
              ],
            ),
          ),
          // bottomSheet: Container(
          //   height: 60,
          //   color: Colors.green,
          // ),
        );
      },
    );
  }
}

class SketchPainter extends CustomPainter {
  final List<Offset> points;
  // final List<List<Offset>> paths;
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
  bool shouldRepaint(SketchPainter oldDelegate) => points != oldDelegate.points;

  // @override
  // bool shouldRebuildSemantics(SketchPainter oldDelegate) => true;
}
