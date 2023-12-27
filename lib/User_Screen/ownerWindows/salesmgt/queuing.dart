import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:abyssinia_pharmacy/User_Screen/Customer_Screen/OrderWindow.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
final FirebaseAuth auth = FirebaseAuth.instance;




class waiting extends StatefulWidget {
  @override
  _waitingState createState() => _waitingState();
}

class _waitingState extends State<waiting> {
  var rng = new Random();
  var taransactionID = <int>[];
  final Stream<QuerySnapshot> ListOrders = FirebaseFirestore.instance
      .collection('Orders')
      .where('Status', isEqualTo: "Not Paid")
      .snapshots();
  CollectionReference SalesMade= FirebaseFirestore.instance.collection('Sales');

  getDate(DateTime inputval){
    String processedDate;
    processedDate = inputval.month.toString() +
        '/' +
        inputval.day.toString() +
        '/' +
        inputval.year.toString();
    return processedDate;
  }

  @override
  Widget build(BuildContext context) {
    const snackbar = SnackBar(content: Text("Operation Successfully!"));
    const issnackbar = SnackBar(content: Text("Operation Failed"));
    const snackbardelete = SnackBar(content: Text("Deleted Successfully"));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Waiting List',
          style: TextStyle(
            fontSize: 18,

          ),
        ),
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      body: Container(
        child: Card(
          child: StreamBuilder<QuerySnapshot>(
            stream: ListOrders,
            builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot
                ){
              if(snapshot.hasError){
                return Center(
                  child: Image.asset("Assets/emptysearch.jpg"),
                );
              }
              if(!snapshot.hasData){
                return Center(
                  child: Image.asset("Assets/emptysearch.jpg"),
                );
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
                    return Container(
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
                      child: ListTile(
                          title: Text("Customer Email: " + data.docs[index]['Email'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Name: " + data.docs[index]['Product Name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text("Quantity: " + data.docs[index]['Quantity'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text("Total Cost: " + data.docs[index]['Total Cost'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text("Date: " + getDate(data.docs[index]['Date'].toDate()).toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text("Status: " + data.docs[index]['Status'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      onPressed:(){
                                        var code=rng.nextInt(10000000);
                                        if(taransactionID.contains(code)){
                                          print("true");
                                          code=rng.nextInt(10000000);
                                        }else{
                                          print(false);
                                          taransactionID.add(code);
                                        }
                                        FirebaseFirestore
                                            .instance
                                            .collection('Orders')
                                            .doc(data.docs[index].id)
                                            .update({'Status': 'Paid', 'Transaction ID': code})
                                            .then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar))
                                            .catchError(
                                                (error) => ScaffoldMessenger.of(context).showSnackBar(issnackbar));
                                        print(taransactionID);
                                        UserorderWidget.enteredValue.value= code.toString();

                                        SalesMade.add({'Product Name': data.docs[index]['Product Name'],
                                          'Date': DateFormat('MM/dd/yyyy').format(data.docs[index]['Date'].toDate()),
                                          'Quantity': data.docs[index]['Quantity'],
                                          'Total Cost': data.docs[index]['Total Cost'],
                                          'Transaction ID': code})
                                            .then((value) => print("Done!"))
                                            .catchError(
                                                (error) => print("Failed"));
                                        //UserorderWidget(ID: code);
                                        /*FirebaseFirestore
                                            .instance
                                            .collection('Products')
                                            .doc()
                                            .update('Name' , data.docs[index]['Product Name']);
                                         */
                                      },
                                      child: const Text(
                                          "Paid"
                                      )
                                  ),
                                  ElevatedButton(
                                      onPressed:(){
                                        FirebaseFirestore
                                            .instance
                                            .collection('Orders')
                                            .doc(data.docs[index].id).delete()
                                            .then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbardelete))
                                            .catchError(
                                                (error) => ScaffoldMessenger.of(context).showSnackBar(issnackbar));
                                      },
                                      child: const Text(
                                          "Delete Order"
                                      )
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          )
                      ),
                    );
                  });
            },
          ),),
      ),
    );
  }
}

