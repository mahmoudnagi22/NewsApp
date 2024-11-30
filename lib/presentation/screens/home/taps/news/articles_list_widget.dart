import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/articles_respons/Article.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/taps/news/article_item_widget.dart';

class ArticlesListWidget extends StatelessWidget {
   ArticlesListWidget({super.key , required this.sources});
  Source sources;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getArticles(sources.id ?? ""),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.data?.status == "error" || snapshot.hasError){
            return Text(snapshot.data?.massage ?? "Check internet conection");
          }
          List<Article>  articles = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) => ArticleItemWidget(article: articles[index]),
              itemCount: articles.length,
            ),
          );
        },);
  }
}
