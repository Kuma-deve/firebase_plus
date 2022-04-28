import 'package:firebase_plus/firebase_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirePlusApp extends StatefulHookConsumerWidget {
  FirePlusApp({
    Key? key,
    this.title = '',
    required this.home,
    this.loginPage,
    this.splash,
    this.debugShowCheckedModeBanner = false,
    this.theme,
    this.darkTheme,
  }) : super(key: key);
  final String title;
  Widget home;
  Widget? loginPage;
  Widget? splash;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final bool debugShowCheckedModeBanner;

  ConsumerState<FirePlusApp> createState() => _FirePlusAppState();
}

class _FirePlusAppState extends ConsumerState<FirePlusApp> {
  @override
  Widget build(BuildContext context) {
    final home = useState<Widget>(widget.splash ?? const SizedBox());
    useEffect(() {
      if (widget.loginPage != null) {
        home.value = FirebaseAuthWidget(
          login: widget.home,
          notLogin: widget.loginPage,
        );
      } else {
        home.value = widget.home;
      }
      return null;
    }, const []);
    return MaterialApp(
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      title: widget.title,
      theme: widget.theme,
      darkTheme: widget.darkTheme,
      home: home.value,
    );
  }
}
