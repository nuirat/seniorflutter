import 'package:flutter/material.dart';

class UserModel {
   String? name;
   String? license;
   String? email;
   bool? isIn;
   DateTime? entrytime,exittime;
  UserModel({
    required this.email,
    required this.license,
    required this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json)
  {

    license= json['license'];
    email= json['email'];
    name = json['name'];
    entrytime=DateTime.fromMicrosecondsSinceEpoch(json['entry_time'].microsecondsSinceEpoch);
    exittime=DateTime.fromMicrosecondsSinceEpoch(json['exit_time'].microsecondsSinceEpoch);
    isIn= entrytime!.isAfter(exittime!);
 print ("exit time is ");
 print(DateTime.fromMicrosecondsSinceEpoch(json['entry_time'].microsecondsSinceEpoch).minute);
    print ("entry time is ");
    print(DateTime.fromMicrosecondsSinceEpoch(json['exit_time'].microsecondsSinceEpoch).minute);
  print(isIn);

  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'license':license,
      'email':email,
    };
  }
}