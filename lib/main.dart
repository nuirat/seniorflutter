import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizflutter/modules/add_visitor.dart';
import 'package:quizflutter/modules/home_page.dart';


import 'package:quizflutter/modules/profile.dart';

import 'home.dart';
import 'Layout/home_screen.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  );
  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
