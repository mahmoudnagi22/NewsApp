import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/data_model/category_DM/categoryDM.dart';
import 'package:news_app/presentation/screens/home/taps/categories_tab/categorie_widget/categorie_widget.dart';

typedef OnCategoryItemClicked = void Function(CategoryDM);

class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key, required this.onCategoryItemClicked});
  OnCategoryItemClicked onCategoryItemClicked;
  List<CategoryDM> categoriesList = CategoryDM.getAllCategory();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            StringsManager.pickCategory,
            style: AppStyle.pickCategory,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 20.h,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryItemClicked(categoriesList[index]);
                  },
                  child: CategorieWidget(
                      categoryDM: categoriesList[index], index: index)),
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
