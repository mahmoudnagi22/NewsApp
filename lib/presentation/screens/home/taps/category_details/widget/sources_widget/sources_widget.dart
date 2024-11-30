import 'package:flutter/material.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/taps/category_details/widget/sources_widget/source_item_widget.dart';
import 'package:news_app/presentation/screens/home/taps/news/articles_list_widget.dart';

class SourcesWidget extends StatefulWidget {
   SourcesWidget({super.key , required this.sources});
 List<Source> sources ;

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
 int selectedindex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            labelPadding: EdgeInsets.all(10),
            tabAlignment: TabAlignment.start,
            onTap: (index){
              selectedindex = index;
              setState(() {

              });

            },
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            isScrollable: true ,
            tabs: widget.sources.map((source) => SourceItemWidget(source: source ,isSelected:  widget.sources.indexOf(source) == selectedindex,) ,).toList(),
          ),
        ),
        ArticlesListWidget( sources:  widget.sources[selectedindex]),
      ],
    );
  }
}
