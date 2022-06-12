import 'package:flutter/material.dart';

class garage_model
{
  int? available_slots;
  int? garage_size;
  String? oid;
  String? garage_name;
  String? garage_id;
  garage_model({this.garage_size,this.oid,this.garage_name,this.garage_id})
  {

  }
  garage_model.fromJson(Map<String, dynamic> json)
  {

    available_slots= json['available_slots'];
    oid= json['oid'];
    garage_size = json['garage_size'];
    garage_name=json['garage_name'];
    garage_id=json['garage_id'];


  }
  Map<String, dynamic> toMap()
  {
    return {
      'garage_name':garage_name,
      'oid':oid,
      'garage_id':garage_id,
      'garage_size':garage_size,
    };
  }

}