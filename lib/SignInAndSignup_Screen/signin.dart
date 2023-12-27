import 'package:abyssinia_pharmacy/SignInAndSignup_Screen/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../User_Screen/Customer_Screen/MainCustomer.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../User_Screen/ownerWindows/Ownermain.dart';
import '../User_Screen/pharmacist/pharmacistMain.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late var size=0;
  static Future<User?> loginUsingEmailPassword({

    required String email,
    required String password,
    required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential= await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user= userCredential.user;
    } on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
         print("user-not-found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    const snackbar = SnackBar(content: Text("Login Failed"));
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
              colors: [Color.fromRGBO(56, 173, 174, 1), Color.fromRGBO(205, 41, 90, 1)]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.disabled,
               child: SingleChildScrollView(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Abyssinia Pharmacy",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text("Please Login To Your Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Enter your Email",
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                        ),
                        validator: MultiValidator(
                            [
                              EmailValidator (errorText: "Invalid Email Address"),
                              RequiredValidator(errorText: 'Email Address Is Required'),
                            ]
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(
                            top: 30.0,
                          )
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter your Password",
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                        ),
                        validator: MultiValidator(
                            [
                              RequiredValidator(errorText: 'Password Is Required'),
                            ]
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(
                            top: 30.0,
                          )
                      ),
                      const Text(
                        "Don't Remember your password?",
                        style: TextStyle(
                            color: Colors.blue
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF0069FE),
                          elevation: 5.0,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          ),
                          onPressed: () async{
                            if(formkey.currentState!.validate()){
                              User? user=await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                              print(user);
                              if(user != null){
                                var currentUser = FirebaseAuth.instance.currentUser;

                                if(currentUser?.uid == 'bdREMjdaSIP9WNFzgfW2ByD6ecl1') {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (context) => Owner()));
                                }else{
                                  FirebaseFirestore.instance
                                      .collection('Employee')
                                      .where('Role', isEqualTo: 'Pharmacist')
                                      .where('Email', isEqualTo: currentUser?.email)
                                      .get().then((value) =>  setState(() {
                                        bool isis = value.size>0 ? true: false;
                                        isis ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (context) => pharmacist()))
                                            : Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (context) => MainCustomer()));
                                  }));
                                }
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }
                            }
                           },
                          child: const Text("Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height:15.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF0069FE),
                          elevation: 5.0,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupWidget()),
                            );
                          },
                          child: const Text("SignUp",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              )),
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




