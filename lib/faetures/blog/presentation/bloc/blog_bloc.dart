

import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:blog_app/faetures/blog/domain/usecases/get_blogs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final GetBlogs getBlogs;
  BlogBloc(this.getBlogs,) : super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogGetAllBlogs>(_fetchAllBlogs);

  }

  void _fetchAllBlogs(BlogGetAllBlogs event, Emitter<BlogState> emit) async {
    final res = await getBlogs(Noparams());

    res.fold((l) => emit(BlogFailure(error: l.error)),
        (r) => emit(BlogFetchSuccess(blogs: r)));
  }

 
}
