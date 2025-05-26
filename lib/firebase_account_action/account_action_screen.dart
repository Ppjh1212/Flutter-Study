import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_study/firebase_account_action/account_acction_logic/delete_user.dart';
import 'package:login_study/firebase_account_action/account_acction_logic/google_login.dart';
import 'package:login_study/firebase_account_action/account_acction_logic/login.dart';
import 'package:login_study/firebase_account_action/account_acction_logic/signup.dart';
import 'package:login_study/firebase_account_action/account_acction_logic/signout.dart';

class AccountActionScreen extends StatefulWidget {
  const AccountActionScreen({super.key});

  @override
  State<AccountActionScreen> createState() => _AccountActionScreenState();
}

class _AccountActionScreenState extends State<AccountActionScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: _emailController,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey.shade600,
                  ),
                ),
                hintText: 'Email',
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: _passwordController,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey.shade600,
                  ),
                ),
                hintText: 'Password',
              ),
            ),
          ),
          Text('${FirebaseAuth.instance.currentUser}'),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Google().login().then((_) => setState(() {}));
            },
            child: Text('google login'),
          ),
          TextButton(
            onPressed: () {
              Login()
                  .login(
                    _emailController.text,
                    _passwordController.text,
                    context,
                  )
                  .then((_) => setState(() {}));
            },
            child: Text('login'),
          ),
          TextButton(
            onPressed: () {
              SignUp()
                  .signUp(
                    _emailController.text,
                    _passwordController.text,
                    context,
                  )
                  .then((_) => setState(() {}));
            },
            child: Text('sign up'),
          ),
          TextButton(
            onPressed: () {
              SignOut().signOut().then((_) => setState(() {}));
            },
            child: Text('sign out'),
          ),
          TextButton(
            onPressed: () {
              DeleteUser().deleteUser().then((_) => setState(() {}));
            },
            child: Text('delete user'),
          ),
        ],
      ),
    );
  }
}
