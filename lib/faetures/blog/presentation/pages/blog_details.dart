import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

class BlogDetails extends StatelessWidget {
  final Blog blog;
  const BlogDetails({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10,top: 10),
          child: CircleAvatar(
         
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 20.0, 
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(blog.image_url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  blog.title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Author'),
                    Text('3 min')
                  ],
                ),
                SizedBox(height: 10),
                const Divider(color: Colors.grey, thickness: 0.6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
