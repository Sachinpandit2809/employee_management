import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastErrorMessage(String message) {
    Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_LONG
  
    );
  }
    void toastSuccesMessage(String message) {
    Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.yellow,
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_LONG
  
    );
  }
}
