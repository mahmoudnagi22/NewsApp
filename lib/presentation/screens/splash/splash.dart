
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, RouteManager.home);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white,
            child: Image.asset(AssetsManager.pattern , fit: BoxFit.cover, width:  double.infinity, height: double.infinity ,)),
        Center(child: Image.asset(AssetsManager.routeImage ,height:199.w ,width: 208.h ,)),
      ],
    );
  }
}
