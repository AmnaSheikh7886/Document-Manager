import 'package:my_file_picker_app/Data/Model/folder_model.dart';
import 'package:my_file_picker_app/Global/folder_table_constants.dart';

class FolderModelMapper {
  static Map<String, dynamic> toJson(Folder folder) {
    return {
      FolderTableConstants.id: folder.id,
      FolderTableConstants.name: folder.name,
      FolderTableConstants.createdAt: folder.createdAt,
      FolderTableConstants.filesCount: folder.filesCount,
      FolderTableConstants.color:folder.color
    };
  }

  static Folder fromJson(Map<String, dynamic> json) {
    return Folder(
      id: json[FolderTableConstants.id],
      name: json[FolderTableConstants.name],
      createdAt: json[FolderTableConstants.createdAt],
      filesCount: json[FolderTableConstants.filesCount],
      color: json[FolderTableConstants.color]
    );
  }
}
