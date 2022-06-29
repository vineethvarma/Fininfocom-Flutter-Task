import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'realm_services.dart';

class FirebaseServices {
  final realmServices = RealmServices();

  Future login(String username, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:
            username.contains('@gmail.com') ? username : '$username@gmail.com',
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
  }

  Future getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) => value.docs
          ..forEach((response) {
            // print(response.data()['name']);
            RealmServices().addUserData(response.data()['name'],
                response.data()['age'], response.data()['city']);
          }));
  }
}
