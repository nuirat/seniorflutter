

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../models/garage_model.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class addgarages extends StatefulWidget {
  const addgarages({Key? key}) : super(key: key);

  @override
  State<addgarages> createState() => garage_state();
}

class garage_state extends State<addgarages> {
  var isjoined=List.filled(AppCubit.garages.length, false, growable: false);
  AppCubit? cubit;
  var scaffoldkey=GlobalKey<ScaffoldState>();
  var garagenamecontroller=TextEditingController();
  var searchcontrller = TextEditingController();
  var garagesizecontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();
  bool isbotomsheet=false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (BuildContext context, AppStates state) {


              print('state is '+state.toString());

            },
            builder: (BuildContext context, AppStates state){
              cubit   =AppCubit.get(context);

              return Scaffold(
                key: scaffoldkey,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),

                          child:   TextFormField(
                              controller:searchcontrller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(200.0))),
                                hintText: 'search',
                                prefixIcon: Icon(

                                  Icons.search ,
                                ),

                              )


                          ),

                        ),
                        SizedBox(height: 20,),
                        Text('Cars in Garage',style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                        ),),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => build_garage(AppCubit.garages1[index],index),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 8.0,
                          ),
                          itemCount: AppCubit.garages.length,
                        ),
                      ],
                    ),
                  ),
                ),


              );
            }

        )

    );

  }
  Widget build_garage(garage_model garage,var index)
  {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child:   Container(

        decoration: BoxDecoration(
          border:Border.all(color: Colors.black) ,
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text(garage.garage_name!),
                SizedBox(width: 110,),
                SizedBox(width: 6,),
                Text( 'Garage size'),
                SizedBox(width: 6,),
                Text(  (garage.garage_size!).toString()),
              ],),
            ),

            SizedBox(height: 5,),




            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                IconButton(onPressed: (){
                  if(isjoined[index]==false)
                    
                  cubit!.getGaragesforuser();
                  isjoined[index]=true;


                }, icon:
                  Icon(isjoined[index]?Icons.timer:Icons.plus_one),

                ),
                Text( isjoined[index]?'request is in waiting':'join to the garage'),


              ],),
            ),

          ],
        ),
      ),
    );
  }
}
