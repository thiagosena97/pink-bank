
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){

    return user != null ? User(user.uid,user.email): null;

  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  Future singIn(String email,String senha) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: senha);
      FirebaseUser user = result.user;

      return this._userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(exception) {
      print(exception.toString());
      return null;
    }
  }
}