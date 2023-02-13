import 'package:flutter/material.dart';
import 'package:mypos_employee_app/pages/search_employee.dart';


import '../models/employee.dart';
import '../services/api_service.dart';
import '../widgets/employee_tile.dart';
import '../widgets/widgets.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  late List<Employee> _employeeModel = [];
  String empName = "";
  String empNo = "";
  String empAddressLine1 = "";
  String empAddressLine2 = "";
  String empAddressLine3 = "";
  String departmentCode = "";
  DateTime dateOfBirth = DateTime.now();
  int basicSalary = 0;
  bool isActive = false;
  bool _isLoading = false;
  @override

  void initState() {
    _getData();
    super.initState();
  }

  _getData() async{
    _employeeModel = (await ApiService().getEmployees())!.cast<Employee>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myPOS Employees'),
        centerTitle: true,
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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
            )
        ),
        actions: [
          IconButton(
            onPressed: (){
              nextScreen(context, const SearchEmployee());
            },
            icon: const Icon(Icons.search, color: Colors.white,),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          popUpDialog(context);
        },
        child: Container(
            height: 60,
            width: 60,
            child: const Icon(Icons.add, color: Colors.white,size: 30,),
            decoration : BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [Color(0xFFA88BEB), Color(0xFFD5ADC8)])
            )
        ),
      ),
      body: employeeList()
    );
  }

  popUpDialog(BuildContext context){
    showDialog(
        //barrierDismissible: true,
        context: context,
        builder: (context){
          return StatefulBuilder(
              builder: ((context, setState){
                return AlertDialog(
                  title: const Text('Add a employee', textAlign: TextAlign.left,),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          onChanged: (val){
                            setState(() {
                              empName = val;
                            });
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Name",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFA88BEB)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xff649EFF)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          onChanged: (val){
                            setState(() {
                              empNo = val;
                            });
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Emp Number",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFA88BEB)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xff649EFF)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          onChanged: (val){
                            setState(() {
                              empAddressLine1 = val;
                            });
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Address",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFA88BEB)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xff649EFF)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          onChanged: (val){
                            setState(() {
                              departmentCode = val;
                            });
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Department Code",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFA88BEB)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xff649EFF)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          onChanged: (val){
                            setState(() {
                              basicSalary = int.parse(val);
                            });
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Basic Salary",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFA88BEB)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xff649EFF)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        // TextField(
                        //   onChanged: (val){
                        //     setState(() {
                        //       isActive = val;
                        //     });
                        //   },
                        //   style: TextStyle(color: Colors.black),
                        //   decoration: InputDecoration(
                        //     hintText: "Is Active",
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Color(0xFFA88BEB)),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     errorBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Colors.red),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Color(0xff649EFF)),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () async{
                        if(empName!=""){
                          addEmpolyee();
                          setState(() {
                            _isLoading = true;
                          });
                          Navigator.of(context).pop();
                          showSnackBar(context, Colors.greenAccent, "employee added Successfully");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF9370db)
                      ),
                      child: Text('CREATE'),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFA88BEB)
                      ),
                      child: Text('CANCEL'),
                    ),
                  ],
                );})
          );
        });
  }

  employeeList(){
    return ListView.builder(
      itemCount: _employeeModel.length,
      itemBuilder: (context, index){
        return EmployeeTile(
              empName: _employeeModel[index]
                  .empName
                  .toString(),
            departmentCode: _employeeModel[index]
                .departmentCode
                .toString(),
          salary: _employeeModel[index]
              .basicSalary
              .toString(),
          dob: _employeeModel[index]
              .dateOfBirth
              .toString(),
        );
      },
    );
  }

  void addEmpolyee() {
    apiService.addEmployee(
      context: context,
      empNo: empNo,
      empName: empName,
      empAddressLine1: empAddressLine1,
      empAddressLine2: "empAddressLine2",
      empAddressLine3: "empAddressLine3",
      departmentCode: departmentCode,
      dateOfJoin: DateTime.now().toIso8601String(),
      dateOfBirth: DateTime.now().toIso8601String(),
      basicSalary: 10000,
      isActive: false,
    );
  }
}
