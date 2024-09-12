import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Provider/FireBase/firebase_function.dart';
import '../const.dart';
import 'bottom_nav_bar.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirebaseFunctions>(context, listen: false).getTasks();
    showNavScreen();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: Center(
      child: Image.asset("assets/images/movies.png"),

    ),);
  }
  void showNavScreen()async{
    Timer(const Duration(seconds: 3), () async{
      // await Provider.of<FirebaseFunctions>(context,listen: false).myWatchList;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNavBaScreen()));
    });
  }
}
