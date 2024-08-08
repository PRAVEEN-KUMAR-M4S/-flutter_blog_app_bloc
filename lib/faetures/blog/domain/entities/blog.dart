

class Blog {
  final String id;
  final String image_url;
  final String title;
  final bool isOnline;

  Blog({
    required this.id,
    required this.image_url,
    required this.title,
    this.isOnline=false,
  });


}
