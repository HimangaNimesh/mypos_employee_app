import 'package:flutter/material.dart';

class EmployeeTile extends StatefulWidget {
  final String empName;
  final String departmentCode;
  final String salary;
  final String dob;
  const EmployeeTile({Key? key,
    required this.empName,
    required this.departmentCode,
    required this.salary,
    required this.dob,
  }) : super(key: key);

  @override
  _EmployeeTileState createState() => _EmployeeTileState();
}

class _EmployeeTileState extends State<EmployeeTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.2,
                  blurRadius: 5,
                  offset: const Offset(0.0, 5.0)
              )
            ]
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 5,),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xff9F98E8),
            child: Text(
              widget.empName.substring(0,1).toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.empName,style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                ],
              )
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Works at ${widget.departmentCode} Department',style: TextStyle(fontSize: 13),),
              Text('DOB: ${widget.dob}',style: TextStyle(fontSize: 13),),
              Text('Slary: ${widget.salary}=/',style: TextStyle(fontSize: 13),),
            ],
          )
        ),
      ),
    );
  }
}
