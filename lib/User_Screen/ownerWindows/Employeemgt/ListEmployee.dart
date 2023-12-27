import 'package:abyssinia_pharmacy/User_Screen/ownerWindows/Employeemgt/update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class list extends StatefulWidget {
  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {

  final Stream<QuerySnapshot> Employeelist = FirebaseFirestore.instance.collection('Employee').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Employee',
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
            stream: Employeelist,
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
                          title: Text("Name: " + data.docs[index]['Full Name'],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text("ID: " + data.docs[index]['Employee ID'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Role: " + data.docs[index]['Role'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                            ],
                          ),
                          trailing: ElevatedButton(
                            child: const Text('UPDATE'),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      updateemployeeWidget(
                                        FullName: data.docs[index]['Full Name'],
                                        MobileNumber: data.docs[index]['Mobile Number'],
                                        Address: data.docs[index]['Address'],
                                        EmployeeID: data.docs[index]['Employee ID'],
                                        Role: data.docs[index]['Role'],
                                        Salary: data.docs[index]['Salary'],
                                        JoinedDate: data.docs[index]['JoinedDate'].toDate(),
                                        DID: data.docs[index].id
                                      )));
                            },
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
