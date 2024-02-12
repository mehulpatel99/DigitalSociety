import 'dart:convert';

import 'package:digitalsociety/complaint/complainmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetComplain extends StatefulWidget {
  const GetComplain({super.key});

  @override
  State<GetComplain> createState() => _GetComplainState();
}

class _GetComplainState extends State<GetComplain> {
  Future<List<complainModel>> mygetcomplain() async {
    final response = await http.get(
        Uri.parse('https://unmusical-boil.000webhostapp.com/getcomplain.php'));
    List jsonresponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('getdata succesfully');
      return jsonresponse.map((e) => new complainModel.fromjson(e)).toList();
    } else {
      throw Exception('somthing went wrong');
    }
  }

  Future<void> mydeletecomplain(String id) async {
    final response = await http.post(
        Uri.parse(
            'https://unmusical-boil.000webhostapp.com/deletecomplain.php'),
        body: {'id': id});
    if (response.statusCode == 200) {
      complainModel.fromjson(jsonDecode(response.body));
    } else {
      throw Exception('something went wrong');
    }
  }

  late Future<List<complainModel>> futuredata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futuredata = mygetcomplain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complain Data'),backgroundColor: Colors.blue,),
      body: FutureBuilder(
          future: futuredata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<complainModel> mylist = snapshot.data!;
              return ListView.builder(
                  itemCount: mylist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text('${mylist[index].id}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            title: Text('Topic = ${mylist[index].topic}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            subtitle: Text(
                                'Description = ${mylist[index].description}'),
                            trailing: Text('${mylist[index].date}'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      mydeletecomplain(mylist[index].id!);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GetComplain()));
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              SizedBox();
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
