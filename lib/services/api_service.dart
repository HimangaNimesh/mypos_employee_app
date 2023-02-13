import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../global_variables.dart';
import '../models/employee.dart';

class ApiService {
// Retreive All the Employees
  final String token = "?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf";
  Future<List<Employee>?> getEmployees() async {
    try {
      var url = Uri.parse(ApiConstants.baseUri + ApiConstants.allEmployee);
      var response = await http.get(url, headers: {
        "apiToken": token,
      });
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body) as List<dynamic>;
        List<Employee> model =
        decodeJson.map((e) => Employee.fromJson(e)).toList();
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Employee>?> getEmployee() async {
    try {
      var url = Uri.parse(ApiConstants.baseUri + ApiConstants.oneEmployee);
      var response = await http.get(url, headers: {
        "apiToken": token,
      });
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body) as List<dynamic>;
        List<Employee> model =
        decodeJson.map((e) => Employee.fromJson(e)).toList();
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  // Add a Employee
  void addEmployee({
    required BuildContext context,
    required String empNo,
    required String empName,
    required String empAddressLine1,
    required String empAddressLine2,
    required String empAddressLine3,
    required String departmentCode,
    required String dateOfJoin,
    required String dateOfBirth,
    required int basicSalary,
    required bool isActive,
  }) async {
    try {
      Employee employee = Employee(
          empNo: empNo,
          empName: empName,
          empAddressLine1: empAddressLine1,
          empAddressLine2: empAddressLine2,
          empAddressLine3: empAddressLine3,
          departmentCode: departmentCode,
          dateOfJoin: dateOfJoin,
          dateOfBirth: dateOfBirth,
          basicSalary: basicSalary,
          isActive: isActive);
      var url =
      Uri.parse("http://examination.24x7retail.com/api/v1.0/Employees");
      var response = await http.post(
        url,
        headers: {"apiToken": token},
        body: employee.toJson(),
      );
      log("allgood");
    } catch (e) {
      log(e.toString());
      print(DateTime.now().toIso8601String());
    }
  }
}
