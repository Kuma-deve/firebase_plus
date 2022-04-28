import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_plus/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirebaseAuthWidget extends StatefulHookConsumerWidget {
  FirebaseAuthWidget({Key? key, this.login, this.notLogin}) : super(key: key);
  Widget? login;
  Widget? notLogin;

  @override
  ConsumerState<FirebaseAuthWidget> createState() => _FirebaseAuthWidgetState();
}

class _FirebaseAuthWidgetState extends ConsumerState<FirebaseAuthWidget> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = ref.watch(authProvider);
    return Material(
      child: auth.currentUser != null ? widget.login : widget.notLogin,
    );
  }
}
