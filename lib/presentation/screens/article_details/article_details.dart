import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/model/articles_respons/Article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleDetails extends StatelessWidget {
   ArticleDetails({super.key});
   Uri  _url = Uri.parse('https://flutter.dev');
  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)?.settings.arguments as Article ;
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(image: AssetImage(AssetsManager.pattern ),),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(article.title ?? ""),
        ),
        body: Padding(
          padding:  REdgeInsets.symmetric(vertical: 20.0 ,horizontal:  5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Image.network(article.urlToImage ?? ""),
              ),
              Text(article.source?.name ?? "" , style: GoogleFonts.poppins(fontSize: 10.sp , fontWeight: FontWeight.w400 , color:  Color(0xFF79828B)),),
              SizedBox(height:  4.h,),
              Text(article.description ?? "" , style: GoogleFonts.poppins(fontSize: 14.sp , fontWeight: FontWeight.w500 , color:  Color(0xFF42505C) ,),),
              SizedBox(height:  4.h,),
              Text(article.publishedAt ?? "" , textAlign:  TextAlign.end,style: GoogleFonts.inter(fontSize: 13.sp , fontWeight: FontWeight.w400 , color:  Color(0xFFA3A3A3),),),
              SizedBox(height:  4.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(article.content ?? "" , textAlign:  TextAlign.start,style: GoogleFonts.inter(fontSize: 13.sp , fontWeight: FontWeight.w400 , color:  Color(0xFF42505C),),),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: ()async{
                  String  url =  article.url ?? 'https://flutter.dev' ;
                  if (await canLaunchUrlString(url)) {
                    launchUrlString(url , mode: LaunchMode.externalApplication);
                  }
                }, child: Text( 'View Full Article'  , style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp,color: const Color(0xff42505C)),), ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
