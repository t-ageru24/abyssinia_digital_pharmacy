import 'package:flutter/material.dart';
import 'MarkAttendance.dart';
import 'addemployee.dart';
import 'package:abyssinia_pharmacy/User_Screen/ownerWindows/Employeemgt/ListEmployee.dart';

import 'attendanceReport.dart';

class MainEmployee extends StatefulWidget {

  @override
  _MainEmployeeState createState() => _MainEmployeeState();
}

class _MainEmployeeState extends State<MainEmployee> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(205, 41, 90, 1),
        automaticallyImplyLeading: false,
        title: const Text(
          'Employee Management',
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){
          Navigator.pop(context);
        }),
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromRGBO(56, 173, 174, 1), Color.fromRGBO(205, 41, 90, 1)]
            )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => list()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0x65090F13),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'Assets/employees.jpg',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 4, 16, 16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () async{
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => list()),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.list,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          label: const Text('Show'),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(40),
                                                side: const BorderSide(color: Colors.transparent, width: 1),
                                              ),
                                              fixedSize: const Size(120, 40),
                                              elevation: 3,
                                              primary: const Color(0xFF39D2C0),
                                              textStyle: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 13,
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddemployeeWidget()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0x65090F13),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                'Assets/add new.jpg',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        'New Employee',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFFEE8B60),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () async{
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => AddemployeeWidget()),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        label: const Text('Add'),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(40),
                                              side: const BorderSide(color: Colors.transparent, width: 1),
                                            ),
                                            fixedSize: const Size(120, 40),
                                            elevation: 3,
                                            primary: const Color(0xFF39D2C0),
                                            textStyle: const TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 13,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mark()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0x65090F13),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'Assets/attendance (2).jpg',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        'Attendance',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFFEE8B60),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () async{
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Mark()),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        label: const Text('Mark'),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(40),
                                              side: const BorderSide(color: Colors.transparent, width: 1),
                                            ),
                                            fixedSize: const Size(120, 40),
                                            elevation: 3,
                                            primary: const Color(0xFF39D2C0),
                                            textStyle: const TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 13,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => attendancereport()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0x65090F13),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'Assets/list1.jpg',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        'Attendance Report',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFFEE8B60),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () async{
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => attendancereport()),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        label: const Text('Show'),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(40),
                                              side: const BorderSide(color: Colors.transparent, width: 1),
                                            ),
                                            fixedSize: const Size(120, 40),
                                            elevation: 3,
                                            primary: const Color(0xFF39D2C0),
                                            textStyle: const TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 13,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
