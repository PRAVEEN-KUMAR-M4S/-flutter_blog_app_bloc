import 'package:blog_app/faetures/blog/data/models/blog_model.dart';
import 'package:hive/hive.dart';

abstract interface class BlogHiveStorage {
  void uploadLocalBlogs({required List<BlogModel> blogs});
  List<BlogModel> loadBlogs();
}

class BlogHiveStrorageImp implements BlogHiveStorage {
  final Box box;

  BlogHiveStrorageImp(this.box);

  @override
  List<BlogModel> loadBlogs() {
    List<BlogModel> blogs = [];
    box.read(() {
      for (int i = 0; i < box.length; i++) {
        blogs.add(BlogModel.fromMap(box.get(i.toString())));
      }
    });
    return blogs;
  }

  @override
  void uploadLocalBlogs({required List<BlogModel> blogs}) {
    box.clear();
    box.write(() {
      for (int i = 0; i < blogs.length; i++) {
        box.put(i.toString(), blogs[i].toMap());
      }
    });
  }
}
