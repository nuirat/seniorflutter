import 'package:flutter/material.dart';
import 'package:quizflutter/modules/add_visitor.dart';
import 'package:quizflutter/modules/stauts.dart';
import 'package:quizflutter/shared/cubit/cubit.dart';


class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit =AppCubit.get(context);
    AppCubit.getGarages();
    cubit.getGaragesforuser();
    cubit.getUserData();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
          Container(
decoration: BoxDecoration(
  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90), bottomRight: Radius.circular(90)),
  color:  Color(0xFF303030),
),
            width: double.infinity,
              height: 200,
alignment: Alignment.center,
              child: Text('THE SMART GARAGE',style: TextStyle(color: Colors.white,fontSize: 24),),

          ),


               Padding(
                padding: const EdgeInsets.fromLTRB(120,160,60,40),
                child: TextButton(onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => carstauts()));}, child:Row(children: [
                Icon(Icons.directions_car),
SizedBox(width: 20,),
                  Text('My Car')
                ],
                )
                ),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0,vertical: 60),
                child: TextButton(onPressed: (){
                  AppCubit x= AppCubit.get(context);
                  x.changeIndex(3);
                }, child:Row(children: [
                  Icon(Icons.directions_car),
                  SizedBox(width: 20,),
                  Text('Add Car')
                ],
                )
                ),
              ),

          ],
          ),
        ),
      ),
    );
  }
}
