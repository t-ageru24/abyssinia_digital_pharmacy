import 'package:abyssinia_pharmacy/CommonScreen/dev.dart';
import 'package:flutter/material.dart';
class usermanual extends StatefulWidget {
  const usermanual({Key? key}) : super(key: key);

  @override
  State<usermanual> createState() => _usermanualState();
}

class _usermanualState extends State<usermanual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Manual"),
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/frontpage22.jpg"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
              children:[
                SingleChildScrollView(
                  child: Container(
                    margin:const EdgeInsets.only(top:20),
                    child: Text('USERS MANUAL',style:TextStyle(
                      fontFamily: 'Outfit',
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,

                    )),
                  ),
                ),
                Card(
                    elevation: 20,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children:[Text(
                          'How to order items on the app.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                          const SizedBox(height:12),
                          Text(
                            'To be able to order product from the app itself the user will need to first click on the order button on the main page and as the user is redirected to the order page, it will show at the top corner the users email as well as time and below that there will be a place where the user can select the product by name as well as choose the amount that they want to buy, after this, they will have to choose from which type of payment they want to pay, and the transaction is done they will be given a transaction id, which they can replace with the item that they have bought.',
                            style: TextStyle(
                                fontSize: 12

                            ),

                          ),],
                      ),
                    )
                ),
                Divider(),
                Card(
                    elevation: 20,
                    color: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children:[Text(
                          'How to see the of list items purchesed.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                          const SizedBox(height:12),
                          Text(
                            'To see the list of purchases that the user  has made it is very easy all they will  need to be  logged in and click on the button that says the list of purchases made on the main page and it will show you the items purchased.',
                            style: TextStyle(
                                fontSize: 12

                            ),

                          ),],
                      ),
                    )
                ),
                Divider(),
                Card(
                    elevation: 20,
                    color: Colors.indigoAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children:[Text(
                          'How to see the favorites selected .',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                          const SizedBox(height:12),
                          Text(
                            'Favorite is where you can see the favorite items that the user has picked they will have to access it the same way as you do the rest of the features by clicking the button that says favorite..',
                            style: TextStyle(
                                fontSize: 12

                            ),

                          ),],
                      ),
                    )
                ),
                Card(
                    elevation: 20,
                    color: Colors.white60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children:[Text(
                          'How to set an alarm.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                          const SizedBox(height:12),
                          Text(
                            'To set an alarm the user will first have to go to the main page and click the button that says set alarm and as click, they will be redirected to a new page in which they will see a clock and the current time, There will also be a button that says alarm in the bottom and when clicked it take the user to the page where they can set an alarm for the medicine that they are taking..',
                            style: TextStyle(
                                fontSize: 12

                            ),

                          ),],
                      ),
                    )
                ),
                Card(
                    elevation: 20,
                    color: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children:[Text(
                          'How to check descriptions.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                          const SizedBox(height:12),
                          Text(
                            'To check the description of an item the user will need to first click on the check description on the main page, as click they will be taken to a page that will allow them to check information about the problem.',
                            style: TextStyle(
                                fontSize: 12

                            ),

                          ),],
                      ),
                    )
                ), Card(
                    elevation: 20,
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children:[Text(
                          'Sending feedback.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                          const SizedBox(height:12),
                          Text(
                            'To Logout they can do this by swiping from left to right and getting into the menu bar as they do, pick the logout button, And they will have logged out and redirected to the main page .',
                            style: TextStyle(
                                fontSize: 12

                            ),

                          ),],
                      ),
                    )
                ), Card(
                    elevation: 20,
                    color: Colors.tealAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children:[Text(
                          'Loging out',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                          const SizedBox(height:12),
                          Text(
                            'To set an alarm the user will first have to go to the main page and click the button that says set alarm and as click, they will be redirected to a new page in which they will see a clock and the current time, There will also be a button that says alarm in the bottom and when clicked it take the user to the page where they can set an alarm for the medicine that they are taking..',
                            style: TextStyle(
                                fontSize: 12

                            ),

                          ),],
                      ),
                    )
                ),
              ]
          ),
        ),
      ),
    );
  }
}
