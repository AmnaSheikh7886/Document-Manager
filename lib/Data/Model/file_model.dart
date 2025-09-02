class FileModel {
  String id;
  String name;
  String path;
  String size;
  String extension;
  String parentId;
  String createdAt;

  FileModel({
    required this.id,
    required this.name,
    required this.path,
    required this.size,
    required this.extension,
    required this.parentId,
    required this.createdAt,
  });
}
