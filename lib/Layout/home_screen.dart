
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quizflutter/models/user/user_model.dart';
import 'package:quizflutter/shared/cubit/cubit.dart';
import 'package:quizflutter/shared/cubit/states.dart';


// 1. create database
// 2. create tables
// 3. open database
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database

class HomeLayout extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  static UserModel? user;
  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          print('state is '+state.toString());

        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);


          return Scaffold(
            key: scaffoldKey,

            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                  ),
                  label: 'Profile',

                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.car_repair,
                  ),
                  label: 'Vistor',
                ),
              ],
            ),
          );
        },
      ),
    );
  }


}
