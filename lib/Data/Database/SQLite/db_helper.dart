import 'dart:io';
import 'package:my_file_picker_app/Global/file_table_constants.dart';
import 'package:my_file_picker_app/Global/folder_table_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper getInstance = DatabaseHelper._();
  Database? database;
  String databaseFile = "document_manager.db";

  Future<Database> getDb() async {
    if (database != null) {
      return database!;
    } else {
      database = await openDb();
      return database!;
    }
  }

  Future<Database> openDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDir.path, databaseFile);

    return await openDatabase(
      databasePath,
      onCreate: (db, version) {
        // creating folders table
        db.execute(
          "CREATE TABLE ${FolderTableConstants.tableName} (${FolderTableConstants.id} TEXT PRIMARY KEY,${FolderTableConstants.name} TEXT NOT NULL,${FolderTableConstants.createdAt} TEXT NOT NULL,${FolderTableConstants.filesCount} INTEGER NOT NULL DEFAULT 0,${FolderTableConstants.color} INTEGER NOT NULL);",
        );
        // creating files table
        db.execute("CREATE TABLE ${FileTableConstants.tableName} (${FileTableConstants.id} TEXT PRIMARY KEY,${FileTableConstants.name} TEXT NOT NULL,${FileTableConstants.path} TEXT NOT NULL,${FileTableConstants.size} TEXT NOT NULL,${FileTableConstants.extension} TEXT NOT NULL, ${FileTableConstants.parentId} TEXT NOT NULL, ${FileTableConstants.createdAt} TEXT NOT NULL, FOREIGN KEY (${FileTableConstants.parentId}) REFERENCES folders (${FolderTableConstants.id}) ON DELETE CASCADE);");
        
      },
      version: 1
    );
  }
}
