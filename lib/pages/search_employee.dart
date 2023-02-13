import 'package:flutter/material.dart';

import '../models/employee.dart';
import '../services/api_service.dart';

class SearchEmployee extends StatefulWidget {
  const SearchEmployee({Key? key}) : super(key: key);

  @override
  _SearchEmployeeState createState() => _SearchEmployeeState();
}

class _SearchEmployeeState extends State<SearchEmployee> {
  TextEditingController searchController = TextEditingController();
  late List<Employee> _employeeModel = [];
  @override

  void initState() {
    _getData();
    super.initState();
  }

  _getData() async{
    _employeeModel = (await ApiService().getEmployee())!.cast<Employee>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
            ),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xFFA88BEB), Color(0xFFD5ADC8)]),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xffE5F9FF),
        iconTheme: const IconThemeData(color:Colors.white),
        title: Expanded(
            child: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search by employee name..."
              ),
            )),
        actions: [
          GestureDetector(
            onTap: (){
              initiateSearchMethod();
            },
            child: Container(
              width: 40,
              height: 40,
              // decoration: BoxDecoration(
              //   color: Colors.black.withOpacity(0.1),
              //   borderRadius: BorderRadius.circular(20),
              // ),
              child: const Icon(Icons.search),
            ),
          ),
          SizedBox(width: 20,)
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
            )
        ),
      ),
    );
  }
  initiateSearchMethod(){}
}
