// ignore_for_file: non_constant_identifier_names

import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/faetures/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';


class SaveToHive implements UserCase<void, BlogParams> {
  final BlogRepository blogRepository;

  SaveToHive( this.blogRepository);
  @override
  Future<Either<Failure, dynamic>> call(BlogParams params) {
    return blogRepository.saveBlog(
        id: params.id, image_url: params.image_url, title: params.title);
  }
}

class BlogParams {
  final String id;
  final String image_url;
  final String title;

  BlogParams({required this.id, required this.image_url, required this.title});
}
