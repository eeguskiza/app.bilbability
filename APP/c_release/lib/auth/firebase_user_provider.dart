import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BilbabilityFirebaseUser {
  BilbabilityFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

BilbabilityFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BilbabilityFirebaseUser> bilbabilityFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BilbabilityFirebaseUser>(
      (user) {
        currentUser = BilbabilityFirebaseUser(user);
        return currentUser!;
      },
    );
