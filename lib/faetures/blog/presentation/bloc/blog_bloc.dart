import 'dart:io';

import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:blog_app/faetures/blog/domain/usecases/get_blogs.dart';
import 'package:blog_app/faetures/blog/domain/usecases/save_to_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final GetBlogs getBlogs;
  final SaveToHive saveToHive;
  BlogBloc(this.getBlogs, this.saveToHive) : super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogGetAllBlogs>(_fetchAllBlogs);
    on<SaveBloges>(_saveBlogs);
  }

  void _fetchAllBlogs(BlogGetAllBlogs event, Emitter<BlogState> emit) async {
    final res = await getBlogs(Noparams());

    res.fold((l) => emit(BlogFailure(error: l.error)),
        (r) => emit(BlogFetchSuccess(blogs: r)));
  }

  void _saveBlogs(SaveBloges event, Emitter<BlogState> emit) async {
    final res = await saveToHive(BlogParams(
        id: event.id, image_url: event.image_url, title: event.title));

    res.fold((l) => emit(BlogFailure(error: l.error)),
        (r) => emit(BlogSaveSuccess()));
  }
}
