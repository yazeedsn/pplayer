class Eposide {
  final String title;
  final String enclosuerUrl;
  final String image;

  const Eposide(
      {required this.title, required this.enclosuerUrl, required this.image});

  factory Eposide.fromJson(Map<String, dynamic> data) {
    return Eposide(
        title: data['title'],
        enclosuerUrl: data['enclosureUrl'],
        image: data['image']);
  }
}
