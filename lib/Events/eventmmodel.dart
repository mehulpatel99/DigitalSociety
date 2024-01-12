import 'package:flutter/material.dart';


class eventmodel{
  String? id;
  String? titlee;
  String? descriptione;
  String? datee;

  eventmodel({required this.id,required this.titlee,required this.descriptione,required this.datee});

  factory eventmodel.fromjson(Map<String,dynamic> json){
    return eventmodel(id: json['id'], titlee: json['titlee'], descriptione: json['descriptione'], datee: json['datee']);
  }
}