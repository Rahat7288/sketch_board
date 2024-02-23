import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sketch_state.dart';

class SketchCubit extends Cubit<SketchState> {
  SketchCubit() : super(SketchInitial());
}
