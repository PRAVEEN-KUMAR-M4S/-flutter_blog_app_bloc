import 'package:blog_app/core/common/widgets/constanrs.dart';
import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class BlogDetails extends StatelessWidget {
  final Blog blog;
  const BlogDetails({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10,top: 10),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20.0, 
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 280,
           child: blog.isOnline? CachedNetworkImage( imageUrl:blog.image_url ,fit: BoxFit.cover,):Image.asset('assets/offline.jpg',fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    blog.title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LikeButton(
                          likeCount: 99,
                          countPostion: CountPostion.bottom,
                         ),
                      Column(
                        children: [
                         
                          Text('AuthorName',style:TextStyle(fontWeight: FontWeight.bold)),
                           Text('3 min'),
                        ],
                      )
                    ],
                  ),
                 
                   
                      const SizedBox(height: 10),
                  const Divider(color: Colors.grey, thickness: 0.6),
                    const Text(Constants.blogData,style: TextStyle(fontSize: 16,height: 2,fontWeight: FontWeight.w400,color: Colors.black54),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
