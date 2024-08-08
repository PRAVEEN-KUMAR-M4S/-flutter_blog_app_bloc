
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BlogRepository {

  Future<Either<Failure,List<Blog>>> getAllBlogs();


}
