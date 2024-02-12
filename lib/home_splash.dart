import 'dart:async';

import 'package:digitalsociety/member_reg.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {

MySplashchange()async{
  await Future.delayed(Duration(seconds: 7),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Register_Screen()));
  });
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    MySplashchange();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Lottie.network('https://lottie.host/63681d70-84a9-4717-a731-ec834fc6ab67/pOsSLJUOfl.json'),
    ],);
  }
}