import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/data_model/category_DM/categoryDM.dart';

class CategorieWidget extends StatelessWidget {
  CategoryDM  categoryDM;
  int index;
   CategorieWidget({super.key , required this.categoryDM , required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(

     decoration:  BoxDecoration(
       color: categoryDM.bgColor,
       borderRadius: BorderRadius.only(
         topLeft: Radius.circular(25.r),
         topRight: Radius.circular(25.r),
         bottomLeft : Radius.circular(index.isEven ? 25.r : 0),
       bottomRight: Radius.circular(index.isEven ? 0 : 25.r),
       ),
     ),
      child: Column(
        children: [
          Image.asset(categoryDM.imagePath ,height: 140.h, width: 250.w,),
          Text(categoryDM.title , style:  AppStyle.categoryTitle,)
        ],
      ),
    );
  }
}
