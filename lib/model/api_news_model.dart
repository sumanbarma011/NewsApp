//   -----------------     sir le dinu vako api ko     -------------------------- //
class ApiNewsModel {
  ApiNewsModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;
  factory ApiNewsModel.fromJson(Map<String, dynamic> e) {
    return ApiNewsModel(
        author: e['author'],
        title: e['title'],
        description: e['description'],
        url: e['url'],
        urlToImage: e['urlToImage'],
        publishedAt: DateTime.parse(e['publishedAt']),
        content: e['content']);
  }
}
