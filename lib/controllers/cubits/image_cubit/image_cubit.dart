// import 'dart:ui';
//
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:hive/hive.dart';
// import 'package:meta/meta.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:sketch_board/controllers/cubits/sketch_cubit.dart';
//
// part 'image_state.dart';
//
// class ImageCubit extends Cubit<ImageState> {
//   ImageCubit() : super(ImageInitial());
//
//   Future<void> saveImage(List<Offset> points, Color color, BrushType brushType,
//       double brushSize) async {
//     final permissionStatus = await Permission.storage.request();
//     if (permissionStatus != permissionStatus.isGranted) {
//       emit(const StorageErrorState('Storage Permission denied'));
//       return;
//     }
//
//     final box = await Hive.openBox<String>('images');
//
//     final filename = '${DateTime.now()}.png';
//     // final image =
//     //     await generateImageFromPoints(points, color, brushType, brushSize);
//   }
//
//   // Future<Uint8List> generateImageFromPoints(List<Offset> points, Color color,
//   //     BrushType brushType, double brushSize) async {
//   //   final recorder = PictureRecorder();
//   //   final canvas = Canvas(recorder);
//   //   final paint = Paint()
//   //     ..color = color
//   //     ..strokeWidth = brushSize;
//   //
//   //   for (int i = 0; i < points.length - 1; i++) {
//   //     canvas.drawLine(points[i], points[i + 1], paint);
//   //   }
//   //
//   //   final picture = recorder.endRecording();
//   //   // final image = await picture.toImage(
//   //   //   picture.width.floor(),
//   //   //   picture.height.toInt(),
//   //   // );
//   //   final bytes = await image.toByteData(format: ImageByteFormat.png);
//   //   return bytes!.buffer.asUint8List();
//   // }
// }
