
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BlogRepository {

  Future<Either<Failure,List<Blog>>> getAllBlogs();

    Future<Either<Failure, void>> saveBlog({
    required String id,
    required String image_url,
    required String title,
  });
}
