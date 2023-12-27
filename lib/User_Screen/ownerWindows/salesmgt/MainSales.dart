import 'package:flutter/material.dart';
import 'package:abyssinia_pharmacy/User_Screen/ownerWindows/salesmgt/queuing.dart';

import 'GenerateReport.dart';
import 'SalesReport.dart';

class MainSales extends StatefulWidget {
  @override
  _MainSalesState createState() => _MainSalesState();
}

class _MainSalesState extends State<MainSales> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(205, 41, 90, 1),
        automaticallyImplyLeading: false,
        leading: IconButton(
          hoverColor: Colors.transparent,
          iconSize: 40,
          icon: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async{
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Sales Management',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [],
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
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 20),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => waiting()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 20),
                            child: Container(
                              width: double.infinity,
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
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.asset(
                                          'Assets/Qsales.jpg',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 4, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Sales On Process',
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF0F1113),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          hoverColor: Colors.transparent,
                                          iconSize: 60,
                                          icon: const Icon(
                                            Icons.chevron_right_outlined,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => waiting()),
                                            );
                                          },
                                        ),
                                      ],
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
                              MaterialPageRoute(builder: (context) => salesreport()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 20),
                            child: Container(
                              width: double.infinity,
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
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.asset(
                                          'Assets/reportsales.jpg',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 4, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Sales Report',
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF0F1113),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          hoverColor: Colors.transparent,
                                          iconSize: 60,
                                          icon: const Icon(
                                            Icons.chevron_right_outlined,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          onPressed: () async{
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => salesreport()),
                                            );
                                          },
                                        ),
                                      ],
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
                              MaterialPageRoute(builder: (context) => generatesalesreport()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 20),
                            child: Container(
                              width: double.infinity,
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
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.asset(
                                          'Assets/generatereport.jpg',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 4, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Generate Report',
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF0F1113),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          hoverColor: Colors.transparent,
                                          iconSize: 60,
                                          icon: const Icon(
                                            Icons.chevron_right_outlined,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => generatesalesreport()),
                                            );
                                          },
                                        ),
                                      ],
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
          ],
        ),
      ),
    );
  }
}


