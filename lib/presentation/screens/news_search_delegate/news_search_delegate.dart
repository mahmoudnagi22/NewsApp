import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/articles_respons/Article.dart';
import 'package:news_app/data/model/articles_respons/ArticlesRespons.dart';
import 'package:news_app/presentation/screens/home/taps/news/article_item_widget.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.green,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ColorsManager.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchArticles(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text(snapshot.error.toString()));
        }
        var articlesResponse = snapshot.data  as ArticlesRespons;
        if (articlesResponse.articles == null || articlesResponse.articles!.isEmpty) {
          return Center(
            child: Text("No resuit found"),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) =>
              ArticleItemWidget(article: articlesResponse.articles![index] as Article),
          itemCount: articlesResponse.articles?.length ?? 0 ,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchArticles(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text(snapshot.error.toString()));
        }
        var articlesResponse = snapshot.data  as ArticlesRespons;
        if (articlesResponse.articles == null || articlesResponse.articles!.isEmpty) {
          return Center(
            child: Text("No resuit found"),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) =>
              ArticleItemWidget(article: articlesResponse.articles![index] as Article),
          itemCount: articlesResponse.articles?.length ?? 0 ,
        );
      },
    );
    //return Container();
  }
}
