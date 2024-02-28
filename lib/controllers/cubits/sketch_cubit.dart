import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sketch_state.dart';

class SketchCubit extends Cubit<SketchState> {
  SketchCubit() : super(SketchInitial());

  List<Offset> _currentPoints = [];

  void addPoint(Offset point) {
    final points = List<Offset>.from(state.points)..add(point);
    // debugPrint("my first points=========${points.first}");
    // final history = state.history..add(points);
    //
    // debugPrint("my points hoistory are $history./n");

    emit(
      DrawingSketchState(
          points: points,
          color: state.color,
          brushType: state.brushType,
          brushSize: state.brushSize,
          strokeWidth: state.strokeWidth,
          history: [...state.history, state.points]),
    );

    // if (point == state.points.last) return;
    // _isDrawing = true;
  }

  // void updatePoints(Offset point) {
  //   final List<List<Offset>> newState = List.from(state.history);
  //   newState.last.add(point);
  //   emit(DrawingSketchState(
  //     points: state.points,
  //     color: state.color,
  //     brushType: state.brushType,
  //     brushSize: state.brushSize,
  //     strokeWidth: state.strokeWidth,
  //     history: [...state.history, state.points],
  //   ));
  // }

  void stopDrawing() {
    if (state.points.isNotEmpty) {
      debugPrint("My  last points are ${state.points.last}\n");
      emit(state.copyWith(history: [...state.history, state.points]));
    }
  }

  void undo() {
    if (state.history.isEmpty) return;

    final newPoints = state.history.removeLast();
    emit(state.copyWith(
        points: newPoints,
        history: state.history.sublist(0, state.history.length - 1)));
  }

  void redo() {
    if (state.history.isEmpty) return;
    final lastPoints = state.history.last;
    emit(DrawingSketchState(
      points: [...state.points, ...lastPoints],
      color: state.color,
      brushType: state.brushType,
      brushSize: state.brushSize,
      strokeWidth: state.strokeWidth,
      history: state.history,
    ));
  }

  void setColor(Color color) {
    emit(state.copyWith(color: color));
  }

  void setBrushType(BrushType brushType) {
    emit(state.copyWith(brushType: brushType));
  }

  void setBrushSize(double brushSize) {
    emit(state.copyWith(brushSize: brushSize));
  }

  void setStrokeSize(double strokeSize) {
    emit(state.copyWith(strokeWidth: strokeSize));
  }
}
