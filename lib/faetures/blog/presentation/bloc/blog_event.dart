part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class UploadBlogEvent extends BlogEvent {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;
  final int color;

  UploadBlogEvent(
      {required this.posterId,
      required this.title,
      required this.content,
      required this.image,
      required this.topics,required this.color});
}

final class SaveBloges extends BlogEvent{
   final String id;
  final String image_url;
  final String title;

  SaveBloges({required this.id, required this.image_url, required this.title});
}


final class BlogGetAllBlogs extends BlogEvent{}
