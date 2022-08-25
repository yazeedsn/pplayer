class Podcast {
  final String? title;
  final String? author;
  final String? image;

  Podcast({
    this.title,
    this.author,
    this.image,
  });

  factory Podcast.fromJson(Map<String, dynamic> json) {
    var data = json;

    return Podcast(
      title: data['title'],
      author: data['author'],
      image: data['artwork'],
    );
  }
}
