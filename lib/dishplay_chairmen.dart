import 'package:digitalsociety/Events/addevent.dart';
import 'package:digitalsociety/Notice/getnotice.dart';
import 'package:digitalsociety/Notice/noticeadd.dart';
import 'package:digitalsociety/complaint/getcomplain.dart';
import 'package:digitalsociety/get_members.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DishplayChairmen extends StatefulWidget {
  const DishplayChairmen({super.key});

  @override
  State<DishplayChairmen> createState() => _DishplayChairmenState();
}

class _DishplayChairmenState extends State<DishplayChairmen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(backgroundColor: Colors.blue,title: Text('Digital Society'),leading: Icon(Icons.home),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 400,
            // color: Colors.white,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),gradient: LinearGradient(colors: [Colors.pink,Colors.green,Colors.white],begin: Alignment.topRight,end: Alignment.bottomRight)),
          child: Lottie.network('https://lottie.host/4fc6ba73-645f-49ea-bd3f-d2a8917ad671/SMSvzyzhMZ.json'),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(
              onTap: (){
                Get.to(Get_MemberData());
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://thumbs.dreamstime.com/b/flat-illustration-society-members-large-group-o-men-women-population-modern-global-network-concept-49822215.jpg'))),
                  child: Column(
                    children: [
                      SizedBox(height: 170,),
                      Card(child: Text('  Members  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    ],
                  ),
              ),
            ),
            
             GestureDetector(
              onTap: (){
                Get.to(NoticeAdd());
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://img.freepik.com/free-photo/reminder-popup-bell-notification-alert-alarm-icon-sign-symbol-application-website-ui-purple-background-3d-rendering-illustration_56104-1304.jpg'),fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      SizedBox(height: 100,),
                      Text('Notice',style: TextStyle(color: Colors.black),),
                      SizedBox(height: 50,),
                      Card(child: Text('  Notice  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    ],
                  ),
              ),
            ),
          ],),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(
              onTap: (){
                Get.to(GetComplain());
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://www.shutterstock.com/image-vector/furious-boss-megaphone-head-shouting-260nw-2184942351.jpg'),fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      SizedBox(height: 170,),
                      Card(child: Text('  Complaints  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    ],
                  ),
              ),
            ),
            
             GestureDetector(
              onTap: (){
                Get.to(AddEvent());
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/978975308/vector/upcoming-events-neon-signs-vector-upcoming-events-design-template-neon-sign-light-banner-neon.jpg?s=612x612&w=0&k=20&c=VMCoJJda9L17HVkFOFB3fyDpjC4Qu2AsyYn3u4T4F4c='),fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      SizedBox(height: 170,),
                      Card(child: Text('  Events  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    ],
                  ),
              ),
            ),
          ],)
      ],),
    );
  }
}