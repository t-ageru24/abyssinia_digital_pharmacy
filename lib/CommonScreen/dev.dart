import 'package:flutter/material.dart';
class Developers extends StatefulWidget {
  const Developers({Key? key}) : super(key: key);

  @override
  State<Developers> createState() => _DevelopersState();
}

class _DevelopersState extends State<Developers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About the application"),
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
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/frontpage22.jpg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
            children: [
              Card(
                elevation: 20,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children:[Text(
                      'The name of the application that you are using right now is called Abisinia Pharmacy Management Application , It was created by Four group members for their final year project at their college named Microlink Collage, the app has many usefull functionalities but as you are loged in as the user you will not be capable of using all of them.But even more so their are a varaity of function that you as the user will have                                                The Developers of this project are                    ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60,
                      ),
                    ),const SizedBox(height:12),
                      Text(
                        '1. Tadesse Ageru ',
                        style: TextStyle(
                            fontSize: 15,color: Colors.white60

                        ),

                      ),
                      const SizedBox(height:12),
                      Text(
                        '2.Luel Fekadu ',
                        style: TextStyle(
                            fontSize: 15,color: Colors.white60

                        ),

                      ),const SizedBox(height:12),
                      Text(
                        '3.Nahom Mengistu  ',
                        style: TextStyle(
                            fontSize: 15,color: Colors.white60

                        ),

                      ),const SizedBox(height:12),
                      Text(
                        '4. Bamlak Kassahun ',
                        style: TextStyle(
                            fontSize: 15,color: Colors.white60

                        ),

                      ),



                    ],),
                ),
              ),
              Divider(),
              Card(
                elevation: 20,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children:[Text(
                      'For more information on what the user can do on the app you can vist the users manual section ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60,
                      ),
                    ),

                    ],),
                ),
              ),
            ]
        ),
      ),);
  }
}
