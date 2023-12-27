import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:abyssinia_pharmacy/User_Screen/Customer_Screen/OrderWindow.dart';

import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth auth = FirebaseAuth.instance;




class customermgt extends StatefulWidget {
  @override
  _customermgtState createState() => _customermgtState();
}

class _customermgtState extends State<customermgt> {

  final formKey = GlobalKey<FormState>();
  var reply='';
  final Stream<QuerySnapshot> ListOrders = FirebaseFirestore.instance
      .collection('Customers')
      .snapshots();
  //.where('Reply', isEqualTo: '')

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
    const issnackbar = SnackBar(content: Text("Operation Failed"));
    const snackbardelete = SnackBar(content: Text("Deleted Successfully"));
    const sent = SnackBar(content: Text("Reply Sent Successfully!"));
    const isnotsent = SnackBar(content: Text("Sending Failed"));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Management ',
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
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
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
                            title: Text((index+1).toString() + ". Customer Email: " + data.docs[index]['Email'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text("    Joined Date: " + getDate(data.docs[index]['JoinedDate'].toDate()),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                                  child: TextFormField(
                                    //controller: textController7,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      label: Text('Reply',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                    onChanged: (value){
                                      reply= value;
                                    },
                                    maxLines: 5,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed:(){
                                            FirebaseFirestore
                                                .instance
                                                .collection('FeedBack')
                                                .doc(data.docs[index].id)
                                                .update({
                                              'Reply': reply,
                                            })
                                                .then((value) => ScaffoldMessenger.of(context)
                                                .showSnackBar(sent))
                                                .catchError(
                                                    (error) => ScaffoldMessenger.of(context)
                                                        .showSnackBar(isnotsent));
                                        },
                                        child: const Text(
                                            "Send Reply"
                                        )
                                    ),
                                    ElevatedButton(
                                        onPressed:(){
                                          FirebaseFirestore
                                              .instance
                                              .collection('Customer')
                                              .doc(data.docs[index].id).delete()
                                              .then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbardelete))
                                              .catchError(
                                                  (error) => ScaffoldMessenger.of(context).showSnackBar(issnackbar));
                                        },
                                        child: const Text(
                                            "Delete User"
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
      ),
    );
  }
}

