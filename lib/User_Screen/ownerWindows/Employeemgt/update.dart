import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class updateemployeeWidget extends StatefulWidget {
  var FullName,
      MobileNumber,
      Address,
      EmployeeID,
      Role,
      Salary;
  DateTime JoinedDate;
  var DID;

  updateemployeeWidget({Key? mykey,
    this.FullName,
    this.MobileNumber,
    this.Address,
    this.EmployeeID,
    this.Role,
    this.Salary,
    this.DID,
    required this.JoinedDate
  }) : super(key: mykey);

  @override
  _updateemployeeWidgetState createState() => _updateemployeeWidgetState();
}

class _updateemployeeWidgetState extends State<updateemployeeWidget> {

  late String formatteddate1;
  late String formatteddate2;

  TextEditingController textController01 = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    textController01.text = getDate(widget.JoinedDate);
  }

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
    CollectionReference Employee= FirebaseFirestore.instance.collection('Employee');
    const snackbar = SnackBar(content: Text("Updated Successfully!"));
    const issnackbar = SnackBar(content: Text("Updating Failed"));
    const failed = SnackBar(content: Text("Deleting Failed"));
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
            size: 30,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: Text(
            'Update Employee Information',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'Assets/user2.jpg',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                  child: TextFormField(
                                    initialValue: '${widget.EmployeeID}',
                                    readOnly: true,
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Required *';
                                      }else{
                                        return null;
                                      }
                                    },
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Employee ID',
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
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: TextFormField(
                                controller: textController01,
                                readOnly: true,
                                //initialValue: '${widget.JoinedDate}',
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101)
                                  );

                                  if(pickedDate != null){
                                    formatteddate1 = DateFormat('MM/dd/yyyy').format(pickedDate);
                                    widget.JoinedDate = pickedDate;
                                    setState(() {
                                      textController01.text = formatteddate1;
                                    });
                                  }
                                },
                                validator: (formatteddate1){
                                  if(formatteddate1==null || formatteddate1.isEmpty){
                                    return 'Required *';
                                  }else{
                                    return null;
                                  }
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Joining Date',
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
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: TextFormField(
                                //controller: textController02,
                                initialValue: '${widget.FullName}',
                                onChanged: (value){
                                  widget.FullName = value;
                                },
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'Required *';
                                  }else{
                                    return null;
                                  }
                                },
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
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
                                style:  const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: TextFormField(
                                //controller: textController03,
                                initialValue: '${widget.Role}',
                                onChanged: (value){
                                  widget.Role = value;
                                },
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'Required *';
                                  }else{
                                    return null;
                                  }
                                },
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Role',
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
                                style:  const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: TextFormField(
                                //controller: textController04,
                                initialValue: '${widget.MobileNumber}',
                                onChanged: (value){
                                  widget.MobileNumber = int.parse(value);
                                },
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'Required *';
                                  }else if(!RegExp(r'^[0-9]').hasMatch(value)){
                                    return 'Incorrect value';
                                  } else{
                                    return null;
                                  }
                                },
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Mobile Number',
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
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: TextFormField(
                                //controller: textController05,
                                initialValue: '${widget.Salary}',
                                onChanged: (value){
                                  widget.Salary = int.parse(value);
                                },
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'Required *';
                                  }else if(!RegExp(r'^[0-9]').hasMatch(value)){
                                    return 'Incorrect value';
                                  }else{
                                    return null;
                                  }
                                },
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Salary',
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
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: TextFormField(
                                //controller: textController06,
                                initialValue: '${widget.Address}',
                                onChanged: (value){
                                  widget.Address = value;
                                },
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'Required *';
                                  }else{
                                    return null;
                                  }
                                },
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Address ',
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
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            FirebaseFirestore
                                .instance
                                .collection('Employee')
                                .doc(widget.DID)
                                .update({
                              'Full Name': widget.FullName,
                              'Mobile Number': widget.MobileNumber,
                              'Address': widget.Address,
                              'Employee ID': widget.EmployeeID,
                              'Role': widget.Role,
                              'Salary': widget.Salary,
                              'JoinedDate': widget.JoinedDate
                            })
                                .then((value) =>
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar))
                                .catchError(
                                    (error) =>
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(issnackbar));
                          }else{
                            ScaffoldMessenger.of(context)
                                .showSnackBar(issnackbar);
                          }
                        },
                        child: const Text("UPDATE"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: Colors.transparent, width: 1),
                          ),
                          fixedSize: const Size(130, 40,),
                          primary: Colors.blue,
                          textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                          ),

                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Delete Employee Record'),
                                content: const Text('Please Confirm Deletion'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      FirebaseFirestore
                                          .instance
                                          .collection('Employee')
                                          .doc(widget.DID).delete()
                                          .then((value) => Navigator.pop(context))
                                          .catchError(
                                              (error) => ScaffoldMessenger.of(context).showSnackBar(failed));
                                      Navigator.pop(alertDialogContext, true);
                                    },
                                    child: const Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                              false;
                        },
                        child: const Text("DELETE"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: Colors.transparent, width: 1),
                          ),
                          fixedSize: const Size(130, 40,),
                          primary: Colors.blue,
                          textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
