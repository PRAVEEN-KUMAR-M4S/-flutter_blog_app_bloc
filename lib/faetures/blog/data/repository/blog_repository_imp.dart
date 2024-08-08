import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/network/network_connection.dart';
import 'package:blog_app/faetures/blog/data/datasources/blog_remote_data_source.dart';
import 'package:blog_app/faetures/blog/data/datasources/hive_database.dart';
import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:blog_app/faetures/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class BlogRepositoryImp implements BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;
  final ConnectionChecker connectionChecker;
  final BlogHiveStorage blogHiveStrorage;

  BlogRepositoryImp(
      this.blogRemoteDataSource, this.connectionChecker, this.blogHiveStrorage);

  @override
  Future<Either<Failure, List<Blog>>> getAllBlogs() async {
    try {
      if (!await (connectionChecker.isConnected())) {
        final blogs = blogHiveStrorage.loadBlogs();
        return right(blogs);
      }
      final blogs = await blogRemoteDataSource.getAllBlogs();
      blogHiveStrorage.uploadLocalBlogs(blogs: blogs);
      return right(blogs);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }


}
