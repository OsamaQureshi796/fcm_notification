import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcm_notification/views/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  CreateMyUser({String? email, String? password, String? name}) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value)async {
      String uid = value.user!.uid;
      /// Todo:
      /// pass token

      FirebaseFirestore.instance.collection('users').doc(uid).set({
        'Name': name,
        'Email': email,
        'Password': password,
        'followId': [],

      }).then((value) => Get.off(() => LoginScreen()));
    }).catchError((e) {
      print(e.toString());
    });
  }
}
