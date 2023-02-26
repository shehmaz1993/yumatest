import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Database/db-handlar.dart';
import '../Database/model_class.dart';
import 'API/api_handler.dart';

class Repository{
  API api=API();
  DBHelper? dbHelper;
  Future  registerUser(String user,String fName,String lName,String email,String password)async {
    try {
      Response response = await api.sendRequest.post('/consumer/register',
          data:{
                 'username':user,
                 'password':password,
                  'email':email,
                  'profile':{
                     'first_name':fName,
                     'last_name': lName
                  }
               }
               );
          print(response.data);

    }
    catch (ex) {
       rethrow;
    }
   }
  Future  logInUser(String user,String password)async {
    dbHelper=DBHelper();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //post request making
    try {
      Response response = await api.sendRequest.post('/consumer/login',
          data:{
                'username':user,
                'password':password,

              }
      );
      if(response.statusCode==200){
        print(response.data);
        var data=response.data;
        //inserting user information in sqlite
        dbHelper?.insert(

            UserModel(
                username:prefs.getString('username'),
                consumerUuid: data['consumer_uuid'],
                sessionId: data['session_id'],
            )
        ).then((value){
          print('user added $value');
          // user is being added
        }).onError((error, stackTrace){
          print(error.toString());
        });

      }

    }
    catch (ex) {
      rethrow;
    }
  }
  }