import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'كويز المتميزون للمظرطه'
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children:[
                Text('are you ready for the quiz ?!',

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
                SizedBox(
                  height: 20,
                ),
                Image.network('https://scontent.fjrs25-1.fna.fbcdn.net/v/t1.6435-9/65850709_1254954498004610_4796944033966456832_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=ad2b24&_nc_ohc=7VkU4pfck9QAX9Ro3dJ&_nc_oc=AQl89BP1XN3YE5a2HBZCe9BOvQJ5sq8C9gfZ6mue_R-NaWJFa1ECiryob5zXby3dX1o&_nc_ht=scontent.fjrs25-1.fna&oh=00_AT8waZ6C_l3rzIJOpQCPJxqhP3YZZHYBJEkCry5qyZnZjQ&oe=62547BD8'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepOrange,
                  ),

                  child: TextButton(onPressed: (){

                  }, child: Text('Start now!',style: TextStyle(color: Colors.white,),)
                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                Text('خليك زلمه وخش',

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),),

              ]
            ),
          ),
        ),
      ),
    );
  }
}
