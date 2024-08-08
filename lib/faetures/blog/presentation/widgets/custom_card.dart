import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
  final Blog blog;

  const CustomCard({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation:
                10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            shadowColor: Colors.black54,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
              width: double.infinity,
              height: 240,
           child: blog.isOnline? CachedNetworkImage( imageUrl:blog.image_url ,fit: BoxFit.cover,):Image.asset('assets/offline.jpg',fit: BoxFit.cover,),
            ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            blog.title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Author'),
             Text('3 min')
            ],
         
          ),
        
          const Divider(color: Colors.grey, thickness: 0.6),
        ],
      ),
    );
  }
}
