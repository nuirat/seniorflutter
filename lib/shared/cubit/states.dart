abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppCreateDatabaseState extends AppStates {}

class AppGetDatabaseLoadingState extends AppStates {}

class AppGetDatabaseState extends AppStates {}

class AppInsertDatabaseState extends AppStates {}

class AppUpdateDatabaseState extends AppStates {}

class AppDeleteDatabaseState extends AppStates {}

class AppChangeBottomSheetState extends AppStates {}

class getprofilelodaing extends AppStates {}
class GetgaragesSuccessState extends AppStates{}
class GetgaragesErrorState extends AppStates{}

class getprofilesucsses extends AppStates {}
class getprofileerror extends AppStates {
  String error='';
  getprofileerror(this.error){}
}
