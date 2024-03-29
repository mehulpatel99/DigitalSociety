import 'dart:convert';
import 'dart:ui';

import 'package:digitalsociety/Notice/noticemodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class NoticeAdd extends StatefulWidget {
  const NoticeAdd({super.key});

  @override
  State<NoticeAdd> createState() => _NoticeAddState();
}

TextEditingController titleCon = TextEditingController();
TextEditingController descCon = TextEditingController();



var formkey = GlobalKey<FormState>();
class _NoticeAddState extends State<NoticeAdd> {
 Future<noticemodel> noticepost(String title,String description)async{
  final response = await http.post(Uri.parse('https://unmusical-boil.000webhostapp.com/addnotice.php'),
  body: {
    'title':title,
    'description':description
  },
  );
  // List jsonresponse = jsonDecode(response.body);
  if(response.statusCode==200){
    print('succesfully post');
    return noticemodel.fromjson(jsonDecode(response.body));
  }else{
    throw Exception('Something went wrong');
  }
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
           key: formkey,
          child: Card(
           
            child: Container(
               height: 400,
            width: 400,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.purple,Colors.orange,Colors.pink],begin: Alignment.topRight,end: Alignment.bottomLeft)),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text('Add Your Notice',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Divider(),
              ),
             
                Padding(
                  padding: const EdgeInsets.only(top: 90,left: 20,right: 20),
                  child: TextFormField(
                    controller: titleCon,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Topic is required';
                      }return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      label: Text('Topic'),
                      prefixIcon: Icon(Icons.topic),
                      hintText: 'Topic',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 170,left: 20,right: 20),
                  child: TextFormField(
                    maxLines: 5,
                    controller: descCon,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Desc is required';
                      }return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      label: Text('Description'),
                      prefixIcon: Icon(Icons.description),
                      hintText: 'Description',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.only(top: 330,left: 140),
                  child: ElevatedButton(onPressed: (){
                    
                    if(formkey.currentState!.validate()){
                       noticepost(titleCon.text, descCon.text);
                    }
                    
                  }, child: Text('Submit')),
                ),
                 Padding(
                   padding: const EdgeInsets.only(left: 25),
                   child: Lottie.network('https://lottie.host/77f76b4e-1807-440d-953e-e189379d15f5/Npj4mcltsC.json',height: 100,width: 150),
                 ),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}