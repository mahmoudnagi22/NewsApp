import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';

class SourceItemWidget extends StatelessWidget {
  SourceItemWidget({super.key, required this.source, required this.isSelected});
  Source source;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
margin:        REdgeInsets.symmetric(vertical: 8),
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
         color: isSelected ? ColorsManager.green : Colors.transparent,
      borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
            color:  ColorsManager.green , width: 2 ),
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: isSelected ? ColorsManager.white : ColorsManager.green),
      ),
    );
  }
}
