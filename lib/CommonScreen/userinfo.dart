import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth auth = FirebaseAuth.instance;

class userinfo{

  String? inputData() {
    final User? user = auth.currentUser;
    final uemail = user?.email;
    return uemail;
  }
}
