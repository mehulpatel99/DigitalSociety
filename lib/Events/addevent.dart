import 'dart:convert';

import 'package:digitalsociety/Events/eventmmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}
TextEditingController titleCon = TextEditingController();
TextEditingController descCon = TextEditingController();
TextEditingController dateCon = TextEditingController();
class _AddEventState extends State<AddEvent> {
  Future<void> myeventadd(String? titlee,descriptione,datee)async{
    final response = await http.post(Uri.parse('https://unmusical-boil.000webhostapp.com/addevent.php'),
    body: {
      'titlee':titlee,
      'descriptione':descriptione,
      'datee':datee,
    }
    );
    if(response.statusCode==200){
      print('Succesfully submit');
      Get.snackbar('Event', 'Succesfully post');
       eventmodel.fromjson(jsonDecode(response.body) as Map<String,dynamic>);
    }else{
      throw Exception('somthing went wrong');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events')
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextField(
            controller: titleCon,
            decoration: InputDecoration(hintText: 'Title',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(height: 10,),
          TextField(
            maxLines: 10,
            controller: descCon,
            decoration: InputDecoration(hintText: 'Description',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ),
           SizedBox(height: 10,),
          TextField(
            readOnly: true,
            controller: dateCon,
            decoration: InputDecoration(hintText: 'Date',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            onTap: ()async{
              DateTime? _datepick = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2050),initialDate: DateTime.now());
              if(_datepick != null){
                String formetdate = DateFormat('yyyy-MM-dd').format(_datepick);
                setState(() {
                  dateCon.text = formetdate;
                });
              }
              
            },
          ),
           SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            myeventadd(titleCon.text, descCon.text, dateCon.text);
          }, child: Text('Submit'))
        ],),
      ),
    );
  }
}