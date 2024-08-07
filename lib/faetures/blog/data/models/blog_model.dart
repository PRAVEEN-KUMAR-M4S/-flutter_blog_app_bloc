
// ignore_for_file: non_constant_identifier_names


import 'package:blog_app/faetures/blog/domain/entities/blog.dart';

class BlogModel extends Blog {
  BlogModel({
    required super.id,
    required super.title,
    required super.image_url,

  });

  
  Blog copyWith({
    String? id,
    String? image_url,
    String? title,
  }) {
    return Blog(
      id: id ?? this.id,
      image_url: image_url ?? this.image_url,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image_url': image_url,
      'title': title,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] as String,
      image_url: map['image_url'] as String,
      title: map['title'] as String,
    );
  }


}
