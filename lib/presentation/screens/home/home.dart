
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/data_model/category_DM/categoryDM.dart';
import 'package:news_app/presentation/screens/home/taps/categories_tab/categories_tab.dart';
import 'package:news_app/presentation/screens/home/taps/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/taps/settings_tap/settings_tab.dart';
import 'package:news_app/presentation/screens/home/home_drawer/home_drawer.dart';
import 'package:news_app/presentation/screens/news_search_delegate/news_search_delegate.dart';

class Home extends StatefulWidget {
 const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   late Widget selectedWidget ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTab( onCategoryItemClicked: onCategoryItemClicked ,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(image: AssetImage(AssetsManager.pattern ),),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringsManager.appTitle),
          actions: [IconButton(onPressed: () {
            showSearch(context: context, delegate: NewsSearchDelegate());
          }, icon: Icon(Icons.search , size:  32,))],
        ),
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }
  void onCategoryItemClicked( CategoryDM category ){
    selectedWidget = CategoryDetails(categoryDM: category,);
    setState(() {

    });
  }
  onDrawerItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoriesTab(onCategoryItemClicked:  onCategoryItemClicked,);
        }
      case MenuItem.settings:
        {
          selectedWidget = SettingsTab();
        }
    }
    Navigator.pop(context);
    setState(() {

    });
  }
}
