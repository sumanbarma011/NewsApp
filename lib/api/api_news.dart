import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/api_news_model.dart';

class ApiNews {
  static String url =
      'https://saurav.tech/NewsAPI/top-headlines/category/health/in.json';
  Future<List<ApiNewsModel>?> fetchNews() async {
    final Uri uri = Uri.parse(url);
      final response = await http.get(uri);
    try {
    
      if (response.statusCode == 200) {
        print('api Called lucy');
        final  responseBody = jsonDecode(response.body)  ;
        final articles=responseBody['articles'] as List;
        print(articles);
        List<ApiNewsModel> data = articles
            .map((e) => ApiNewsModel.fromJson(e as Map<String, dynamic>))
            .toList();
            print(data[0]);
        return data;
      } else {
        throw (Exception);
      }
    } catch (e) {
      print('exception occured $e');
    }
    return null;
  }
}
