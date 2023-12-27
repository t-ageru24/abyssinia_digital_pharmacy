import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';


class AddemployeeWidget extends StatefulWidget {

  @override
  _AddemployeeWidgetState createState() => _AddemployeeWidgetState();
}

class _AddemployeeWidgetState extends State<AddemployeeWidget> {

  var rng = new Random();
  var ID = <int>[];
  late String CompleteID="";

  late String formatteddate1;
  late String formatteddate2;
  late DateTime JoinedDate;

  var textController1,
      textController2,
      textController3,
      textController4,
      textController5,
      textController6,
      textController7,
      textController8;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController textController01,
      textController02,
      textController03,
      textController04,
      textController05,
      textController06,
      textController07,
      textController08;

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
  void initState() {
    super.initState();
    textController01 = TextEditingController();
    textController02 = TextEditingController();
    textController03 = TextEditingController();
    textController04 = TextEditingController();
    textController05 = TextEditingController();
    textController06 = TextEditingController();
    textController07 = TextEditingController();
    textController08 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference Employee= FirebaseFirestore.instance.collection('Employee');
    const snackbar = SnackBar(content: Text("Added Successfully!"));
    const issnackbar = SnackBar(content: Text("Adding Failed"));
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.white,
            size: 30,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: Text(
            'Add New Employee',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
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
                                    controller: textController01,
                                    readOnly: true,
                                    onTap: (){
                                      var code=rng.nextInt(1000);
                                      if(ID.contains(code)){
                                        print("true");
                                        code=rng.nextInt(1000);
                                      }else{
                                        print(false);
                                        ID.add(code);
                                        String IDDigits = code.toString(), YearNow = DateTime.now().year.toString();
                                        CompleteID = "Emp/${IDDigits}/${YearNow}";
                                        textController01.text = CompleteID;
                                      }
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
                                controller: textController02,
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101)
                                  );

                                  if(pickedDate != null){
                                    formatteddate1 = DateFormat('MM/dd/yyyy').format(pickedDate);
                                    JoinedDate = pickedDate;
                                    setState(() {
                                      textController02.text = formatteddate1;
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
                                autofocus: false,
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
                                keyboardType: TextInputType.datetime,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: TextFormField(
                                controller: textController03,
                                onChanged: (value){
                                  textController3= value;
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
                                controller: textController08,
                                onChanged: (value){
                                  textController8= value;
                                },
                                validator: MultiValidator(
                                    [
                                      EmailValidator (errorText: "Invalid Email Address"),
                                      RequiredValidator(errorText: 'Email Address Is Required'),
                                    ]
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
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
                                controller: textController04,
                                onChanged: (value){
                                  textController4= value;
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
                                controller: textController05,
                                onChanged: (value){
                                  textController5= value;
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
                                controller: textController06,
                                onChanged: (value){
                                  textController6= value;
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
                                autofocus: true,
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
                                controller: textController07,
                                onChanged: (value){
                                  textController7= value;
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
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if(formKey.currentState!.validate()){
                          Employee.add({'Employee ID': CompleteID,
                            'JoinedDate': JoinedDate,
                            'Full Name': textController3,
                            'Role': textController4,
                            'Mobile Number': textController5,
                            'Salary' :textController6,
                            'Address': textController7,
                            'Email': textController8})
                              .then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar))
                              .catchError(
                                  (error) => ScaffoldMessenger.of(context).showSnackBar(issnackbar));
                          FirebaseAuth.instance.
                          createUserWithEmailAndPassword(
                            email: textController08.text.toLowerCase(),
                            password: '123456',).then((value) {
                            const snackbar = SnackBar(content: Text("Account Created Successfully :)"));
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          }).onError((error, stackTrace) {
                            ScaffoldMessenger.of(context).showSnackBar(issnackbar);
                          });
                        }else{
                          print("operation failed");
                        }
                      },
                      child: const Text("ADD"),
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
                        setState(() {
                          textController01.clear();
                          textController02.clear();
                          textController03.clear();
                          textController04.clear();
                          textController05.clear();
                          textController06.clear();
                          textController07.clear();
                        });
                      },
                      child: const Text("CLEAR"),
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
    );
  }
}
