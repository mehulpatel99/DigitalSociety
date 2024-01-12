import 'dart:convert';

import 'package:digitalsociety/Events/eventmmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class GetEvent extends StatefulWidget {
  const GetEvent({super.key});

  @override
  State<GetEvent> createState() => _GetEventState();
}

class _GetEventState extends State<GetEvent> {
  Future<List<eventmodel>> mygetevent()async{
    final response = await http.get(Uri.parse('https://unmusical-boil.000webhostapp.com/getevent.php'));
    List jsonresponse = jsonDecode(response.body);
    if(response.statusCode==200){
      print('succesfully get data');
      return jsonresponse.map((data) => new eventmodel.fromjson(data)).toList();
    }else{
      throw Exception('something went wrong');
    }
  }


  Future<void> deleteevent(String? id)async{
    final response = await http.post(Uri.parse('https://unmusical-boil.000webhostapp.com/deleteevent.php'),body: {'id':id});
    if(response.statusCode==200){
      eventmodel.fromjson(jsonDecode(response.body));
    }else{
      throw Exception('something went wrong');
    }
  }



  late Future<List<eventmodel>> futuredata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futuredata=mygetevent();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events'),leading: Icon(Icons.home),),
      body:FutureBuilder(future: futuredata,builder: (context,snapshot){
        if(snapshot.hasData){
          List<eventmodel> mylist = snapshot.data!;
          print("----->>> list of data ");
          return ListView.builder(itemCount: mylist.length,itemBuilder: (context,index){
            return Card(child: Column(children: [
              Text('Id : ${mylist[index].id}'),
                Text('Title : ${mylist[index].titlee}'),  
                  Text('Description : ${mylist[index].descriptione}'),
                    Text('Date : ${mylist[index].datee}'),
                    ElevatedButton.icon(onPressed: (){
                      setState(() {
                        deleteevent(mylist[index].id);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>GetEvent()));
                      });
                      
                    }, icon: Icon(Icons.delete), label: Text('Delete'))
            ],),);
          });
        }else if(snapshot.hasError){
          SizedBox();
        }return Center(child: CircularProgressIndicator());
      }) ,
    );
  }
}