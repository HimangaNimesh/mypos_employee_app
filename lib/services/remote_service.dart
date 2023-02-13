// import 'package:http/http.dart' as http;
//
// import '../models/employee.dart';
//
// class RemoteService{
//   Future<List<Employee>?> getEmployee() async{
//     var client = http.Client();
//     var _headers = {
//       'api_key' : "?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf",
//     };
//     var url = Uri.parse('http://examination.24x7retail.com//api/v1.0/Employees');
//     var response = await client.get(url, headers: _headers);
//     if(response.statusCode == 200){
//       var json = response.body;
//       return employeeFromJson(json);
//     }
//   }
// }