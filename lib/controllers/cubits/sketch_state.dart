part of 'sketch_cubit.dart';

enum BrushType { pen, eraser, line, marker }

@immutable
abstract class SketchState extends Equatable {
  final List<Offset> points;
  final Color color;
  final BrushType brushType;
  final double brushSize;
  final double strokeWidth;
  final List<List<Offset>> history;

  const SketchState({
    required this.points,
    required this.color,
    required this.brushType,
    required this.brushSize,
    required this.strokeWidth,
    required this.history,
  });

  @override
  List<Object?> get props =>
      [points, color, brushType, brushSize, strokeWidth, history];
}

class SketchInitial extends SketchState {
  SketchInitial()
      : super(
            points: [],
            color: Colors.black,
            brushType: BrushType.pen,
            brushSize: 2.0,
            strokeWidth: 1.0,
            history: []);
}

class DrawingSketchState extends SketchState {
  const DrawingSketchState(
      {required List<Offset> points,
      required Color color,
      required BrushType brushType,
      required double brushSize,
      required double strokeWidth,
      required List<List<Offset>> history})
      : super(
          points: points,
          color: color,
          brushType: brushType,
          brushSize: brushSize,
          strokeWidth: strokeWidth,
          history: history,
        );
}

class ImageLoadedSketchState extends SketchState {
  ImageLoadedSketchState({
    required List<Offset> points,
    required Color color,
    required BrushType brushType,
    required double brushSize,
    required double strokeWidth,
    required List<List<Offset>> history,
  }) : super(
          points: points,
          color: color,
          brushType: brushType,
          brushSize: brushSize,
          strokeWidth: strokeWidth,
          history: history,
        );
}
