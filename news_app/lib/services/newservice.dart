import 'package:dio/dio.dart';
import 'package:news_app/infra/services/api_client.dart';
import '../models/Productnews.dart';

class NewsProductService {
  ApiClient apiClient = ApiClient();
  Future<List<Newsarticle>> getNewsarticle() async {
    Response response = await apiClient.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=4d5b18ff0d3446b2af35eeb51a29e138');
    print("Response is ");
    print(response.data);
    print(response.data.runtimeType);
    Map<String, dynamic> responseData = response.data;
    List<dynamic> articleList = responseData['articles'];
    List<Newsarticle> articles =
        articleList.map((p) => Newsarticle.fromJSON(p)).toList();
    print(articles);
    return articles;
  }
}
