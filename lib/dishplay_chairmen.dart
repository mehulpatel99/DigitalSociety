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
    var height,width;
    height=MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(backgroundColor: Colors.blue,title: Text('Digital Society'),leading: Icon(Icons.home),),
       body:  Container(
          color: Colors.indigo,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                height: MediaQuery.of(context).size.height * 0.25,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.sort,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://static.vecteezy.com/system/resources/thumbnails/008/470/176/small/girl-anime-cute-character-cartoon-emotion-illustration-clipart-drawing-kawai-manga-design-art-png.png'))),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Society',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Last update : 2 Aug 2023',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                                // fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  height: height * 0.62,
                  // height: 500,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(Get_MemberData());
                            },
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.40,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              decoration: BoxDecoration(
                                  // image: DecorationImage(image: NetworkImage('https://thumbs.dreamstime.com/b/flat-illustration-society-members-large-group-o-men-women-population-modern-global-network-concept-49822215.jpg')),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 6)
                                  ]),
                              child: Stack(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Lottie.network(
                                        'https://lottie.host/5067ceee-cb0e-404a-aa13-39a41bc3c69d/AAcTaPrkt6.json',
                                        height: 200,
                                        width: 200),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 170, left: 40),
                                    child: Text(
                                      'Member',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(NoticeAdd());
                            },
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.40,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 6)
                                  ]),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 30),
                                    child: Lottie.network(
                                        'https://lottie.host/05742f0e-17ab-413a-9413-3cccc14ad0dc/j7QKTXRKUG.json',
                                        height: 200,
                                        width: 200),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 170, left: 45),
                                    child: Text(
                                      'Notice',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(GetComplain());
                            },
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.40,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 6)
                                  ]),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 30),
                                    child: Lottie.network(
                                        'https://lottie.host/7cafe576-2abc-474d-b7b5-507100884f96/pvbHjUuzhD.json',
                                        height: 200,
                                        width: 200),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 170, left: 45),
                                    child: Text(
                                      'Complain',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(AddEvent());
                            },
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.40,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 6)
                                  ]),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 30),
                                    child: Lottie.network(
                                        'https://lottie.host/1ca5fcfe-39d8-44df-96ca-1f94a63a839b/ue4fl0JIOU.json',
                                        height: 200,
                                        width: 200),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 170, left: 45),
                                    child: Text(
                                      'Event',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   height: 100,
                      //   child: Card(
                      //     elevation: 20,
                      //     child: ListTile(
                      //       onTap: () {
                      //         Get.bottomSheet(Container(
                      //           width: double.maxFinite,
                      //           child: Card(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Lottie.network(
                      //                     'https://lottie.host/fc366057-47df-4464-b3b3-c47bc56fc2a8/BkX41a7RUZ.json',
                      //                     height: 200,
                      //                     width: 200),
                      //                 Text(
                      //                   'Member Detail',
                      //                   style: TextStyle(
                      //                       fontSize: 30,
                      //                       fontWeight: FontWeight.bold),
                      //                 ),
                      //                 Divider(),
                      //                 Text(
                      //                   'Name : ${widget.name} ',
                      //                   style: TextStyle(
                      //                       fontSize: 20,
                      //                       fontWeight: FontWeight.bold),
                      //                 ),
                      //                 Text(
                      //                   'Contact : ${widget.contact}  ',
                      //                   style: TextStyle(
                      //                       fontSize: 20,
                      //                       fontWeight: FontWeight.bold),
                      //                 ),
                      //                 Text(
                      //                   'Housenp. : ${widget.houseno}  ',
                      //                   style: TextStyle(
                      //                       fontSize: 20,
                      //                       fontWeight: FontWeight.bold),
                      //                 ),
                      //                 Text('Email :  ${widget.email} ',
                      //                     style: TextStyle(
                      //                         fontSize: 20,
                      //                         fontWeight: FontWeight.bold)),
                      //               ],
                      //             ),
                      //           ),
                      //         ));
                      //       },
                      //       leading: CircleAvatar(
                      //         backgroundImage: NetworkImage(
                      //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVA_HrQLjkHiJ2Ag5RGuwbFeDKRLfldnDasw&usqp=CAU'),
                      //       ),
                      //       // title: Text(
                      //       //   'Name : ${widget.name}',
                      //       //   style: TextStyle(
                      //       //       fontSize: 20, fontWeight: FontWeight.bold),
                      //       // ),
                      //       // subtitle: Text(
                      //       //   'Houseno : ${widget.houseno}',
                      //       //   style: TextStyle(
                      //       //       fontSize: 15, fontWeight: FontWeight.w500),
                      //       // ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ))
            ],
          )), 
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       height: 200,
      //       width: 400,
      //       // color: Colors.white,
      //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),gradient: LinearGradient(colors: [Colors.pink,Colors.green,Colors.white],begin: Alignment.topRight,end: Alignment.bottomRight)),
      //     child: Lottie.network('https://lottie.host/4fc6ba73-645f-49ea-bd3f-d2a8917ad671/SMSvzyzhMZ.json'),
      //     ),
      //     SizedBox(height: 10,),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //       GestureDetector(
      //         onTap: (){
      //           Get.to(Get_MemberData());
      //         },
      //         child: Container(
      //           height: 200,
      //           width: 200,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://thumbs.dreamstime.com/b/flat-illustration-society-members-large-group-o-men-women-population-modern-global-network-concept-49822215.jpg'))),
      //             child: Column(
      //               children: [
      //                 SizedBox(height: 170,),
      //                 Card(child: Text('  Members  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
      //               ],
      //             ),
      //         ),
      //       ),
            
      //        GestureDetector(
      //         onTap: (){
      //           Get.to(NoticeAdd());
      //         },
      //         child: Container(
      //           height: 200,
      //           width: 200,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://img.freepik.com/free-photo/reminder-popup-bell-notification-alert-alarm-icon-sign-symbol-application-website-ui-purple-background-3d-rendering-illustration_56104-1304.jpg'),fit: BoxFit.fill)),
      //             child: Column(
      //               children: [
      //                 SizedBox(height: 100,),
      //                 Text('Notice',style: TextStyle(color: Colors.black),),
      //                 SizedBox(height: 50,),
      //                 Card(child: Text('  Notice  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
      //               ],
      //             ),
      //         ),
      //       ),
      //     ],),
      //     SizedBox(height: 20,),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //       GestureDetector(
      //         onTap: (){
      //           Get.to(GetComplain());
      //         },
      //         child: Container(
      //           height: 200,
      //           width: 200,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://www.shutterstock.com/image-vector/furious-boss-megaphone-head-shouting-260nw-2184942351.jpg'),fit: BoxFit.fill)),
      //             child: Column(
      //               children: [
      //                 SizedBox(height: 170,),
      //                 Card(child: Text('  Complaints  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
      //               ],
      //             ),
      //         ),
      //       ),
            
      //        GestureDetector(
      //         onTap: (){
      //           Get.to(AddEvent());
      //         },
      //         child: Container(
      //           height: 200,
      //           width: 200,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image:DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/978975308/vector/upcoming-events-neon-signs-vector-upcoming-events-design-template-neon-sign-light-banner-neon.jpg?s=612x612&w=0&k=20&c=VMCoJJda9L17HVkFOFB3fyDpjC4Qu2AsyYn3u4T4F4c='),fit: BoxFit.fill)),
      //             child: Column(
      //               children: [
      //                 SizedBox(height: 170,),
      //                 Card(child: Text('  Events  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
      //               ],
      //             ),
      //         ),
      //       ),
      //     ],)
      // ],),
    );
  }
}