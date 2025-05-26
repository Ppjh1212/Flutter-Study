import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp {
  Future<void> signUp(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String warningMessage = '';
      // if (e.code == 'email-already-in-use') {
      //   log('email-already-in-use');
      // }
      if (e.code == 'invalid-email') {
        warningMessage = '이메일 형식에 맞게 입력해주세요.';
      } else if (e.code == 'weak-password') {
        warningMessage = '비밀번호를 6자 이상 입력해주세요.';
      } else if (e.code == 'email-already-in-use') {
        warningMessage = '계정이 존재합니다.';
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(warningMessage),
          ),
        );
      }
    }
  }
}
