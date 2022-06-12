
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../models/garage_model.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class garages extends StatefulWidget {
  const garages({Key? key}) : super(key: key);

  @override
  State<garages> createState() => garage_state();
}

class garage_state extends State<garages> {
  AppCubit? cubit;
  var scaffoldkey=GlobalKey<ScaffoldState>();
  var garagenamecontroller=TextEditingController();
  var searchcontrller = TextEditingController();
  var garagesizecontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();
  bool isbotomsheet=false;
  @override
  Widget build(BuildContext context) {
var fozi=context;
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
                      itemBuilder: (context, index) => build_car(AppCubit.garages[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8.0,
                      ),
                      itemCount: AppCubit.garages.length,
                    ),
                  ],
                ),
              ),
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(isbotomsheet)
                {
                  if(formkey.currentState!.validate()) {
                    garage_model garage=garage_model(garage_id: 'garage'+(AppCubit.garages.length).toString(),garage_size:int.parse(garagesizecontroller.text.toString()),garage_name:garagenamecontroller.text.toString() ,oid: 'kg5dmGOKKED5qvfhZgW8' );
                    cubit!.addgarage(garage);
                    Navigator.pop(context);
                    isbotomsheet = false;
                  }
                }
                else {
                  scaffoldkey.currentState?.showBottomSheet((context) =>
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formkey,
                          child: Column(

                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(

                                  onTap: (){

                                  },
                                  controller:garagenamecontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Garage Name',
                                    prefixIcon: Icon(
                                      Icons.garage_outlined ,
                                    ),

                                  )


                              ),
                              SizedBox(height: 20,),
                              TextFormField(

                                  controller:garagesizecontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Garage size',
                                    prefixIcon: Icon(
                                      Icons.directions_car ,
                                    ),

                                  )


                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),
                      ));
                  isbotomsheet=true;
                }
              },child: Icon(Icons.add,),
              backgroundColor: Colors.green,
            ),
          );
          }

        )

    );

  }
  Widget build_car(garage_model garage)
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


            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('25/10/2022 10 pm'),
            ),


            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(Icons.person),
                SizedBox(width:5,),
                Text('User info'),
                SizedBox(width: 10,),
                Icon(Icons.remove_circle),
                SizedBox(width:5,),
                Text('User info'),
              ],),
            ),

          ],
        ),
      ),
    );
  }
}
