import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  // init firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create a user from firebaseauth
  User? get currentUser => _firebaseAuth.currentUser;

  // listen to changes in the user auth state
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        print("The account already exists for that email.");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("User not found");
      } else if (e.code == "wrong-password") {
        print("Password is not correct");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
