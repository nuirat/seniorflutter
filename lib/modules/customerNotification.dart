import 'package:flutter/material.dart';

class customerNotification extends StatelessWidget {
  const customerNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(elevation:0,backgroundColor:Colors.white,title: Center(
      child:
      Container(
        width: double.infinity,
        decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.black,))),
        child: Column(
        children:[
        Text('Notification',style: TextStyle(color: Colors.black),),
      SizedBox(height: 5,

      ),]
      )

      ),
    ),
    ),

      body:
      SingleChildScrollView(
        scrollDirection:  Axis.vertical,
      child: Column(children: [

        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => build_notification(msg: 'Your car enterd the garage',date: '25/10/2022 10 pm'),
          separatorBuilder: (context, index) => SizedBox(
            height: 8.0,
          ),
          itemCount: 10,
        ),
      ],
      ),
    ),);
  }
  Widget build_notification({required String msg,required String date})
  {
return Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Container(
    
    decoration: BoxDecoration(
      border:Border.all(color: Colors.black) ,
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
    child: Column(children: [
      SizedBox(height: 15,),
      Text(msg),
      SizedBox(height: 15,),
      Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text('25/10/2022 10 pm'),
          ),

      ),
      SizedBox(height: 15,),

    ],
    ),
  ),
);
  }
}
