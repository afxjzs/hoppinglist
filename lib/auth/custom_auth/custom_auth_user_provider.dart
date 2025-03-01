import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class HoppingListAuthUser {
  HoppingListAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<HoppingListAuthUser> hoppingListAuthUserSubject =
    BehaviorSubject.seeded(HoppingListAuthUser(loggedIn: false));
Stream<HoppingListAuthUser> hoppingListAuthUserStream() =>
    hoppingListAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
