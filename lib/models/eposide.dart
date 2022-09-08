class Eposide {
  final int id;
  final String title;
  final String enclosuerUrl;
  final String image;

  const Eposide(
      {required this.id,
      required this.title,
      required this.enclosuerUrl,
      required this.image});

  factory Eposide.fromJson(Map<String, dynamic> data) {
    return Eposide(
        id: data['id'],
        title: data['title'],
        enclosuerUrl: data['enclosureUrl'],
        image: data['image']);
  }
}
