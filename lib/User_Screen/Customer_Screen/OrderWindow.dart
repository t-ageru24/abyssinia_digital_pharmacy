import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ListPurchase.dart';
import 'MainCustomer.dart';

class UserorderWidget extends StatefulWidget {
  //var ID;
  static ValueNotifier<String> enteredValue = ValueNotifier('Waiting...');

  // UserorderWidget({Key? mykey,
  //   this.ID,
  // }) : super(key: mykey);

  @override
  _UserorderWidgetState createState() => _UserorderWidgetState();
}

class _UserorderWidgetState extends State<UserorderWidget> {

  SnackBar snackbar = SnackBar(content: Text("To Be Added In The Future"));
  SnackBar snackbarvalidate = const SnackBar(content: Text("Operation Failed"));
  SnackBar paycash = const SnackBar(content: Text("Please Pay The Total Amount To Owner"));
  late final Stream<QuerySnapshot> ProductsList = FirebaseFirestore.instance
      .collection('Products')
      .where('Quantity', isGreaterThanOrEqualTo: 1)
      .snapshots();
  final formkey = GlobalKey<FormState>();
  var selectedItem;
  late int selectedItemPrice = 0, quantity = 0, total = 0;
  String paymenttype = "Waiting...";

  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  String? inputData() {
    final User? user = auth.currentUser;
    final uemail = user?.email;
    return uemail;
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.month}-${dateParse.day}-${dateParse.year}";
    return formattedDate.toString();
  }

    @override
  Widget build(BuildContext context) {
      CollectionReference Ordersadd= FirebaseFirestore.instance.collection('Orders');
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(205, 41, 90, 1),
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
          'My Order',
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF1F4F8),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromRGBO(56, 173, 174, 1), Color.fromRGBO(205, 41, 90, 1)]
            )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Customer',
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      inputData()!,
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Date',
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      getCurrentDate(),
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.96,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x3A000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 50,
                                              width: 190,
                                              child: StreamBuilder<QuerySnapshot>(
                                                  stream: ProductsList,
                                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                                    if(snapshot.hasError){
                                                      return const Text('Something went wrong');
                                                    }
                                                    if(snapshot.connectionState == ConnectionState.waiting){
                                                      return const Text('Waiting...');
                                                    }
                                                    if (!snapshot.hasData) {
                                                      return const Text("Loading...");
                                                    } else {
                                                      List<DropdownMenuItem> ListProduct = [];
                                                      for (int i = 0; i < snapshot.requireData.size; i++) {
                                                        DocumentSnapshot snap = snapshot.requireData.docs[i];
                                                        ListProduct.add(
                                                          DropdownMenuItem(
                                                            child: Text(
                                                              snap.get('Name'),
                                                              style: TextStyle(color: Colors.black),
                                                            ),
                                                            value: "${snap.get('Name')}",
                                                          ),
                                                        );
                                                      }
                                                      return Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          //SizedBox(width: 50.0),
                                                          DropdownButton<dynamic>(
                                                            items: ListProduct,
                                                            onChanged: (Value) {
                                                              setState(() {
                                                                selectedItem = Value;
                                                                for (int i = 0; i < snapshot.requireData.size; i++){
                                                                  if(snapshot.requireData.docs[i].get('Name') == selectedItem){
                                                                    selectedItemPrice = snapshot.requireData.docs[i].get('MRP');
                                                                  }
                                                                }
                                                              });
                                                            },
                                                            value: selectedItem,
                                                            isExpanded: false,
                                                            hint: new Text(
                                                              "Choose a Product",
                                                              style: TextStyle(color: Colors.black),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }
                                                    throw '';
                                                  }),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: textController,
                                              onChanged: (value) =>
                                                  EasyDebounce.debounce(
                                                    'textController',
                                                    const Duration(milliseconds: 2000),
                                                        () => setState(() {
                                                          quantity = int.parse(value);
                                                          total = (selectedItemPrice*quantity);
                                                        }),
                                                  ),
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
                                              decoration: const InputDecoration(
                                                labelText: 'Quantity',
                                                labelStyle: TextStyle(
                                                  fontSize: 16,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topLeft: Radius.circular(4.0),
                                                    topRight: Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topLeft: Radius.circular(4.0),
                                                    topRight: Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: Color.fromRGBO(87, 99,108, 100)
                                              ),
                                              maxLines: 1,
                                              keyboardType: TextInputType.number,
                                              //validator: ,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.96,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x3A000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Order Summary',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Subtotal',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        selectedItemPrice.toString(),
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Shipping',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        '0',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Total',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        total.toString(),
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 2,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                          color: Colors.transparent,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                                child: InkWell(
                                  onTap: (){
                                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'Assets/HelloCash.png',
                                      width: 100,
                                      height: 44,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'Assets/cbe2.jpeg',
                                    width: 100,
                                    height: 44,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    paymenttype = "Cash";
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'Assets/cash.png',
                                    width: 100,
                                    height: 44,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable: UserorderWidget.enteredValue,
                                    builder: (BuildContext context, String newValue, Widget? child){
                                      return Text(
                                        newValue,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Payment Status: ' + paymenttype,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                    child: ElevatedButton(
                                      child: const Text(
                                        'Buy',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          fixedSize: const Size(160, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                            side: const BorderSide(color: Colors.transparent, width: 1),
                                          )
                                      ),
                                      onPressed: () {
                                        if(selectedItemPrice == null || selectedItem == null || paymenttype == "Wating..."){
                                          ScaffoldMessenger.of(context).showSnackBar(snackbarvalidate);
                                        }else if(formkey.currentState!.validate() && selectedItem != null && selectedItemPrice != null && paymenttype != "Wating..."){
                                          Ordersadd.add({'Product Name': selectedItem,
                                            'Quantity': quantity,
                                            'Date': DateTime.now(),
                                            'Email': inputData(),
                                            'Total Cost': total,
                                            'Status': "Not Paid",
                                            'Transaction ID': 0,})
                                              .then((value) =>
                                                showDialog<bool>(
                                                  context: context,
                                                  builder: (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text('Payment Notifier'),
                                                      content: const Text('Please Pay The Total Amount To The Owner! Then Transaction ID Will Be Provided.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(alertDialogContext, true);
                                                          },
                                                          child: const Text('OK'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                )
                                              )
                                              .catchError(
                                                  (error) => ScaffoldMessenger.of(context).showSnackBar(snackbarvalidate));
                                              //Navigator.push(
                                                  //context,
                                                  //MaterialPageRoute(builder: (context) => ListPurchase())
                                              //);
                                        }else{
                                          ScaffoldMessenger.of(context).showSnackBar(snackbarvalidate);
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                    child: ElevatedButton(
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: Colors.white,

                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          fixedSize: const Size(160, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                            side: const BorderSide(color: Colors.transparent, width: 1),
                                          )
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainCustomer()));
                                        //Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                                ],
                              ),
                        )
                          ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
