import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'mainmenu.dart';

class addnew extends StatefulWidget {

  @override
  _addnewState createState() => _addnewState();
}

class _addnewState extends State<addnew> {

  TextEditingController textController5 = TextEditingController();
  TextEditingController textController6 = TextEditingController();
  final formkey = GlobalKey<FormState>();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var Name='',
      Quantity=0,
      MRP=0,
      PurchasePrice=0,
      PackedType='',
      Description='';
  late DateTime DOP, ExpiryDate;
  late String formatteddate1;
  late String formatteddate2;

  @override
  void initState(){
    textController5.text = "";
    textController6.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    CollectionReference Products= FirebaseFirestore.instance.collection('Products');
    const snackbar = SnackBar(content: Text("Added Successfully!"));
    const issnackbar = SnackBar(content: Text("Adding Failed"));
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF295DE7),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: const Text(
          'Add New Medicine',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 19,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Divider(),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                      child: TextFormField(
                        //controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          label: Text('Medicine Name'),
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
                          contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        ),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                        onChanged: (value){
                          Name=value;
                        },
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Required *';
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                      child: TextFormField(
                        //controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          label: Text('Stock Quantity'),
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
                          Quantity= int.parse(value);
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
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4, 10, 10, 10),
                      child: TextFormField(
                        //controller: textController3,
                        obscureText: false,
                        decoration: InputDecoration(
                          label: Text('Maximum Retail Price'),
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
                        keyboardType: TextInputType.number,
                        onChanged: (value){
                          MRP= int.parse(value);
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
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                      child: TextFormField(
                        //controller: textController4,
                        obscureText: false,
                        decoration: InputDecoration(
                          label: Text('Purchase Price'),
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
                        keyboardType: TextInputType.number,
                        onChanged: (value){
                          PurchasePrice= int.parse(value);
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
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                      child: TextFormField(
                        controller: textController5,
                        readOnly: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          label: Text('Date of Purchased'),
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
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101)
                          );

                          if(pickedDate != null){
                            formatteddate1 = DateFormat('MM/dd/yyyy').format(pickedDate);
                            DOP = pickedDate;
                            setState(() {
                              textController5.text = formatteddate1;
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
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: TextFormField(
                        readOnly: true,
                        controller: textController6,
                        obscureText: false,
                        decoration: InputDecoration(
                          label: Text('Expiry Date'),
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
                         onTap: () async {
                           DateTime? pickedDate = await showDatePicker(
                               context: context,
                               initialDate: DateTime.now(),
                               firstDate: DateTime(2000),
                               lastDate: DateTime(2101)
                           );

                           if(pickedDate != null){
                             formatteddate2 = DateFormat('MM/dd/yyyy').format(pickedDate);
                             ExpiryDate = pickedDate;
                             setState(() {
                               textController6.text = formatteddate2;
                             });
                           }
                         },
                        validator: (formatteddate2){
                          if(formatteddate2==null || formatteddate2.isEmpty){
                            return 'Required *';
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                child: TextFormField(
                  //controller: textController7,
                  obscureText: false,
                  decoration: InputDecoration(
                    label: Text('Packed Type'),
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
                    PackedType= value;
                  },
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Required *';
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                child: TextFormField(
                  //controller: textController7,
                  obscureText: false,
                  decoration: InputDecoration(
                    label: Text('Description'),
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
                    Description= value;
                  },
                ),
              ),
              //Padding(
                //padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              Container(
                child: ElevatedButton(
                  child: const Text('Save', ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(75, 57, 239, 100),
                    fixedSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )
                  ),
                  onPressed: (){
                    if(formkey.currentState!.validate()){
                      List<String> splitList= Name.split(" ");

                      List<String> indexList =[];

                      for(int i=0; i< splitList.length; i++){
                        for(int y=1; y<splitList[i].length+1; y++){
                          indexList.add(splitList[i].substring(0,y).toUpperCase());
                        }
                      }
                      //print();
                      Products.add({'Name': Name,
                        'searchIndex': indexList,
                        'Quantity': Quantity,
                        'MRP': MRP,
                        'PackedType': PackedType,
                        'PurchasePrice': PurchasePrice,
                        'Description' :Description,
                        'ExpiryDate': ExpiryDate,
                        'Purchase Date': DOP})
                          .then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar))
                          .catchError(
                              (error) => ScaffoldMessenger.of(context).showSnackBar(issnackbar));
                    }else{
                      print("operation failed");
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                child: ElevatedButton(
                  child: const Text('Back', ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(75, 57, 239, 100),
                      fixedSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          )
        ),
      ),
    );
  }
}
