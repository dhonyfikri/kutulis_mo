import 'package:json_annotation/json_annotation.dart';
part 'note_model.g.dart';

@JsonSerializable()
class NoteModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'note')
  String? note;
  @JsonKey(name: 'last_modified')
  String? lastModified;

  NoteModel({
    this.id,
    this.title,
    this.note,
    this.lastModified,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);
}
