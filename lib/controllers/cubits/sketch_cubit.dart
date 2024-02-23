import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sketch_state.dart';

class SketchCubit extends Cubit<SketchState> {
  SketchCubit() : super(SketchInitial());

  void addPoint(Offset point) {
    emit(
      DrawingSketchState(
          points: state.points..add(point),
          color: state.color,
          brushType: state.brushType,
          brushSize: state.brushSize,
          strokeWidth: state.strokeWidth,
          history: [...state.history, state.points]),
    );
  }

  void undo() {
    if (state.history.isEmpty) return;
    final previousPoints = state.history.removeLast();
    emit(DrawingSketchState(
      points: state.points
          .where((element) => !previousPoints.contains(element))
          .toList(),
      color: state.color,
      brushType: state.brushType,
      brushSize: state.brushSize,
      strokeWidth: state.strokeWidth,
      history: state.history,
    ));
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
