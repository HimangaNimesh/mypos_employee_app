import 'dart:convert';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  Employee({
    required this.empNo,
    required this.empName,
    required this.empAddressLine1,
    required this.empAddressLine2,
    required this.empAddressLine3,
    required this.departmentCode,
    required this.dateOfJoin,
    required this.dateOfBirth,
    required this.basicSalary,
    required this.isActive,
  });

  String empNo;
  String empName;
  String empAddressLine1;
  String empAddressLine2;
  String empAddressLine3;
  String departmentCode;
  String dateOfJoin;
  String dateOfBirth;
  int basicSalary;
  bool isActive;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    empNo: json["empNo"],
    empName: json["empName"],
    empAddressLine1: json["empAddressLine1"],
    empAddressLine2: json["empAddressLine2"],
    empAddressLine3: json["empAddressLine3"],
    departmentCode: json["departmentCode"],
    dateOfJoin: json["dateOfJoin"],
    dateOfBirth: json["dateOfBirth"],
    basicSalary: json["basicSalary"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "empNo": empNo,
    "empName": empName,
    "empAddressLine1": empAddressLine1,
    "empAddressLine2": empAddressLine2,
    "empAddressLine3": empAddressLine3,
    "departmentCode": departmentCode,
    "dateOfJoin": dateOfJoin,
    "dateOfBirth": dateOfBirth,
    "basicSalary": basicSalary.toString(),
    "isActive": isActive.toString(),
  };
}
