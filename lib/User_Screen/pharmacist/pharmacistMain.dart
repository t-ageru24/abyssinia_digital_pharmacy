import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../CommonScreen/userinfo.dart';
import 'package:abyssinia_pharmacy/main.dart';
import '../ownerWindows/inventoryWindows/ExpiredItems.dart';
import '../ownerWindows/inventoryWindows/lowinventory.dart';
import 'package:abyssinia_pharmacy/User_Screen/ownerWindows/inventoryWindows/list.dart';
import '../ownerWindows/salesmgt/queuing.dart';


class pharmacist extends StatefulWidget {

  @override
  _pharmacistState createState() => _pharmacistState();
}

class _pharmacistState extends State<pharmacist> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(205, 41, 90, 1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              hoverColor: Colors.transparent,
              iconSize: 40,
              icon: const Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async{},
            ),
            Text(
              userinfo().inputData()!,
              style: const TextStyle(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () async {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FronpageWidget()));
              });
            },
            child: Row(
              children: const [
                Text("Logout",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
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
                        height: 110,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
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
                                        'Show Inventory List',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF0F1113),
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
                                          Icons.ads_click_outlined,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        label: const Text(''),
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
                        MaterialPageRoute(builder: (context) => waiting()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                      child: Container(
                        width: double.infinity,
                        height: 110,
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
                                      'Show Sales On Process',
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF0F1113),
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
                                          MaterialPageRoute(builder: (context) => waiting()),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.ads_click_outlined,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      label: const Text(''),
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
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Expireditem()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                      child: Container(
                        width: double.infinity,
                        height: 110,
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
                                      'Expired Items',
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF0F1113),
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
                                          MaterialPageRoute(builder: (context) => Expireditem()),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.ads_click_outlined,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      label: const Text(''),
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
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => lowinventory()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                      child: Container(
                        width: double.infinity,
                        height: 110,
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
                                      'Low Inventory List',
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF0F1113),
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
                                          MaterialPageRoute(builder: (context) => lowinventory()),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.ads_click_outlined,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      label: const Text(''),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

