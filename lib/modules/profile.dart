import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizflutter/modules/garages.dart';
import 'package:quizflutter/shared/cubit/cubit.dart';
import 'package:quizflutter/shared/cubit/states.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     AppCubit cubit =AppCubit.get(context);
     cubit.getUserData();

    return
      BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          print('state is '+state.toString());

        },
        builder: (BuildContext context, AppStates state) {
       return ConditionalBuilder(
          condition: state is getprofilesucsses || AppCubit.user!=null,
          builder: (context) => Scaffold(

                  body:  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      //    color: Colors.black12,
                      gradient: RadialGradient(
                        center: Alignment(0.1, 0.2),
                        focal: Alignment(0,0.6),
                        focalRadius: 1.3,
                        stops: [0.2,
                          0.2],
                        colors: [
                          Color(0xFF303030),
                          Colors.white,

                        ],
                      ),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),

                    ),

                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 30, 30, 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
                              Container(height: 24,width: 24)
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0,0 ,50),
                          child: Stack(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 70,
                                child: ClipOval(child: Image.asset('images/girl.jpg', height: 150, width: 150, fit: BoxFit.cover,),),
                              ),
                              Positioned(bottom: 1, right: 1 ,child: Container(
                                height: 40, width: 40,
                                child: Icon(Icons.add_a_photo, color: Colors.white,),
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                              ))
                            ],
                          ),
                        ),

                        Expanded(child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),

                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                                child: Container(
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.email_rounded),
                                            SizedBox(width: 10,),
                                            Text('Email : '+AppCubit.user!.email!, style: TextStyle(color: Colors.black),),
                                          ],
                                        )
                                    ),
                                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                                child: Container(
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.account_circle),
                                            SizedBox(width: 10,),
                                            Text('Username : '+AppCubit.user!.name!, style: TextStyle(color: Colors.black),),
                                          ],
                                        )
                                    ),
                                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                                child: Container(
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.directions_car),
                                            SizedBox(width: 10,),
                                            Text('Licenseplate : '+AppCubit.user!.license!, style: TextStyle(color: Colors.black),),
                                          ],
                                        )
                                    ),
                                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                                child: Container(
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:TextButton(onPressed: (){Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => garages()));},child:  Row(
                                          children: [
                                            Icon(Icons.logout),
                                            SizedBox(width: 10,),
                                            Text('logout', style: TextStyle(color: Colors.black),),
                                          ],)
                                        )
                                    ),
                                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),



          fallback: (context) =>Center(child: CircularProgressIndicator()),

);

        },
      );




  }
}
