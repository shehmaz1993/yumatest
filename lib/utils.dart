import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utils{


  void toastMessage(String message){
      // toast message will be copied here
      Fluttertoast.showToast(

          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[200],
          textColor:Colors.white,
          fontSize: 16.0,
      );

    }


}
