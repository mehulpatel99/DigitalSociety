import 'dart:convert';
import 'package:digitalsociety/complaint/complainmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class addcomplain extends StatefulWidget {
  const addcomplain({super.key});

  @override
  State<addcomplain> createState() => _addcomplainState();
}
TextEditingController topicComplain = TextEditingController();
TextEditingController descComplain = TextEditingController();
TextEditingController dateComplain = TextEditingController();
class _addcomplainState extends State<addcomplain> {
  Future<void> myaddcomplain(String? topic,description,date)async{
    final response = await http.post(Uri.parse('https://unmusical-boil.000webhostapp.com/addComplaints.php'),
    body: {
      'topic':topic,
      'description':description,
      'date':date
    }
    );
    print(response.statusCode.toString());
    if(response.statusCode==200){
     print('succesfully post my data');
       complainModel.fromjson(jsonDecode(response.body) as Map<String,dynamic>);
        Get.snackbar('Complain', 'Succesfully add');
    }else{
      throw Exception('somthing went wrong');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddComplaint'),
      ),
      body: Center(
        child: Container(
         
          height: MediaQuery.of(context).size.height,
          width: 400,
          // color: Colors.grey[400],
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient: LinearGradient(colors: [Colors.pink,Colors.orange,Colors.black],begin: Alignment.topRight,end: Alignment.bottomRight)),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextField(
              controller: topicComplain,

              decoration: InputDecoration(fillColor: Colors.white,filled: true,hintText: 'Topic',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
            ),
            TextField(
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: descComplain,
              decoration: InputDecoration(fillColor: Colors.white,filled: true,hintText: 'Description',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
            ),
            TextField(
              readOnly: true,
              controller: dateComplain,
              decoration: InputDecoration(fillColor: Colors.white,filled: true,hintText: 'Date',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              onTap: ()async{
                DateTime? pickeddate = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2025));
                if (pickeddate != null) {
                          String? formetdate =
                              DateFormat('dd-MM-yyyy').format(pickeddate);
                          setState(() {
                            dateComplain.text = formetdate;
                          });
                        }
              },
            ),
            ElevatedButton(onPressed: (){
            
               myaddcomplain(topicComplain.text, descComplain.text, dateComplain.text);
              //  Get.to(addcomplain());
              //  print('Succesfully post');
            
              
            }, child: Text('Submit'))
          ],),
        ),
      ),
    );
  }
}