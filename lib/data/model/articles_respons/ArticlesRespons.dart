import 'Article.dart';

class ArticlesRespons {
  ArticlesRespons({
      this.status, 
      this.code,
      this.massage,
      this.totalResults,
      this.articles,});

  ArticlesRespons.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    massage = json['massage'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }
  String? status;
  String? code;
  String? massage;
  num? totalResults;
  List<Article>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}