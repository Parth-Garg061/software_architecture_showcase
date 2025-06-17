import 'package:json_annotation/json_annotation.dart';
part 'book_model.g.dart';

@JsonSerializable()
class BookModel{

  @JsonKey(name: 'id', includeIfNull: false)
  final int? bookID;

  @JsonKey(name: 'title', includeIfNull: false)
  final String bookName;

  @JsonKey(name: 'isRead', includeIfNull: false)
  final int isChecked;

  BookModel({this.bookID, required this.bookName, this.isChecked = 0});

  Map<String, dynamic> toJson() => _$BookModelToJson(this);

  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);
}