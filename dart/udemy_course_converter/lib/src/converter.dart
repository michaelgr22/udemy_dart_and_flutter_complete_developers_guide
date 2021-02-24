import 'dart:io';
import 'package:image/image.dart';

String convertImage(FileSystemEntity selectedfile, String format) {
  final rawImage = (selectedfile as File).readAsBytesSync();
  final image = decodeImage(rawImage);

  var newImage;
  if (format == 'jpg') {
    newImage = encodeJpg(image);
  } else if (format == 'png') {
    newImage = encodePng(image);
  } else {
    print('Unsupported file Type');
  }

  final newPath = replaceExtension(selectedfile.path, format);
  File(newPath).writeAsBytesSync(newImage);
  return newPath;
}

String replaceExtension(String path, String newExtension) {
  return path.replaceAll(RegExp(r'(png|jpg|jpeg)'), newExtension);
}
