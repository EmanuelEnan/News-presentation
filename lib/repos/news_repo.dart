import 'dart:convert';

import 'package:bloc_3/constants.dart';
import 'package:bloc_3/models/news.dart';

import 'package:http/http.dart' as http;

class NewsRepo {
  final String url =
      '${Constants.baseUrl}?country=us&category=business&apiKey=${Constants.apiKey}';

  Future<List<News>> getNews() async {
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      final newsBody = '[${response.body}]';

      print(newsBody);

      List newsRaw = (jsonDecode(newsBody) as List<dynamic>);
      return newsRaw.map((json) => News.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
