# FirebasePlus
## How to use
Add to pubspec.yaml
```yaml
  firebase_plus:
    git: https://github.com/Kuma-deve/firebase_plus.git
  hooks_riverpod:
  flutter_hooks:
  firebase_auth:
  firebase_core:
  cloud_firestore:
```

## Example

```dart
void main() {
  runApp(
    const ProviderScope(child:MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  //It will automatically check if you are logged in and move to each page.
  @override
  Widget build(BuildContext context) {
    return FirePlusApp(
      title: 'AppName',
      home: ExamplePage(),
      loginPage: ExampleLoginPage(),
    );
  }
}

```

Use riverpod_hooks
```dart
//Anonymous login with FIrebase
ref.read(loginProvider).anonymously();

//Email login with FIrebase
ref.read(loginProvider).emailLogin(email,password);

//Email sign with FIrebase
ref.read(loginProvider).emailSign(email,password);

//Google login with FIrebase
ref.read(loginProvider).googleLogin();

//GitHub login with FIrebase
ref.read(loginProvider).githubLogin();

```
