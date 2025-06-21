// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
  bookID: (json['id'] as num?)?.toInt(),
  bookName: json['title'] as String,
  isChecked: (json['isRead'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
  if (instance.bookID case final value?) 'id': value,
  'title': instance.bookName,
  'isRead': instance.isChecked,
};
