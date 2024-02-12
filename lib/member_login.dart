import 'dart:convert';

import 'package:digitalsociety/dishplay_member.dart';
import 'package:digitalsociety/get_members.dart';
import 'package:digitalsociety/member_models.dart';
import 'package:digitalsociety/new_homeScreen/new_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Member_login extends StatefulWidget {
  const Member_login({super.key});

  @override
  State<Member_login> createState() => _Member_loginState();
}

bool pas = false;
TextEditingController emailmember = TextEditingController();
TextEditingController passmember = TextEditingController();
class _Member_loginState extends State<Member_login> {

  Future<void> memberlogin(String email,pass)async{
    try {
      final response = await http.post(Uri.parse('https://unmusical-boil.000webhostapp.com/loginmember.php'),
    body: {
      'email':email,
      'pass':pass,
    }
    );
    if(response.statusCode==200){
      var data = jsonDecode(response.body.toString());
      print(data);
      String? id= data[0]['id'];
      String? name = data[0]['name'];
      String? houseno = data[0]['houseno'];
      String? contact = data[0]['contact'];
      String? email = data[0]['email'];
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>NewHome(id: id, name: name,houseno: houseno,contact: contact,email: email,)));
      Get.snackbar('$name', 'Houseno : $houseno');
    }else{
      // throw Exception('something went wrong');
       Get.snackbar('inavalid', 'Something wrong');
      
    }
    } catch (e) {
       Get.snackbar('inavalid', 'Something wrong');
      print(e.toString());
    }
  }

  
  
  
  var formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      
      //  Form(
      //   key: formkey2,
      //   child: Center(
      //     child: Container(
      //       height: 600,
      //       width: 300,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           SizedBox(
      //             height: 200,
      //             child: Lottie.network('https://lottie.host/45971861-e61b-4998-a93c-783fb2bd4eb3/tZ0VWVZHTt.json')),
      //             SizedBox(height: 10,),
      //           TextFormField(
      //             controller: emailmember,
      //             validator: (value){
      //               if(value!.isEmpty){
      //                   return 'required this field';
      //               }null;
      //             },
      //             decoration: InputDecoration(prefixIcon: Icon(Icons.email),label: Text('Email'),hintText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      //           ),
      //           SizedBox(height: 15,),
      //             TextFormField(
      //               obscureText: !pas,
      //             controller: passmember,
      //             validator: (value){
      //               if(value!.isEmpty){
      //                   return 'required this field';
      //               }null;
      //             },
      //             decoration: InputDecoration(prefixIcon: Icon(Icons.password),
      //             suffixIcon: IconButton(onPressed: (){
      //               setState(() {
      //                 pas = !pas;
      //               });
      //             }, icon: Icon(pas ? Icons.visibility : Icons.visibility_off)),
      //             label: Text('Password'),hintText: 'Password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      //           ),
      //           SizedBox(height: 15,),
      //           ElevatedButton(onPressed: (){
      //             if(formkey2.currentState!.validate()){
      //               setState(() {
      //                   memberlogin(emailmember.text, passmember.text);
      //               });
                  
      //             }
      //           }, child: Text('Login'))
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
     
     
      Form(
        key: formkey2,
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://global.discourse-cdn.com/elastic/original/3X/9/0/90df22ab443662d632838fd82f6ea38b2cba025a.png'),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(backgroundImage: NetworkImage('https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg'),),
                SizedBox(
                  height: 170,
                ),
                Lottie.network(
                    'https://lottie.host/15ee3874-c223-4c70-99f9-16d2d9639e36/GlPGQX5NEx.json',
                    height: 200),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: emailmember,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.email),
                        label: Text('Email'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: passmember,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      null;
                    },
                    obscureText: !pas,
                    decoration: InputDecoration(
                      
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          pas = !pas;
                        });
                      }, icon: Icon(pas?Icons.visibility:Icons.visibility_off)  ),
                        hintText: 'Password',
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.password),
                        label: Text('Password'),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formkey2.currentState!.validate()) {
                            memberlogin(emailmember.text, passmember.text);
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 30),
                        ))),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Login with ?',
                //       style: TextStyle(fontSize: 15, color: Colors.white),
                //     ),
                //     TextButton(
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => Register_Screen()));
                //         },
                //         child: Text(
                //           'Member',
                //           style: TextStyle(
                //               fontSize: 15,
                //               color: Colors.pink[300],
                //               fontWeight: FontWeight.bold),
                //         ))
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),


    );
  }
}