// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $FoldersTableTable extends FoldersTable
    with TableInfo<$FoldersTableTable, FoldersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoldersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filesCountMeta = const VerificationMeta(
    'filesCount',
  );
  @override
  late final GeneratedColumn<int> filesCount = GeneratedColumn<int>(
    'files_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdAt,
    filesCount,
    color,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'folders_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FoldersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('files_count')) {
      context.handle(
        _filesCountMeta,
        filesCount.isAcceptableOrUnknown(data['files_count']!, _filesCountMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoldersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoldersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      filesCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}files_count'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
    );
  }

  @override
  $FoldersTableTable createAlias(String alias) {
    return $FoldersTableTable(attachedDatabase, alias);
  }
}

class FoldersTableData extends DataClass
    implements Insertable<FoldersTableData> {
  final String id;
  final String name;
  final String createdAt;
  final int filesCount;
  final int color;
  const FoldersTableData({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.filesCount,
    required this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<String>(createdAt);
    map['files_count'] = Variable<int>(filesCount);
    map['color'] = Variable<int>(color);
    return map;
  }

  FoldersTableCompanion toCompanion(bool nullToAbsent) {
    return FoldersTableCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      filesCount: Value(filesCount),
      color: Value(color),
    );
  }

  factory FoldersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoldersTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      filesCount: serializer.fromJson<int>(json['filesCount']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<String>(createdAt),
      'filesCount': serializer.toJson<int>(filesCount),
      'color': serializer.toJson<int>(color),
    };
  }

  FoldersTableData copyWith({
    String? id,
    String? name,
    String? createdAt,
    int? filesCount,
    int? color,
  }) => FoldersTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    filesCount: filesCount ?? this.filesCount,
    color: color ?? this.color,
  );
  FoldersTableData copyWithCompanion(FoldersTableCompanion data) {
    return FoldersTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      filesCount: data.filesCount.present
          ? data.filesCount.value
          : this.filesCount,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoldersTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('filesCount: $filesCount, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, filesCount, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoldersTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.filesCount == this.filesCount &&
          other.color == this.color);
}

class FoldersTableCompanion extends UpdateCompanion<FoldersTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> createdAt;
  final Value<int> filesCount;
  final Value<int> color;
  final Value<int> rowid;
  const FoldersTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.filesCount = const Value.absent(),
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FoldersTableCompanion.insert({
    required String id,
    required String name,
    required String createdAt,
    this.filesCount = const Value.absent(),
    required int color,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       color = Value(color);
  static Insertable<FoldersTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? createdAt,
    Expression<int>? filesCount,
    Expression<int>? color,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (filesCount != null) 'files_count': filesCount,
      if (color != null) 'color': color,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FoldersTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? createdAt,
    Value<int>? filesCount,
    Value<int>? color,
    Value<int>? rowid,
  }) {
    return FoldersTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      filesCount: filesCount ?? this.filesCount,
      color: color ?? this.color,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (filesCount.present) {
      map['files_count'] = Variable<int>(filesCount.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoldersTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('filesCount: $filesCount, ')
          ..write('color: $color, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FilesTableTable extends FilesTable
    with TableInfo<$FilesTableTable, FilesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FilesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _extensionMeta = const VerificationMeta(
    'extension',
  );
  @override
  late final GeneratedColumn<String> extension = GeneratedColumn<String>(
    'extension',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES folders_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    path,
    size,
    extension,
    parentId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'files_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FilesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('extension')) {
      context.handle(
        _extensionMeta,
        extension.isAcceptableOrUnknown(data['extension']!, _extensionMeta),
      );
    } else if (isInserting) {
      context.missing(_extensionMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FilesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FilesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}size'],
      )!,
      extension: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extension'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FilesTableTable createAlias(String alias) {
    return $FilesTableTable(attachedDatabase, alias);
  }
}

class FilesTableData extends DataClass implements Insertable<FilesTableData> {
  final String id;
  final String name;
  final String path;
  final String size;
  final String extension;
  final String parentId;
  final String createdAt;
  const FilesTableData({
    required this.id,
    required this.name,
    required this.path,
    required this.size,
    required this.extension,
    required this.parentId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['path'] = Variable<String>(path);
    map['size'] = Variable<String>(size);
    map['extension'] = Variable<String>(extension);
    map['parent_id'] = Variable<String>(parentId);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  FilesTableCompanion toCompanion(bool nullToAbsent) {
    return FilesTableCompanion(
      id: Value(id),
      name: Value(name),
      path: Value(path),
      size: Value(size),
      extension: Value(extension),
      parentId: Value(parentId),
      createdAt: Value(createdAt),
    );
  }

  factory FilesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FilesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      path: serializer.fromJson<String>(json['path']),
      size: serializer.fromJson<String>(json['size']),
      extension: serializer.fromJson<String>(json['extension']),
      parentId: serializer.fromJson<String>(json['parentId']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'path': serializer.toJson<String>(path),
      'size': serializer.toJson<String>(size),
      'extension': serializer.toJson<String>(extension),
      'parentId': serializer.toJson<String>(parentId),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  FilesTableData copyWith({
    String? id,
    String? name,
    String? path,
    String? size,
    String? extension,
    String? parentId,
    String? createdAt,
  }) => FilesTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    path: path ?? this.path,
    size: size ?? this.size,
    extension: extension ?? this.extension,
    parentId: parentId ?? this.parentId,
    createdAt: createdAt ?? this.createdAt,
  );
  FilesTableData copyWithCompanion(FilesTableCompanion data) {
    return FilesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      path: data.path.present ? data.path.value : this.path,
      size: data.size.present ? data.size.value : this.size,
      extension: data.extension.present ? data.extension.value : this.extension,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FilesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('size: $size, ')
          ..write('extension: $extension, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, path, size, extension, parentId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FilesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.path == this.path &&
          other.size == this.size &&
          other.extension == this.extension &&
          other.parentId == this.parentId &&
          other.createdAt == this.createdAt);
}

class FilesTableCompanion extends UpdateCompanion<FilesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> path;
  final Value<String> size;
  final Value<String> extension;
  final Value<String> parentId;
  final Value<String> createdAt;
  final Value<int> rowid;
  const FilesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.path = const Value.absent(),
    this.size = const Value.absent(),
    this.extension = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FilesTableCompanion.insert({
    required String id,
    required String name,
    required String path,
    required String size,
    required String extension,
    required String parentId,
    required String createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       path = Value(path),
       size = Value(size),
       extension = Value(extension),
       parentId = Value(parentId),
       createdAt = Value(createdAt);
  static Insertable<FilesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? path,
    Expression<String>? size,
    Expression<String>? extension,
    Expression<String>? parentId,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (size != null) 'size': size,
      if (extension != null) 'extension': extension,
      if (parentId != null) 'parent_id': parentId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FilesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? path,
    Value<String>? size,
    Value<String>? extension,
    Value<String>? parentId,
    Value<String>? createdAt,
    Value<int>? rowid,
  }) {
    return FilesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      size: size ?? this.size,
      extension: extension ?? this.extension,
      parentId: parentId ?? this.parentId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (extension.present) {
      map['extension'] = Variable<String>(extension.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FilesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('size: $size, ')
          ..write('extension: $extension, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FoldersTableTable foldersTable = $FoldersTableTable(this);
  late final $FilesTableTable filesTable = $FilesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    foldersTable,
    filesTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'folders_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('files_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$FoldersTableTableCreateCompanionBuilder =
    FoldersTableCompanion Function({
      required String id,
      required String name,
      required String createdAt,
      Value<int> filesCount,
      required int color,
      Value<int> rowid,
    });
typedef $$FoldersTableTableUpdateCompanionBuilder =
    FoldersTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> createdAt,
      Value<int> filesCount,
      Value<int> color,
      Value<int> rowid,
    });

final class $$FoldersTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $FoldersTableTable, FoldersTableData> {
  $$FoldersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FilesTableTable, List<FilesTableData>>
  _filesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.filesTable,
    aliasName: $_aliasNameGenerator(db.foldersTable.id, db.filesTable.parentId),
  );

  $$FilesTableTableProcessedTableManager get filesTableRefs {
    final manager = $$FilesTableTableTableManager(
      $_db,
      $_db.filesTable,
    ).filter((f) => f.parentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_filesTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FoldersTableTableFilterComposer
    extends Composer<_$AppDatabase, $FoldersTableTable> {
  $$FoldersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get filesCount => $composableBuilder(
    column: $table.filesCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> filesTableRefs(
    Expression<bool> Function($$FilesTableTableFilterComposer f) f,
  ) {
    final $$FilesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.filesTable,
      getReferencedColumn: (t) => t.parentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FilesTableTableFilterComposer(
            $db: $db,
            $table: $db.filesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FoldersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FoldersTableTable> {
  $$FoldersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get filesCount => $composableBuilder(
    column: $table.filesCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FoldersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoldersTableTable> {
  $$FoldersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get filesCount => $composableBuilder(
    column: $table.filesCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  Expression<T> filesTableRefs<T extends Object>(
    Expression<T> Function($$FilesTableTableAnnotationComposer a) f,
  ) {
    final $$FilesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.filesTable,
      getReferencedColumn: (t) => t.parentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FilesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.filesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FoldersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoldersTableTable,
          FoldersTableData,
          $$FoldersTableTableFilterComposer,
          $$FoldersTableTableOrderingComposer,
          $$FoldersTableTableAnnotationComposer,
          $$FoldersTableTableCreateCompanionBuilder,
          $$FoldersTableTableUpdateCompanionBuilder,
          (FoldersTableData, $$FoldersTableTableReferences),
          FoldersTableData,
          PrefetchHooks Function({bool filesTableRefs})
        > {
  $$FoldersTableTableTableManager(_$AppDatabase db, $FoldersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoldersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoldersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoldersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<int> filesCount = const Value.absent(),
                Value<int> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FoldersTableCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                filesCount: filesCount,
                color: color,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String createdAt,
                Value<int> filesCount = const Value.absent(),
                required int color,
                Value<int> rowid = const Value.absent(),
              }) => FoldersTableCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                filesCount: filesCount,
                color: color,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FoldersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({filesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (filesTableRefs) db.filesTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (filesTableRefs)
                    await $_getPrefetchedData<
                      FoldersTableData,
                      $FoldersTableTable,
                      FilesTableData
                    >(
                      currentTable: table,
                      referencedTable: $$FoldersTableTableReferences
                          ._filesTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FoldersTableTableReferences(
                            db,
                            table,
                            p0,
                          ).filesTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.parentId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FoldersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoldersTableTable,
      FoldersTableData,
      $$FoldersTableTableFilterComposer,
      $$FoldersTableTableOrderingComposer,
      $$FoldersTableTableAnnotationComposer,
      $$FoldersTableTableCreateCompanionBuilder,
      $$FoldersTableTableUpdateCompanionBuilder,
      (FoldersTableData, $$FoldersTableTableReferences),
      FoldersTableData,
      PrefetchHooks Function({bool filesTableRefs})
    >;
typedef $$FilesTableTableCreateCompanionBuilder =
    FilesTableCompanion Function({
      required String id,
      required String name,
      required String path,
      required String size,
      required String extension,
      required String parentId,
      required String createdAt,
      Value<int> rowid,
    });
typedef $$FilesTableTableUpdateCompanionBuilder =
    FilesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> path,
      Value<String> size,
      Value<String> extension,
      Value<String> parentId,
      Value<String> createdAt,
      Value<int> rowid,
    });

final class $$FilesTableTableReferences
    extends BaseReferences<_$AppDatabase, $FilesTableTable, FilesTableData> {
  $$FilesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FoldersTableTable _parentIdTable(_$AppDatabase db) =>
      db.foldersTable.createAlias(
        $_aliasNameGenerator(db.filesTable.parentId, db.foldersTable.id),
      );

  $$FoldersTableTableProcessedTableManager get parentId {
    final $_column = $_itemColumn<String>('parent_id')!;

    final manager = $$FoldersTableTableTableManager(
      $_db,
      $_db.foldersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FilesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FilesTableTable> {
  $$FilesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$FoldersTableTableFilterComposer get parentId {
    final $$FoldersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.foldersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoldersTableTableFilterComposer(
            $db: $db,
            $table: $db.foldersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FilesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FilesTableTable> {
  $$FilesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$FoldersTableTableOrderingComposer get parentId {
    final $$FoldersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.foldersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoldersTableTableOrderingComposer(
            $db: $db,
            $table: $db.foldersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FilesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FilesTableTable> {
  $$FilesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get extension =>
      $composableBuilder(column: $table.extension, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$FoldersTableTableAnnotationComposer get parentId {
    final $$FoldersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.foldersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoldersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.foldersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FilesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FilesTableTable,
          FilesTableData,
          $$FilesTableTableFilterComposer,
          $$FilesTableTableOrderingComposer,
          $$FilesTableTableAnnotationComposer,
          $$FilesTableTableCreateCompanionBuilder,
          $$FilesTableTableUpdateCompanionBuilder,
          (FilesTableData, $$FilesTableTableReferences),
          FilesTableData,
          PrefetchHooks Function({bool parentId})
        > {
  $$FilesTableTableTableManager(_$AppDatabase db, $FilesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FilesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FilesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FilesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String> size = const Value.absent(),
                Value<String> extension = const Value.absent(),
                Value<String> parentId = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FilesTableCompanion(
                id: id,
                name: name,
                path: path,
                size: size,
                extension: extension,
                parentId: parentId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String path,
                required String size,
                required String extension,
                required String parentId,
                required String createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FilesTableCompanion.insert(
                id: id,
                name: name,
                path: path,
                size: size,
                extension: extension,
                parentId: parentId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FilesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({parentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (parentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parentId,
                                referencedTable: $$FilesTableTableReferences
                                    ._parentIdTable(db),
                                referencedColumn: $$FilesTableTableReferences
                                    ._parentIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FilesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FilesTableTable,
      FilesTableData,
      $$FilesTableTableFilterComposer,
      $$FilesTableTableOrderingComposer,
      $$FilesTableTableAnnotationComposer,
      $$FilesTableTableCreateCompanionBuilder,
      $$FilesTableTableUpdateCompanionBuilder,
      (FilesTableData, $$FilesTableTableReferences),
      FilesTableData,
      PrefetchHooks Function({bool parentId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FoldersTableTableTableManager get foldersTable =>
      $$FoldersTableTableTableManager(_db, _db.foldersTable);
  $$FilesTableTableTableManager get filesTable =>
      $$FilesTableTableTableManager(_db, _db.filesTable);
}
