import 'dart:convert';

import 'package:digitalsociety/member_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Get_MemberData extends StatefulWidget {
  const Get_MemberData({super.key});

  @override
  State<Get_MemberData> createState() => _Get_MemberDataState();
}

class _Get_MemberDataState extends State<Get_MemberData> {
  Future<List<membermodel>> myget() async {
    final response = await http.get(
        Uri.parse('https://unmusical-boil.000webhostapp.com/getmember2.php'));
    List jsonresponse = jsonDecode(response.body);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print('Succesfully getdata');
      return jsonresponse.map((data) => membermodel.fromjson(data)).toList();
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<void> mydelete(String id) async {
    final response = await http.post(
        Uri.parse('https://unmusical-boil.000webhostapp.com/deletemember.php'),
        body: {
          'id': id,
        });

    if (response.statusCode == 200) {
      membermodel.fromjson(jsonDecode(response.body));

      Navigator.push(
          context, MaterialPageRoute(builder: (Context) => Get_MemberData()));
    } else {
      throw Exception("something went wrong ");
    }
  }

  late Future<List<membermodel>> futuredata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futuredata = myget();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.lightBlue,Colors.blueGrey,Colors.greenAccent],begin: Alignment.topLeft,end: Alignment.bottomRight
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        
        appBar: AppBar(
          title: Text('Society Members'),
          backgroundColor: Colors.transparent,
          
        ),
        body: FutureBuilder(
            future: futuredata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<membermodel> mylist = snapshot.data!;
                return ListView.builder(
                    itemCount: mylist.length,
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     mainAxisSpacing: 20,
                    //     crossAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
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
                                     Text('Name : ${mylist[index].name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text('Contact : ${mylist[index].contact}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                   Text('Housenp. : ${mylist[index].houseno}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text('Email : ${mylist[index].email}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                  Text('Pass : ${mylist[index].pass}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                  
                                ],),
                              ),
                            ));
                          },
                          leading:  CircleAvatar(
                                  radius: 20,
                                  child: Icon(Icons.person,size: 30,),),
                                  title: Text('${mylist[index].name}'),
                                  subtitle: Text('Houseno.${mylist[index].houseno}'),
                                  trailing: Wrap(children: [
                                   
                                    IconButton(onPressed: (){
                                      setState(() {
                                         mydelete(mylist[index].id!);
                                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Get_MemberData()));
                                      });
                                     
                                    }, icon: Icon(Icons.delete,color: Colors.red,))
                                  ],),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                Text('Error');
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
