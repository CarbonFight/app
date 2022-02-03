import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CarbonFightFirebaseUser {
  CarbonFightFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

CarbonFightFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CarbonFightFirebaseUser> carbonFightFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<CarbonFightFirebaseUser>(
        (user) => currentUser = CarbonFightFirebaseUser(user));
