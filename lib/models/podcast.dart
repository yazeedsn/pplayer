class Podcast {
  final int id;
  final String title;
  final String author;
  final String image;
  final String description;

  Podcast(
      {required this.id,
      required this.title,
      required this.author,
      required this.image,
      required this.description});

  factory Podcast.fromJson(Map<String, dynamic> data) {
    return Podcast(
        id: data['id'],
        title: data['title'],
        author: data['author'],
        image: data['artwork'],
        description: data['description']);
  }
}
