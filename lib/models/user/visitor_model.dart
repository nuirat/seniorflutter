import 'package:flutter/material.dart';

class VisitorModel {
  String? name;
  String? license;
  String? time;
  String? about;

  VisitorModel({
    required this.time,
    required this.license,
    required this.name,
    required this.about,
  });

  VisitorModel.fromJson(Map<String, dynamic> json)
  {

    license= json['license'];
    time= json['time'];
    name = json['name'];
    about= json['about'];

  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'license':license,
      'time':time,
      'about':about,


    };
  }
}