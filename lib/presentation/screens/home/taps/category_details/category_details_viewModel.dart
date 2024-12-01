import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';

class CategoryDetailsViewmodel extends ChangeNotifier{
  List<Source>? sources;
  String? errorMessage;
  bool isLoading = false;

  void getSourcesByCategoryId(String categoryId)async{
  try{
    isLoading = true;
    notifyListeners();
    var response = await  ApiManager.getSources(categoryId);
    isLoading = false;
    if(response.status == 'ok'){
      sources = response.sources;
    }
    else{
      errorMessage = response.massage;
    }
    notifyListeners();
  }catch(e){
    isLoading = false;
    errorMessage=e.toString();
    notifyListeners();
  }
  }

}