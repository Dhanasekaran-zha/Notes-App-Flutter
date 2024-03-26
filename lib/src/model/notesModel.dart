// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'notesModel.g.dart';

@collection
class NotesModel {
  Id id = Isar.autoIncrement;
  final String title;
  final String description;
  final DateTime lastMod;
  NotesModel({
    required this.id,
    required this.title,
    required this.description,
    required this.lastMod,
  });

  NotesModel copyWith({
    Id? id,
    String? title,
    String? description,
    DateTime? lastMod,
  }) {
    return NotesModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      lastMod: lastMod ?? this.lastMod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'lastMod': lastMod.millisecondsSinceEpoch,
    };
  }

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      id: map['id'],
      title: map['title'] as String,
      description: map['description'] as String,
      lastMod: DateTime.fromMillisecondsSinceEpoch(map['lastMod'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotesModel.fromJson(String source) =>
      NotesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotesModel(id: $id, title: $title, description: $description, lastMod: $lastMod)';
  }

  @override
  bool operator ==(covariant NotesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.lastMod == lastMod;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      lastMod.hashCode;
  }
}
