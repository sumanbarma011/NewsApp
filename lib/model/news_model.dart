import 'package:intl/intl.dart';

final date = DateFormat('EEE, d MMM yyyy');

class NewsModel {
  const NewsModel(
      {required this.author,
      required this.newsTitle,
      required this.publishedDate,
       this.category,
      required this.newsHighlight,
      required this.otherNews,
      required this.newsImage,
      required this.authorProfile});
  final String author;
  final String newsTitle;
  final DateTime publishedDate;
  final Category? category;
  final String newsHighlight;
  final String otherNews;
  final String newsImage;
  final String authorProfile;
  String get intlFormatedDate {
    return date.format(publishedDate);
  }

  String get getCategoryName {
    return ("${category?.name[0].toUpperCase()}${category?.name.substring(1).toLowerCase()}");
  }
}

enum Category { sport, public, health, environment }
