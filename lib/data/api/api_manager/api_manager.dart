import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/model/articles_respons/ArticlesRespons.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';
//https://newsapi.org/v2/top-headlines/sources?apiKey=2ac1e4157e5d4456914c90feec0d5dae
class ApiManager{

   static const String _baseUrl = "newsapi.org";
   static const String _sourcesEndPoint = "/v2/top-headlines/sources";
   static const String _articleEndPoint = "/v2/everything";
   static const String _apiKay = "2ac1e4157e5d4456914c90feec0d5dae";
   static Future<SourcesResponse> getSources(String categoryId)async{
      Uri url =Uri.https(
         _baseUrl,
         _sourcesEndPoint,
         {
            "apiKey" : _apiKay,
            "category" : categoryId,
         }
      );
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse ;
   }


   static Future<ArticlesRespons> getArticles(String sourceId) async{
     Uri url =Uri.https(
       _baseUrl,
       _articleEndPoint,
       {
         "apiKey" : _apiKay,
         "sources" : sourceId,
       }
     );
     http.Response serverResponse = await http.get(url);
     var json = jsonDecode(serverResponse.body);
     ArticlesRespons articlesRespons = ArticlesRespons.fromJson(json);
     return articlesRespons ;
   }
   static Future<ArticlesRespons> searchArticles(String query ) async{
     Uri url =Uri.https(
       _baseUrl,
       _articleEndPoint,
       {
         "apiKey" : _apiKay,
         "q" : query,
       }
     );
     http.Response serverResponse = await http.get(url);
     var json = jsonDecode(serverResponse.body);
     ArticlesRespons articlesRespons = ArticlesRespons.fromJson(json);
     return articlesRespons ;
   }
}