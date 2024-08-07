import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/core/utils/snack_bar.dart';
import 'package:blog_app/faetures/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/faetures/blog/presentation/pages/blog_details.dart';
import 'package:blog_app/faetures/blog/presentation/widgets/custom_card.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const BlogPage());
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {


  @override
  void initState() {
    context.read<BlogBloc>().add(BlogGetAllBlogs());

    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Top Stories',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 42),
              ),
              const Divider(color: Colors.grey, thickness: 0.6),
              Expanded(
                child: BlocConsumer<BlogBloc, BlogState>(
                  listener: (context, state) {
                    if (state is BlogFailure) {
                      return showSnackBar(context, state.error);
                    } else if (state is BlogSaveSuccess) {
                      return showSnackBar(context, 'success');
                    }
                  },
                  builder: (context, state) {
                    if (state is BlogLoading) {
                      return const Loader();
                    }
                    if (state is BlogFetchSuccess) {
                      return ListView.builder(
                          itemCount: state.blogs.length,
                          itemBuilder: (context, index) {
                            final blog = state.blogs[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        BlogDetails(blog: blog)));
                              },
                              child: CustomCard(
                                blog: blog,
                              ),
                            );
                          });
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
