import 'package:firebase_auth/firebase_auth.dart';

class SignOut {
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}