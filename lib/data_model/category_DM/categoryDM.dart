import 'package:flutter/animation.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/constants_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';

class CategoryDM {
  String id;
  String title;
  Color bgColor;
  String imagePath;
  CategoryDM(
      {required this.id,
      required this.title,
      required this.bgColor,
      required this.imagePath});
   static List<CategoryDM> getAllCategory()=> [
    CategoryDM(id: ConstantManager.sportsBackEndId, title: StringsManager.sports, bgColor: ColorsManager.red, imagePath: AssetsManager.sports),
    CategoryDM(id: ConstantManager.generalBackEndId, title: StringsManager.general, bgColor: ColorsManager.darkBlue, imagePath: AssetsManager.general),
    CategoryDM(id: ConstantManager.healthBackEndId, title: StringsManager.health, bgColor: ColorsManager.pink, imagePath: AssetsManager.health),
    CategoryDM(id: ConstantManager.businessBackEndId, title: StringsManager.business, bgColor: ColorsManager.brown, imagePath: AssetsManager.business),
    CategoryDM(id: ConstantManager.entertainmentBackEndId, title: StringsManager.entertainment, bgColor: ColorsManager.blue, imagePath: AssetsManager.entertainment),
    CategoryDM(id: ConstantManager.scienceBackEndId, title: StringsManager.science , bgColor: ColorsManager.yellow, imagePath: AssetsManager.science),
    CategoryDM(id: ConstantManager.technologyBackEndId, title: StringsManager.technology, bgColor: ColorsManager.green, imagePath: AssetsManager.technology),
  ];
 }
