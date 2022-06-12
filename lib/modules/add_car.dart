
import 'package:flutter/material.dart';

class add_car extends StatefulWidget {
  const add_car({Key? key}) : super(key: key);

  @override
  State<add_car> createState() => _add_carState();
}

class _add_carState extends State<add_car> {
  var searchcontrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back),),
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
                itemBuilder: (context, index) => build_car(msg: 'UserName',ingrage:true,date: '25/10/2022 10 pm'),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.0,
                ),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),

floatingActionButton: FloatingActionButton(
  onPressed: (){},child: Icon(Icons.add,),
backgroundColor: Colors.green,
),
    );
  }
  Widget build_car({required String msg,required String date,required bool ingrage})
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
              Text(msg),
              SizedBox(width: 110,),
              Icon(Icons.directions_car,color: ingrage ? Colors.green: Colors.red,),
              SizedBox(width: 6,),
              Text(ingrage ? 'in Garage':'out Garage'),
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
