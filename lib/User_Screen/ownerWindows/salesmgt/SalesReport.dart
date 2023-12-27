import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class salesreport extends StatefulWidget {
  //const Availability({Key key}) : super(key: key);

  @override
  _salesreportState createState() => _salesreportState();
}

class _salesreportState extends State<salesreport> {

  TextEditingController textController = TextEditingController();
  late String formatteddate1= "";
  late double TotalSales=0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late DateTime searchString= DateTime.now();

  @override
  void initState() {
    textController.text ='';
    super.initState();
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
                                          readOnly: true,
                                          obscureText: false,
                                          onTap: () async {
                                            DateTime? pickedDate = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2101)
                                            );

                                            if(pickedDate != null){
                                              formatteddate1 = DateFormat('MM/dd/yyyy').format(pickedDate);
                                              searchString = pickedDate;
                                              print(pickedDate);
                                              setState(() {
                                                textController.text = formatteddate1;
                                              });
                                            }
                                          },
                                          decoration: const InputDecoration(
                                            label: Text('Pick A Date'),
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
                child: Card(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                          .collection("Sales")
                          .where('Date', isEqualTo: formatteddate1)
                          .snapshots(),
                    builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot
                        ){
                      if(snapshot.hasError){
                        return const Text('Something went wrong');
                      }
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Container(
                          child: const Center(
                            child: SpinKitThreeBounce(
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }
                      final data =  snapshot.requireData;
                      return ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            return ListTile(
                                //TotalSales+=document['Total Cost'];
                                title: Text("Transaction ID: " + data.docs[index]['Transaction ID'].toString()),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product Name: "+ data.docs[index]['Product Name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Quantity: "+ data.docs[index]['Quantity'].toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Total Cost: "+ data.docs[index]['Total Cost'].toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Divider(),
                                  ],
                                )
                            );
                          });
                    },
                  ),),
              ),
              //Text("Total Sales For This Day Is= "+TotalSales.toString()),
            ],
          ),
        ],
      ),
    );
  }
}

