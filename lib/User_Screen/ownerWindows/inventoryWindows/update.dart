import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class update extends StatefulWidget {
  var Name;

  int Quantity, MRP;

  var PackedType;

  int PurchasePrice;

  var    Description;
  DateTime ExpiryDate, DateOfPurchased;
  var DID;

  update({Key? mykey,
    this.Name,
    required this.Quantity,
    required this.MRP,
    this.PackedType,
    required this.PurchasePrice,
    this.Description,
    required this.ExpiryDate,
    required this.DateOfPurchased,
    this.DID
  }) : super(key: mykey);

  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update> {

  TextEditingController textController5 = TextEditingController();
  TextEditingController textController6 = TextEditingController();
  final formkey = GlobalKey<FormState>();

  late String formatteddate1;
  late String formatteddate2;

  @override
  void initState(){
    textController5.text = getDate(widget.DateOfPurchased);
    textController6.text = getDate(widget.ExpiryDate);
    super.initState();
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

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    const snackbar = SnackBar(content: Text("Updated Successfully!"));
    const issnackbar = SnackBar(content: Text("Update Failed"));
    const failed = SnackBar(content: Text("Operation Failed"));
    const snackbardelete = SnackBar(content: Text("Deleted Successfully"));
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF295DE7),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: const Text(
          'Update Inventory Data',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 19,
          ),
        ),
        actions:[
          InkWell(
            onTap: (){
              FirebaseFirestore
                  .instance
                  .collection('Products')
                  .doc(widget.DID).delete()
                  .then((value) => Navigator.pop(context))
                  .catchError(
                      (error) => ScaffoldMessenger.of(context).showSnackBar(failed));
            },
            child: const Icon(
              Icons.delete,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
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
                          initialValue: '${widget.Name}',
                          obscureText: false,
                          decoration: InputDecoration(
                            label: const Text('Medicine Name'),
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
                            widget.Name = value;
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
                          initialValue: '${widget.Quantity}'.toString(),
                          obscureText: false,
                          decoration: InputDecoration(
                            label: const Text('Stock Quantity'),
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
                            widget.Quantity = int.parse(value);
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
                          initialValue: '${widget.MRP}'.toString(),
                          obscureText: false,
                          decoration: InputDecoration(
                            label: const Text('Maximum Retail Price'),
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
                            widget.MRP = int.parse(value);
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
                          initialValue: '${widget.PurchasePrice}'.toString(),
                          obscureText: false,
                          decoration: InputDecoration(
                            label: const Text('Purchase Price'),
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
                            widget.PurchasePrice = int.parse(value);
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
                          //initialValue: '${widget.DateOfPurchased}',
                          obscureText: false,
                          decoration: InputDecoration(
                            label: const Text('Date of Purchased'),
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
                              widget.DateOfPurchased = pickedDate;
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
                          controller: textController6,
                          readOnly: true,
                          //initialValue: '${widget.ExpiryDate}',
                          obscureText: false,
                          decoration: InputDecoration(
                            label: const Text('Expiry Date'),
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
                              widget.ExpiryDate = pickedDate;
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
                    initialValue: '${widget.PackedType}',
                    obscureText: false,
                    decoration: InputDecoration(
                      label: const Text('Packed Type'),
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
                      widget.PackedType = value;
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
                    initialValue: '${widget.Description}',
                    obscureText: false,
                    maxLines: 3,
                    decoration: InputDecoration(
                      label: const Text('Description'),
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
                      widget.Description = value;
                    },
                  ),
                ),
                //Padding(
                //padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                Container(
                  child: ElevatedButton(
                    child: const Text('Update', ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(75, 57, 239, 100),
                        fixedSize: const Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        FirebaseFirestore
                            .instance
                            .collection('Products')
                            .doc(widget.DID)
                            .update({
                          'Name': widget.Name,
                          'Quantity': widget.Quantity,
                          'MRP': widget.MRP,
                          'Purchase Date': widget.DateOfPurchased,
                          'PackedType': widget.PackedType,
                          'PurchasePrice': widget.PurchasePrice,
                          'Description': widget.Description,
                          'ExpiryDate': widget.ExpiryDate
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
                    }
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: ElevatedButton(
                    child: const Text('Cancel', ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(75, 57, 239, 100),
                        fixedSize: const Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
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
