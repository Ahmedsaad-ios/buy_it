import 'package:buyit/Screens/login_screen.dart';
import 'package:buyit/Screens/sing_up.dart';
import 'package:flutter/material.dart';

main() => runApp ( MyApp() );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        SingUpScreen.id : (context) => SingUpScreen()
      },
    );
  }
}
