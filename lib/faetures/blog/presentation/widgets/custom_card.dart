import 'package:blog_app/faetures/blog/domain/entities/blog.dart';
import 'package:blog_app/faetures/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                10.0, // Increase the elevation for a more prominent shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            shadowColor: Colors.black54,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(blog.image_url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            blog.title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Author'),
              IconButton(
                  onPressed: () {
                    context.read<BlogBloc>().add(SaveBloges(
                        id: blog.id,
                        image_url: blog.image_url,
                        title: blog.title));
                  },
                  icon: Icon(Icons.book_outlined))
            ],
          ),
          const Divider(color: Colors.grey, thickness: 0.6),
        ],
      ),
    );
  }
}
