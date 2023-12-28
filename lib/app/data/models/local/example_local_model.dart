// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_annotation_target
import 'dart:convert';

import 'package:isar/isar.dart';

part 'example_local_model.g.dart';

@collection
class ExampleLocalModel {
  Id? dbId;

  int? id;
  String? name;
  String? description;
  
  ExampleLocalModel({
    this.dbId,
    this.id,
    this.name,
    this.description,
  });

  ExampleLocalModel copyWith({
    Id? dbId,
    int? id,
    String? name,
    String? description,
  }) {
    return ExampleLocalModel(
      dbId: dbId ?? this.dbId,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @ignore
  factory ExampleLocalModel.fromMap(Map<String, dynamic> map) {
    return ExampleLocalModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  @ignore
  factory ExampleLocalModel.fromJson(String source) =>
      ExampleLocalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExampleLocalModel(dbId: $dbId, id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(covariant ExampleLocalModel other) {
    if (identical(this, other)) return true;

    return other.dbId == dbId &&
        other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode {
    return dbId.hashCode ^ id.hashCode ^ name.hashCode ^ description.hashCode;
  }
}
