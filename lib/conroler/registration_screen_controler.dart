import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_project_ui/view/login_screen/login_screen.dart';

class RegistrationScreenControler with  ChangeNotifier {
  

  Future<void> onRegister({required String email,required String password,required BuildContext context}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user != null ){
        print("Registration is sucess");
        Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen(),));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
