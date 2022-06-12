import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quizflutter/shared/cubit/cubit.dart';

import 'package:quizflutter/shared/cubit/states.dart';
class carstauts extends StatelessWidget {

  const carstauts({Key? key}):super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {

      print('state is '+state.toString());

    },


    builder: (BuildContext context, AppStates state) {

      return Scaffold
        (appBar: AppBar(leading: IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back, color: Colors.black,),),
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'The SMART GARAGE', style: TextStyle(color: Colors.black),),
        ), backgroundColor: Colors.white, elevation: 0,

      ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),

              Center(child: Icon(Icons.airport_shuttle_rounded, size: 60,),),
              SizedBox(height: 100,),
              Text('Stauts : ', style: TextStyle(fontSize: 18),),
              SizedBox(height: 40,),
              Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: AppCubit.user!.isIn! ? Colors.green[400] : Colors
                        .red[400],),

                  child:
                  ConditionalBuilder(
                      condition: AppCubit.user!.isIn!,

                      builder: (context) =>
                          Text('Your car is in the garage', style: TextStyle(
                              fontSize: 18, color: Colors.black),),
                      fallback: (context) =>
                          Text('Your car is not in the garage',
                            style: TextStyle(
                                fontSize: 18, color: Colors.black),))
              ),
              SizedBox(height: 80,),
              Text('Deactivate your car entry : ',
                style: TextStyle(fontSize: 18),),
              SizedBox(height: 40,),

              Padding(
                padding: const EdgeInsets.only(left: 200),
                child:
                TextButton(

                    onPressed: () {}, child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.blue[400],),

                    child: Text(
                      'Yes', style: TextStyle(fontSize: 18, color: Colors
                        .black,),))

                ),
              ),


            ],

          ),
        ),
      );
    }));
  }
}
