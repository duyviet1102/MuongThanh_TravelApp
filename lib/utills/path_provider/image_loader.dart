import 'dart:io';

class ImageUtility {
  static Future<List<File>> loadImagesFromDirectory(String directoryPath) async {
    Directory directory = Directory(directoryPath);
    List<File> imageFiles = [];
    if (await directory.exists()) {
      List<FileSystemEntity> fileList = directory.listSync();
      for (FileSystemEntity file in fileList) {
        if (file is File && _isImageFile(file.path)) {
          imageFiles.add(file);
        }
      }
    }
    return imageFiles;
  }

  static bool _isImageFile(String path) {
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif'];
    return imageExtensions.any((extension) => path.toLowerCase().endsWith(extension));
  }
}
