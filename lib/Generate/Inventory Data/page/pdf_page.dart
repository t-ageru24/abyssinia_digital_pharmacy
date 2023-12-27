import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:abyssinia_pharmacy/Generate/Inventory Data/api/pdf_invoice_api.dart';
import 'dart:math';
import 'package:abyssinia_pharmacy/Generate/Inventory Data/model/invoice.dart';
import 'package:abyssinia_pharmacy/Generate/Inventory Data/model/supplier.dart';
import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:abyssinia_pharmacy/Generate/Inventory Data/api/pdf_api.dart';
import 'package:provider/provider.dart';


class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {


  late List<InvoiceItem> itemss;

  // Stream<List<InvoiceItem>> get inventory{
  //   return size.snapshots().map(_inventorysnapshot);
  // }
  //
  // List<InvoiceItem> _inventorysnapshot(QuerySnapshot snapshot){
  //   return snapshot.docs.map((doc){
  //     return InvoiceItem(
  //         ProductName: doc.get('ProductName'),
  //         DateOfPurchased: doc.get('DateOfPurchased'),
  //         Quantity: doc.get('Quantity'),
  //         MRP: doc.get('MRP'),
  //         PurchasePrice: doc.get('PurchasePrice'));
  //   }).toList();
  // }



  var rng = new Random();
  late var code = rng.nextInt(10000000);
  @override
  Widget build(BuildContext context) {
    //final datas = Provider.of<List<InvoiceItem>>(context, listen: false) ?? [];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
             child: Text(
              "Inventory Data",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            hoverColor: Colors.transparent,
            iconSize: 40,
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async{
              Navigator.pop(context);
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () async{
                final date = DateTime.now();

                final invoice = Invoice(
                  supplier: Supplier(
                    name: 'Abyssinia Pharmacy',
                    address: 'Addis Ababa, Ethiopia',
                  ),
                  info: InvoiceInfo(
                    date: date,
                    number: '$code',
                  ),
                  items: [
                    InvoiceItem(
                      MRP: 30,
                      Quantity: 3,
                      PurchasePrice: 25,
                      DateOfPurchased: DateTime.now(),
                      ProductName: 'Amoxicillin',
                    ),

                  ],
                );
                _inventorysnapshot(DocumentSnapshot snapshot){
                  print(snapshot.get('ProductName'));
                  print(snapshot.get('DateOfPurchased'));
                  print(snapshot.get('Quantity'));
                  print(snapshot.get('MRP'));
                  print(snapshot.get('PurchasePrice'));
                  print(InvoiceItem);
                }

                FirebaseFirestore.instance.collection('Products').doc().snapshots().map(_inventorysnapshot);


                final pdfFile = await PdfInvoiceApi.generate(invoice);
                openPDF(context, pdfFile);
              },
              child: const Text('Show', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: const BorderSide(color: Colors.transparent, width: 1),
                  ),
                  fixedSize: const Size(130, 30),
                  elevation: 3,
                  primary: const Color(0xFF0069FE),
                  textStyle: const TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ],
        ),
        body: Center(
            child: Image.asset("Assets/nodata.jpg"),
        ),
      );
  }
}

class PDFViewerPage extends StatefulWidget {
   final File file;

   PDFViewerPage({
     Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';
    final displayname = widget.file.path;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: pages >= 2
            ? [
          Center(child: Text(text)),
          IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 32),
            onPressed: () {
              final page = indexPage == 0 ? pages : indexPage - 1;
              controller.setPage(page);
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 32),
            onPressed: () {
              final page = indexPage == pages - 1 ? 0 : indexPage + 1;
              controller.setPage(page);
            },
          ),
        ]
            : null,
      ),
      body: PDFView(
        filePath: widget.file.path,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.download_rounded),
        backgroundColor: Colors.blue,
        onPressed: () {
          PdfApi.openFile(widget.file);
        },
      ),
    );
  }
}

void openPDF(BuildContext context, File file) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  );
}