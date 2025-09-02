import 'package:my_file_picker_app/Data/Model/file_model.dart';
import 'package:my_file_picker_app/Global/file_table_constants.dart';

class FileModelMapper {
  static Map<String, dynamic> toJson(FileModel file) {
    return {
      FileTableConstants.id: file.id,
      FileTableConstants.name: file.name,
      FileTableConstants.path: file.path,
      FileTableConstants.size: file.size,
      FileTableConstants.extension: file.extension,
      FileTableConstants.createdAt: file.createdAt,
      FileTableConstants.parentId: file.parentId,
    };
  }

  static FileModel fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json[FileTableConstants.id],
      name: json[FileTableConstants.name],
      path: json[FileTableConstants.path],
      size: json[FileTableConstants.size],
      extension: json[FileTableConstants.extension],
      parentId: json[FileTableConstants.parentId],
      createdAt: json[FileTableConstants.createdAt],
    );
  }
}
