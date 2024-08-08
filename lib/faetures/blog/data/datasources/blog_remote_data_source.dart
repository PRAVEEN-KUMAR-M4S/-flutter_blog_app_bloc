import 'dart:convert';
import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/secrets/keys.dart';
import 'package:blog_app/faetures/blog/data/models/blog_model.dart';
import 'package:http/http.dart' as http;

abstract interface class BlogRemoteDataSource {
  Future<List<BlogModel>> getAllBlogs();
}

class BlogRemoteDataSourceImp implements BlogRemoteDataSource {
  @override
  Future<List<BlogModel>> getAllBlogs() async {

    try {
      final response = await http.get(Uri.parse(Keys.apiKey), headers: {
        'x-hasura-admin-secret': Keys.adminSecret,
      });

      var responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        List<BlogModel> blogs = [];
        for (var blog in responseData['blogs']) {
          BlogModel item = BlogModel.fromMap(blog).copyWith(isOnline: true);
    
          blogs.add(item);
        }

        return blogs;
      } else {
        throw FailureExp(
            message: 'Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw FailureExp(message: e.toString());
    }
  }
}
