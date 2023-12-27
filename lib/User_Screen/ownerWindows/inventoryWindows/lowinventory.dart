import 'package:abyssinia_pharmacy/User_Screen/ownerWindows/inventoryWindows/update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class lowinventory extends StatefulWidget {
  @override
  _lowinventoryState createState() => _lowinventoryState();
}

class _lowinventoryState extends State<lowinventory> {

  SnackBar failed = SnackBar(content: Text("Operation Failed"));
  final Stream<QuerySnapshot> lowlist = FirebaseFirestore
      .instance
      .collection('Products')
      .where('Quantity' , isLessThan: 5)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Low Inventory List',
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
            stream: lowlist,
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
                        title: Text("Product Name: " + data.docs[index]['Name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quantity: " + data.docs[index]['Quantity'].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text("Purchase Date: " + DateFormat('MM/dd/yyyy').format(data.docs[index]['Purchase Date'].toDate()),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Divider(),
                            const SizedBox(
                              height: 1,
                            )
                          ],
                        ),
                        trailing: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => update(
                                  Name: data.docs[index]['Name'],
                                  Quantity: data.docs[index]['Quantity'],
                                  MRP: data.docs[index]['MRP'],
                                  PackedType: data.docs[index]['PackedType'],
                                  PurchasePrice: data.docs[index]['PurchasePrice'],
                                  Description: data.docs[index]['Description'],
                                  ExpiryDate: data.docs[index]['ExpiryDate'].toDate(),
                                  DateOfPurchased: data.docs[index]['Purchase Date'].toDate(),
                                  DID: data.docs[index].id
                              )),
                            );
                          },
                          child: const Icon(
                            Icons.update,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),),
      ),
    );
  }
}

