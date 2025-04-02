import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:io';

Future<File> compressImage(File file) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    file.path,
    '${file.path}_compressed.jpg',
    quality: 70, // Оптимальное качество (70%)
    minWidth: 800, // Максимальная ширина
    minHeight: 800, // Максимальная высота
  );
  return File(result!.path);
}
