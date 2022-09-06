class Podcast {
  final int? id;
  final String? title;
  final String? author;
  final String? image;

  Podcast({
    this.id,
    this.title,
    this.author,
    this.image,
  });

  factory Podcast.fromJson(Map<String, dynamic> data) {
    return Podcast(
      id: data['id'],
      title: data['title'],
      author: data['author'],
      image: data['artwork'],
    );
  }
}
