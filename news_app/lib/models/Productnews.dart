class Newsarticle {
  late String title;
  late String name;
  late String urlToImage;
  Newsarticle({
    required this.title,
    required this.urlToImage,
    required this.name,
  });

  static Newsarticle fromJSON(dynamic map) {
    return Newsarticle(
      title: map['title'] ?? ' ',
      urlToImage: map['urlToImage'] ??
          'http://www.nftitalia.com/wp-content/uploads/2017/07/news-1-1600x429.jpg',
      name: map['name'] ?? ' ',
    );
  }
}
