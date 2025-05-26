import 'package:firebase_auth/firebase_auth.dart';

class DeleteUser {
  Future<void> deleteUser() async{
    await FirebaseAuth.instance.currentUser!.delete();
  }
}