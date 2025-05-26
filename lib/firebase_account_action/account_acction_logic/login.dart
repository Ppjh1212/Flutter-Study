import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login {
  Future<void> login(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String warningMessage = '';
      if (e.code == 'invalid-email') {
        warningMessage = '이메일 형식에 맞게 입력해주세요.';
      } else if (e.code == 'weak-password') {
        warningMessage = '비밀번호를 6자 이상 입력해주세요.';
      } else if (e.code == 'invalid-credential') {
        warningMessage = '계정이 존재하지 않습니다.';
      } else if (e.code == 'channel-error') {
        warningMessage = '이메일과 비밀번호를 입력해주세요.';
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(warningMessage),
          ),
        );
      }
    }

    // await FirebaseAuth.instance
    //     .signInWithEmailAndPassword(email: email, password: password);
  }
}
