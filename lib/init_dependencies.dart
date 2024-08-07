import 'package:blog_app/core/network/network_connection.dart';
import 'package:blog_app/faetures/blog/data/datasources/blog_remote_data_source.dart';
import 'package:blog_app/faetures/blog/data/datasources/hive_database.dart';
import 'package:blog_app/faetures/blog/data/repository/blog_repository_imp.dart';
import 'package:blog_app/faetures/blog/domain/repository/blog_repository.dart';
import 'package:blog_app/faetures/blog/domain/usecases/get_blogs.dart';
import 'package:blog_app/faetures/blog/domain/usecases/save_to_hive.dart';
import 'package:blog_app/faetures/blog/presentation/bloc/blog_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependency() async {
  _initBlog();

  Hive.defaultDirectory = (await getApplicationCacheDirectory()).path;

  serviceLocator.registerLazySingleton(() => Hive.box(name: 'blogs'));

  serviceLocator
      .registerFactory<ConnectionChecker>(() => ConnectionCheckerImp());
}

void _initBlog() {
  serviceLocator
      .registerFactory<BlogRemoteDataSource>(() => BlogRemoteDataSourceImp());

  serviceLocator.registerFactory<BlogRepository>(
      () => BlogRepositoryImp(serviceLocator(), serviceLocator(),serviceLocator()));

  serviceLocator.registerFactory(() => GetBlogs(serviceLocator()));

  serviceLocator.registerFactory<BlogHiveStorage>(() => BlogHiveStrorageImp(serviceLocator()));
  serviceLocator.registerFactory(() => SaveToHive(serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => BlogBloc(serviceLocator(), serviceLocator()));
}
