import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Mark extends StatefulWidget {
  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends State<Mark> {
  CollectionReference Attendance= FirebaseFirestore.instance.collection('Attendance');
  SnackBar snackbar = SnackBar(content: Text("Marked Successfully!"));
  SnackBar issnackbar = SnackBar(content: Text("Marking Failed"));
  SnackBar notselected = SnackBar(content: Text("Value Not Selected"));
  final Stream<QuerySnapshot> Employeelist = FirebaseFirestore.instance.collection('Employee').snapshots();
  late String _radiovalue="";

  getDate(DateTime inputval){
    String processedDate;
    processedDate =  inputval.month.toString() +
        '/' +
        inputval.day.toString() +
        '/' +
        inputval.year.toString();
    return processedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mark Attendance',
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
                      height: 130,
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
                              Text(
                                  "ID: " + data.docs[index]['Employee ID'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(""
                                  "Role: " + data.docs[index]['Role'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.w500)),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                child: const Text('Mark Attendance'),
                                onPressed: (){
                                  showDialog<bool>(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return StatefulBuilder(
                                        builder: (context, setState) => AlertDialog(
                                          title: Text('Please Mark ${data.docs[index]['Full Name']} Attendance For ${getDate(DateTime.now())}. Then Click Mark'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget> [
                                              ListTile(
                                                title: const Text('Present'),
                                                leading: Radio(
                                                  value: "Present",
                                                  groupValue: _radiovalue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _radiovalue = value.toString();
                                                    });
                                                  },
                                                ),
                                              ),
                                              ListTile(
                                                title: const Text('Permission'),
                                                leading: Radio(
                                                  value: "Permission",
                                                  groupValue: _radiovalue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _radiovalue = value.toString();
                                                    });
                                                  },
                                                ),
                                              ),
                                              ListTile(
                                                title: const Text('Absent'),
                                                leading: Radio(
                                                  value: "Absent",
                                                  groupValue: _radiovalue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _radiovalue = value.toString();
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                if(_radiovalue!=""){
                                                  Attendance.add({'Full Name': data.docs[index]['Full Name'],
                                                    'Employee ID': data.docs[index]['Employee ID'],
                                                    'Date': DateFormat('MM/dd/yyyy').format(DateTime.now()),
                                                    'Status': _radiovalue})
                                                      .then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar))
                                                      .catchError(
                                                          (error) => ScaffoldMessenger.of(context).showSnackBar(issnackbar));
                                                }else{
                                                  ScaffoldMessenger.of(context).showSnackBar(notselected);
                                                }
                                                _radiovalue="";
                                                Navigator.pop(alertDialogContext, true);
                                              },
                                              child: const Text('Mark'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              )
                            ],
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

