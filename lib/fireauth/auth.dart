import 'package:firebase_auth/firebase_auth.dart';




class Auth {
  // init firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create a user from firebaseauth
  User? get currentUser => _firebaseAuth.currentUser;

  // listen to changes in the user auth state
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signUp({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
