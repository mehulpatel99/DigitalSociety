import 'package:digitalsociety/Events/addevent.dart';
import 'package:digitalsociety/Events/getevent.dart';
import 'package:digitalsociety/Notice/getnotice.dart';
import 'package:digitalsociety/Notice/noticeadd.dart';
import 'package:digitalsociety/chairman.dart';
import 'package:digitalsociety/complaint/addcomplain.dart';
import 'package:digitalsociety/dishplay_chairmen.dart';
import 'package:digitalsociety/dishplay_member.dart';
import 'package:digitalsociety/get_members.dart';
import 'package:digitalsociety/home_splash.dart';
import 'package:digitalsociety/member_login.dart';
// import 'package:digitalsociety/home.dart';
import 'package:digitalsociety/member_reg.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'complaint/getcomplain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MySplash(),
    );
  }
}
