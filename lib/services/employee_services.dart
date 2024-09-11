import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:employee_management/modals/employee_modal.dart';
import 'package:employee_management/services/api_end_point.dart';
import 'package:employee_management/utils/utils.dart';
import "package:http/http.dart " as http;

class EmployeeServices {
  List<EmployeeModel> employeeList = [];

  Future<List<EmployeeModel>> fetchEmployeeData() async {
    try {
      final response = await http.get(Uri.parse(ApiEndPoint.baseUrl));
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        employeeList = [];
        for (var i in data) {
          employeeList.add(EmployeeModel.fromJson(i));
        }
        return employeeList;
      }
    } catch (e) {
      Utils().toastErrorMessage(e.toString());
      //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("data")))
    }
    return employeeList;
  }
}
