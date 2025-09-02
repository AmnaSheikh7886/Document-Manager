class Folder {
  String id;
  String name;
  String createdAt;
  int filesCount;
  int color;

  Folder({
    required this.id,
    required this.name,
    required this.createdAt,
    this.filesCount=0,
    required this.color
  });
}
