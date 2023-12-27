import 'package:abyssinia_pharmacy/SignInAndSignup_Screen/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


class SignupWidget extends StatefulWidget {
  //const SignupWidget({Key key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {

  CollectionReference customers= FirebaseFirestore.instance.collection('Customers');
  final formkey = GlobalKey<FormState>();
  late TextEditingController confirmPasswordController;
  late bool confirmPasswordVisibility;
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
    confirmPasswordVisibility = false;
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromRGBO(56, 173, 174, 1), Color.fromRGBO(205, 41, 90, 1)]
            )
        ),
        child: Center(
          child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text("Welcome To Abyssinia Pharmacy\nGet started by creating an account below.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 25),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 40),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () async{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginScreen()),
                                  );
                                },
                                child: const Text('SignIn'),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      side: const BorderSide(color: Colors.transparent, width: 1),
                                    ),
                                    fixedSize: const Size(150, 50),
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
                              ElevatedButton(
                                onPressed: () async{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignupWidget()),
                                  );
                                },
                                child: const Text('SignUp'),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      side: const BorderSide(color: Colors.transparent, width: 1),
                                    ),
                                    fixedSize: const Size(150, 50),
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
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 25),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: emailAddressController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Your email address',
                              labelStyle: const TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF1D2429),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            validator: MultiValidator(
                                [
                                  EmailValidator (errorText: "Invalid Email Address"),
                                  RequiredValidator(errorText: 'Email Address Is Required'),
                                ]
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 25),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: passwordController,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                      () => passwordVisibility = !passwordVisibility,
                                ),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF95A1AC),
                                  size: 22,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF1D2429),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            validator: MultiValidator(
                              [
                                RequiredValidator(errorText: 'Password Is Required'),
                                MinLengthValidator(6, errorText: "password must be at least 8 digits long")
                              ]
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 25),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: confirmPasswordController,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: const TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                      () => passwordVisibility = !passwordVisibility,
                                ),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF95A1AC),
                                  size: 22,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF1D2429),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                              validator: MultiValidator(
                                  [
                                    RequiredValidator(errorText: 'Password Is Required'),
                                    MinLengthValidator(6, errorText: "password must be at least 8 digits long")
                                  ]
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 25),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async{
                        if(formkey.currentState!.validate()){
                          await FirebaseAuth.instance.
                          createUserWithEmailAndPassword(
                            email: emailAddressController.text,
                            password: passwordController.text,).then((value) {
                            const snackbar = SnackBar(content: Text("Account Created Successfully :)"));
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          }).onError((error, stackTrace) {
                            const snackbar = SnackBar(content: Text("Signup Failed :("));
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          });
                          customers.add({'Email': emailAddressController.text,
                            'JoinedDate': DateTime.now()})
                              .then((value) => print("Added"))
                              .catchError(
                                  (error) => print("failed"));
                        }
                      },
                      child: const Text('Register'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: const BorderSide(color: Colors.transparent, width: 1),
                          ),
                          fixedSize: const Size(170, 50),
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
              ),
            ],
          ),
          )
        ),
      ),
    );
  }
}