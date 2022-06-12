import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizflutter/models/user/user_model.dart';
import 'package:quizflutter/models/user/visitor_model.dart';
import 'package:quizflutter/modules/add_visitor.dart';
import 'package:quizflutter/modules/customerNotification.dart';
import 'package:quizflutter/modules/home_page.dart';
import 'package:quizflutter/modules/profile.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:quizflutter/shared/cubit/states.dart';

import '../../models/garage_model.dart';
import '../../modules/garages.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
 static UserModel? user;
  static AppCubit get(context) => BlocProvider.of(context);
  final databaseReference = FirebaseDatabase.instance.reference();
  final FirebaseMessaging _firebaseMessaging= FirebaseMessaging.instance;
  int currentIndex = 1;

  List<Widget> screens = [
    profile(),
    home_page(),
    customerNotification(),
    addgarages(),

  ];
  bool isinital= false;
Future <void> init() async
{
  if(isinital!) {
    String? token = await _firebaseMessaging.getAPNSToken();
    print("the token is ");
    print( await _firebaseMessaging.getAPNSToken());
    await _firebaseMessaging.subscribeToTopic('news');

  }
  isinital=true;
}


  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }


  void getUserData() async {
    emit(getprofilelodaing());
    FirebaseFirestore.instance.collection('users').doc('12345').get().then((value) {
       init().then((value) => null);
       user = UserModel.fromJson(value.data()!);
      emit(getprofilesucsses());
    }).catchError((error) {
      print(error.toString());
      emit(getprofileerror(error.toString()));
    });


  }
  void addvisitorData(VisitorModel v)
  {

    FirebaseFirestore.instance
        .collection('visitor')
        .doc('12345').set(v!.toMap());
  }
  void addgarage(garage_model garage)
  {

    FirebaseFirestore.instance
        .collection('garages')
        .doc('garage'+(garages.length).toString()).set(garage!.toMap());
  }


  static List<garage_model> garages = [];
  static List<garage_model> garages1 = [];
  static void getGarages()
  {
    garages.clear();
    FirebaseFirestore.instance
        .collection('garages')
        .get()
      .then((value)
  {
  value.docs.forEach((element)
  {
  if(element.data()['oid']=='kg5dmGOKKED5qvfhZgW8')
  garages.add(garage_model.fromJson(element.data()));
  });

  //emit(GetgaragesSuccessState());
  })
      .catchError((error){
  //emit(GetgaragesErrorState());
  });
}
   void getGaragesforuser()
  {
    garages1.clear();
    FirebaseFirestore.instance
        .collection('garages')
        .get()
        .then((value)
    {
      value.docs.forEach((element)
      {
          garages1.add(garage_model.fromJson(element.data()));
      });

      emit(GetgaragesSuccessState());
    })
        .catchError((error){
      emit(GetgaragesErrorState());
    });
  }


}
