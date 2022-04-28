import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider((_) => FirebaseAuth.instance);

final loginProvider = Provider((ref) => LoginModel(ref.read));

class LoginModel {
  LoginModel(this._read);
  final Reader _read;

  Future anonymously() async {
    _read(authProvider).signInAnonymously();
  }

  Future emailLogin(email, password) async {
    await _read(authProvider)
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future emailSign(email, password) async {
    await _read(authProvider)
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future googleLogin() async {
    UserCredential? google_login_result;
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    google_login_result =
        await _read(authProvider).signInWithPopup(googleProvider);
    final isFirstLogin = google_login_result.additionalUserInfo!.isNewUser;
    if (isFirstLogin) {
      if (kDebugMode) {
        print('FirebasePlus : This is the first login');
      }
      return 0;
    } else {
      if (kDebugMode) {
        print('FirebasePlus : This is the second and subsequent logins');
      }
      return 1;
    }
  }

  Future githubLogin() async {
    UserCredential? github_login_result;
    GithubAuthProvider githubProvider = GithubAuthProvider();
    github_login_result =
        await _read(authProvider).signInWithPopup(githubProvider);
    final isFirstLogin = github_login_result.additionalUserInfo!.isNewUser;
    if (isFirstLogin) {
      if (kDebugMode) {
        print('FirebasePlus : This is the first login');
      }
      return 0;
    } else {
      if (kDebugMode) {
        print('FirebasePlus : This is the second and subsequent logins');
      }
      return 1;
    }
  }
}
