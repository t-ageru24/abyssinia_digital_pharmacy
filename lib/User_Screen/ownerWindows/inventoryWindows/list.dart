import 'package:abyssinia_pharmacy/User_Screen/ownerWindows/inventoryWindows/update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class list extends StatefulWidget {
  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {

  getDate(DateTime inputval){
    String processedDate;
    processedDate =  inputval.month.toString() +
        '/' +
            inputval.day.toString() +
        '/' +
            inputval.year.toString();
    return processedDate;
  }

  final Stream<QuerySnapshot> ProductsList = FirebaseFirestore.instance.collection('Products').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Inventory',
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
            stream: ProductsList,
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
                      title: Text(data.docs[index]['Name']),
                      subtitle: Text(data.docs[index]['Description']),
                      trailing: ElevatedButton(
                        child: const Text('Show Details'),
                        onPressed: (){
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
                      )
                    );
                  });
          },
        ),),
      ),
    );
  }
}
