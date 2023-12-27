import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth auth = FirebaseAuth.instance;




class ListPurchase extends StatefulWidget {
  @override
  _ListPurchaseState createState() => _ListPurchaseState();
}

class _ListPurchaseState extends State<ListPurchase> {

  final Stream<QuerySnapshot> ListPurchase = FirebaseFirestore.instance
      .collection('Orders')
      .where('Email', isEqualTo: auth.currentUser?.email)
      .where('Transaction ID', isGreaterThan: 0)
      .snapshots();

  getDate(DateTime inputval){
    String processedDate;
    processedDate = inputval.year.toString() +
    '-' +
    inputval.month.toString() +
    '-' +
    inputval.day.toString();
    return processedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(205, 41, 90, 1),
        title: const Text('List of Purchases Made',
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
            stream: ListPurchase,
            builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot
                ){
              if(snapshot.hasError){
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
                      height: 100,
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
                          title: Text("Transaction ID: " + data.docs[index]['Transaction ID'].toString(),
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
                              Text("Total Cost: " + data.docs[index]['Total Cost'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text("Date: " + getDate(data.docs[index]['Date'].toDate()),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text("Status: " + data.docs[index]['Status'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 1,
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
