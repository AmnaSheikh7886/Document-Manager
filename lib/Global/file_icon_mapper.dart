import 'package:flutter/material.dart';
import 'package:my_file_picker_app/Global/icon.dart';

class FileIcon {
  static final Map<String, IconData> fileExtensionIcons = {
    // Images
    '.jpg': Icons.image,
    '.jpeg': Icons.image,
    '.png': Icons.image,
    '.gif': Icons.image,
    '.bmp': Icons.image,
    '.webp': Icons.image,
    '.svg': Icons.image,

    // PDF
    '.pdf': Icons.picture_as_pdf,

    // Documents
    '.doc': Icons.description,
    '.docx': Icons.description,
    '.txt': Icons.description,

    // Presentations
    '.ppt': Icons.slideshow,
    '.pptx': Icons.slideshow,
  };

}
