import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Google {
  Future login() async{
    // 인증 흐름 트리거
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // 요청에서 인증 세부 정보 가져오기
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    
    // 새 사용자 인증 정보 생성
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // 로그인 후 UserCredential 반환
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}