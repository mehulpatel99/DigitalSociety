import 'dart:convert';

import 'package:digitalsociety/dishplay_chairmen.dart';
import 'package:digitalsociety/get_members.dart';
import 'package:digitalsociety/member_reg.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class model {
  int? id;
  String? email;
  String? pass;
  model({required this.id, required this.email, required this.pass});

  factory model.fromjson(Map<String, dynamic> json) {
    return model(id: json['id'], email: json['email'], pass: json['pass']);
  }
}

TextEditingController emailcon = TextEditingController();
TextEditingController passcon = TextEditingController();

class MyChairman extends StatefulWidget {
  const MyChairman({super.key});

  @override
  State<MyChairman> createState() => _MyChairmanState();
}

var formkey = GlobalKey<FormState>();

class _MyChairmanState extends State<MyChairman> {
  Future mylogin(String email, String pass) async {
    final response = await http.post(
        Uri.parse('https://unmusical-boil.000webhostapp.com/loginchair.php'),
        body: {
          'email': email,
          'pass': pass,
        });
    List jsonresponse = jsonDecode(response.body);
    if (jsonresponse.isEmpty) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('invalid')));
    } else {
      if (response.statusCode == 200) {
        print(response.body);
        print(response);
        jsonresponse.map((e) => model.fromjson(e));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DishplayChairmen()));
      } else {
        throw Exception('something went wrong ');
      }
    }
  }
  bool change = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
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
                    controller: emailcon,
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
                    controller: passcon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      null;
                    },
                    obscureText: !change,
                    decoration: InputDecoration(
                      
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          change = !change;
                        });
                      }, icon: Icon(change?Icons.visibility:Icons.visibility_off)  ),
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
                          if (formkey.currentState!.validate()) {
                            mylogin(emailcon.text, passcon.text);
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 30),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login with ?',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register_Screen()));
                        },
                        child: Text(
                          'Member',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.pink[300],
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
