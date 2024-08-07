
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:blog_app/faetures/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';


class GetBlogs implements UserCase<List<Blog>, Noparams> {
  final BlogRepository blogRepository;

  GetBlogs(this.blogRepository);
  @override
  Future<Either<Failure, List<Blog>>> call(Noparams params) async {
    return await blogRepository.getAllBlogs();
  }
}
