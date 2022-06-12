import 'package:flutter/material.dart';
import 'package:quizflutter/models/user/visitor_model.dart';
import 'package:quizflutter/shared/cubit/cubit.dart';


class add_visitor extends StatelessWidget {
   add_visitor({Key? key}) : super(key: key);
  var LicenseControler = TextEditingController();
   var vistorNameControler = TextEditingController();
   var aboutcontroler = TextEditingController();
  var timeControler =TextEditingController();
   final maxLines = 5;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(
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
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 50,),

                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 100),
                     child: OutlinedButton(

                       onPressed: (){
                            AppCubit cubit=AppCubit.get(context);
                            VisitorModel v=VisitorModel(time: timeControler.text, license: LicenseControler.text, name: vistorNameControler.text,about: aboutcontroler.text);
                            cubit.addvisitorData(v);
                            cubit.changeIndex(1);
                         //firebase
                       },
                       style: ButtonStyle(
                         side: MaterialStateProperty.all(BorderSide(color: Colors.grey[900]!)),
                        minimumSize: MaterialStateProperty.all(Size(140,70)),
                         shape: MaterialStateProperty.all(
                             RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30.0),
                             )
                         ),
                       ),
                       child: const Text("Visitor Car",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black,),),



                     ),
                   ),
                   SizedBox(height: 20,),
                   TextFormField(

                       controller:LicenseControler,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: 'Car LP',
                         prefixIcon: Icon(
                           Icons.directions_car ,
                         ),

                       )


                   ),
                   SizedBox(height: 20,),
                   TextFormField(
                       controller:timeControler,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: 'Time',
                         prefixIcon: Icon(

                           Icons.watch_later_outlined ,
                         ),

                       )


                   ),
                   SizedBox(height: 20,),
                   TextFormField(
                       controller:vistorNameControler,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: 'Visitor name',
                         prefixIcon: Icon(
                           Icons.person_outline_rounded ,
                         ),

                       )


                   ),
                   SizedBox(height: 20,),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('About : ',style: TextStyle(fontSize: 18),),
                   ),


                   Container(

                     child: TextFormField(
                       maxLines: 5,
controller: aboutcontroler,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),

                       ),
                     ),
                   ),
                 ],
               ),
             )
            ],
          )
        )
      ;
  }
}
