import 'package:flutter/material.dart';

class complainModel
{
  String? id;
  String? topic;
  String? description;
  String? date;

  complainModel({required this.id,required this.topic,required this.description,required this.date});

  factory complainModel.fromjson(Map<String,dynamic> json){
    return complainModel(id: json['id'], topic: json['topic'], description: json['description'], date: json['date']);
  }
}