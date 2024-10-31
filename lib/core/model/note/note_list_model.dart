import 'package:json_annotation/json_annotation.dart';
import 'package:kutulis_mo/core/model/note/note_model.dart';
part 'note_list_model.g.dart';

@JsonSerializable()
class NoteListModel {
  @JsonKey(name: 'data', toJson: _dataToJson, fromJson: _dataFromJson)
  List<NoteModel>? data;

  NoteListModel({
    this.data,
  });

  static List<NoteModel> _dataFromJson(List<dynamic>? jsons) =>
      jsons?.map((json) => NoteModel.fromJson(json)).toList() ?? [];

  static List<Map<String, dynamic>> _dataToJson(List<NoteModel>? elements) =>
      elements?.map((element) => element.toJson()).toList() ?? [];

  factory NoteListModel.fromJson(Map<String, dynamic> json) =>
      _$NoteListModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteListModelToJson(this);
}
