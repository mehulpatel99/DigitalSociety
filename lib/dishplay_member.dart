import 'package:digitalsociety/Events/addevent.dart';
import 'package:digitalsociety/Events/getevent.dart';
import 'package:digitalsociety/Notice/getnotice.dart';
import 'package:digitalsociety/complaint/addcomplain.dart';
import 'package:digitalsociety/get_members.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class DishplayMember extends StatefulWidget {
  String? id;
  String? name;
  String? houseno;
  String? contact;
  String? email;
   DishplayMember({required this.id,required this.name,required this.houseno,required this.contact,required this.email});
    // const DishplayMember({super.key});

  @override
  State<DishplayMember> createState() => _DishplayMemberState();
}

class _DishplayMemberState extends State<DishplayMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Society'),
        leading: Icon(Icons.home),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 400,
            // color: Colors.white,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),gradient: LinearGradient(colors: [Colors.pink,Colors.green,Colors.white],begin: Alignment.topRight,end: Alignment.bottomRight)),
          child: Column(
            children: [
                Lottie.network('https://lottie.host/a52975f5-e68a-438a-9cc9-3627eb620773/F7EIpWqJSD.json',height: 200,width: 400),
              
             
            ],
          ),
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
                // height: MediaQuery.of(context).size.height*.3,
                // width: MediaQuery.of(context).size.width*.5,
                 height: 220,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://thumbs.dreamstime.com/b/flat-illustration-society-members-large-group-o-men-women-population-modern-global-network-concept-49822215.jpg'),fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      SizedBox(height: 185,),
                      Card(child: Text('  Members  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    ],
                  ),
              ),
            ),
            
             GestureDetector(
              onTap: (){
                Get.to(GetNotice());
              },
              child: Container(
              height: 220,
                width: 200,
                // height: MediaQuery.of(context).size.height*.3,
                // width: MediaQuery.of(context).size.width*.5,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://img.freepik.com/free-photo/reminder-popup-bell-notification-alert-alarm-icon-sign-symbol-application-website-ui-purple-background-3d-rendering-illustration_56104-1304.jpg'),fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      SizedBox(height: 115,),
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
                Get.to(addcomplain());
              },
              child: Container(
               height: 220,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://www.shutterstock.com/image-vector/furious-boss-megaphone-head-shouting-260nw-2184942351.jpg'),fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      SizedBox(height: 185,),
                      Card(child: Text('  Complaints  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    ],
                  ),
              ),
            ),
            
             GestureDetector(
              onTap: (){
                Get.to(GetEvent());
              },
              child: Container(
               height: 220,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/978975308/vector/upcoming-events-neon-signs-vector-upcoming-events-design-template-neon-sign-light-banner-neon.jpg?s=612x612&w=0&k=20&c=VMCoJJda9L17HVkFOFB3fyDpjC4Qu2AsyYn3u4T4F4c='),fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      SizedBox(height: 185,),
                      Card(child: Text('  Events  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    ],
                  ),
              ),
            ),
          ],),
          SizedBox(height: 10,),
          Container(
            height: 100,
            

                child: Card(
                  elevation: 20,
                  child: ListTile(
                    onTap: (){
                      Get.bottomSheet(Container(
                              width: double.maxFinite,
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.network('https://lottie.host/fc366057-47df-4464-b3b3-c47bc56fc2a8/BkX41a7RUZ.json',height: 200,width: 200),
                                    Text('Member Detail',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                                    Divider(),
                                     Text('Name : ${widget.name} ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text('Contact : ${widget.contact}  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                   Text('Housenp. : ${widget.houseno}  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text('Email :  ${widget.email} ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                
                                  
                                ],),
                              ),
                            ));
                    },
                    leading: CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVA_HrQLjkHiJ2Ag5RGuwbFeDKRLfldnDasw&usqp=CAU'),),
                    title: Text('Name : mehul',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    subtitle: Text('Houseno : A-5',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                  ),
                ),
              ),
      ],), 
      
    );
  }
}