import 'dart:convert';
import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/faetures/blog/data/models/blog_model.dart';
import 'package:http/http.dart' as http;

abstract interface class BlogRemoteDataSource {
  Future<List<BlogModel>> getAllBlogs();

}

class BlogRemoteDataSourceImp implements BlogRemoteDataSource {


  @override
  Future<List<BlogModel>> getAllBlogs() async {
   
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
     
        final response = await http.get(Uri.parse(url), headers: {
          'x-hasura-admin-secret': adminSecret,
        });

        var responseData = json.decode(response.body);

        if (response.statusCode == 200) {
          List<BlogModel> blogs = [];
          for (var blog in responseData['blogs']) {
            BlogModel item = BlogModel.fromMap(blog);
            blogs.add(item);
          }

          return blogs;
        } else {
          throw FailureExp(
              message:
                  'Request failed with status code: ${response.statusCode}');
        }
       
      
    } catch (e) {
      throw FailureExp(message: e.toString());
    }
  }

  
}
