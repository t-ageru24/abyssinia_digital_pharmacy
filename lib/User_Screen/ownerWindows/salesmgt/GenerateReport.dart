import 'package:flutter/material.dart';

class generatesalesreport extends StatefulWidget {
  const generatesalesreport({Key? key}) : super(key: key);

  @override
  State<generatesalesreport> createState() => _generatesalesreportState();
}

class _generatesalesreportState extends State<generatesalesreport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
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
        title: const Text(
          'Generate Sales Report',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
        child: Text("Working on"),
      ),
    );
  }
}
