import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'MainCustomer.dart';


class FeedbackWidget extends StatefulWidget {
  //const FeedbackWidget({Key key}) : super(key: key);

  @override
  _FeedbackWidgetState createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String email= inputData()!, comment="", reply="";
  late DateTime date = DateTime.now();
  late TextEditingController textController3;
  late TextEditingController textController1;
  final formkey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    textController1= TextEditingController();
    textController3 = TextEditingController();
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.month}-${dateParse.day}-${dateParse.year}";
    return formattedDate.toString();
  }

  String? inputData() {
    final User? user = auth.currentUser;
    final uemail = user?.email;
    return uemail;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference FeedBack= FirebaseFirestore.instance.collection('FeedBack');
    const snackbar = SnackBar(content: Text("Your Feed Back Has Been Sent, Thank You!"));
    const issnackbar = SnackBar(content: Text("Sending Failed, Please Try Again"));
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(205, 41, 90, 1),
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
        title: const Align(
          alignment: AlignmentDirectional(-0.35, 0),
          child: Text(
            'FeedBack',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lexend Deca',
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromRGBO(56, 173, 174, 1), Color.fromRGBO(205, 41, 90, 1)]
            )
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, -0.45),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Text(
                        'We want to know what you thought of your experience at Abyssinia pharmacy system management. so we\'d love to hear your feedback',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 50, 10, 10),
                      child: TextFormField(
                        controller: textController1,
                        enabled: false,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: inputData()!,
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
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: TextFormField(
                        enabled: false,
                        onChanged: (value) => EasyDebounce.debounce(
                          'textController2',
                          const Duration(milliseconds: 2000),
                              () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: getCurrentDate(),
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
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.94,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: textController3,
                                          onChanged: (value){
                                            comment=value;
                                          },
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Your Comment Here',
                                            hintStyle: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20, 32, 20, 12),
                                          ),
                                          style: const TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 7,
                                          validator: (value){
                                            if(value==null || value.isEmpty){
                                              return "Field Is Empty";
                                            }else{
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: ElevatedButton(
                        onPressed: (){
                          if(formkey.currentState!.validate()){
                            FeedBack.add({'UserEmail': email,
                              'Date': date,
                              'Comment': comment,
                              'Reply': reply
                            })
                                .then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar))
                                .catchError(
                                    (error) => ScaffoldMessenger.of(context).showSnackBar(issnackbar));
                          }else{
                            print("operation failed");
                          }
                        },
                        child: const Text(
                            "Send",
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.transparent, width: 1),
                          ),
                          fixedSize: const Size(270, 50,),
                          primary: Colors.blue,
                          elevation: 3,
                          textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
