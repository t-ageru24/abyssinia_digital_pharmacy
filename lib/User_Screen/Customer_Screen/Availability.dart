import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'MainCustomer.dart';
import 'OrderWindow.dart';

class Availability extends StatefulWidget {
  //const Availability({Key key}) : super(key: key);

  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String searchString="";
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 108,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xFFF1F4F8),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    IconButton(
                                      color: Colors.transparent,
                                      icon: const Icon(
                                        Icons.chevron_left_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      iconSize: 25,
                                      onPressed: () async {
                                        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainCustomer()));
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: TextFormField(
                                          controller: textController,
                                          obscureText: false,
                                          onChanged: (value){
                                            setState(() {
                                              searchString = value.toUpperCase();
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            labelText:
                                            'Search Medicine Name ...',
                                            labelStyle: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.normal,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: const Color.fromRGBO(224, 227, 231, 1)),
                                        ),
                                        child: IconButton(
                                          iconSize: 50,
                                          icon: const Icon(
                                            Icons.search_rounded,
                                            color: Color(0xFF95A1AC),
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
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
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Products")
                          .where("searchIndex",arrayContains: searchString)
                          .where('Quantity', isGreaterThan: 1)
                          .snapshots(),
                        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                          if (snapshot.hasError){
                            return Center(
                              child: Image.asset("Assets/emptysearch.jpg"),
                            );
                          }
                          switch (snapshot.connectionState){
                            case ConnectionState.waiting:
                              return const Center(
                                child: Center(
                                  child: SpinKitThreeBounce(
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            default:
                              return ListView(
                                shrinkWrap: true,
                                children: snapshot.data!.docs.map((DocumentSnapshot document){
                                  return ListTile(
                                    title: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 3),
                                        child: Container(
                                          width: double.infinity,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(224, 227, 231, 1),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.white,
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                child: Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(8, 1, 0, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          document['Name'] + " is Available in out Pharmacy!",
                                                          style: const TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Product Name: "+ document['Name'],
                                                          style: const TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Price: "+ document['MRP'].toString(),
                                                          style: const TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                onTap: (){
                                                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => UserorderWidget()));
                                                },
                                              ),
                                              Spacer(),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                      child: InkWell(
                                                        child: const Icon(
                                                          Icons.chevron_right_outlined,
                                                          color: Color(0xFF95A1AC),
                                                          size: 24,
                                                        ),
                                                        onTap: (){
                                                          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => UserorderWidget()));
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  );
                                }).toList(),
                              );
                          }
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
