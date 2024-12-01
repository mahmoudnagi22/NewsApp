import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/data_model/category_DM/categoryDM.dart';
import 'package:news_app/presentation/screens/home/taps/category_details/widget/sources_widget/sources_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryDM});
  CategoryDM categoryDM;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryDM.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.data?.status == "error" || snapshot.hasError){
          return Text(snapshot.data?.massage ?? snapshot.error.toString());
        }
        List<Source> sources = snapshot.data?.sources?? [];
        return SourcesWidget(sources: sources);
      },
    );
  }
}
