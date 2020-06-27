import 'package:buyit/Screens/login_screen.dart';
import 'package:buyit/constans.dart';
import 'package:buyit/widgets/custom_image_header.dart';
import 'package:buyit/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:buyit/services/auth.dart';

class SingUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'SingUpScreen';
  String _email, _password;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            CustomImageHeader(image: 'asset/images/icons/buyicon.png', titel: 'Buy it'),
            SizedBox(
                height: heigh * .1
            ),
            CustomTextField(

                hint: 'Enter Your Name',
                icon: Icons.person_pin
            ),
            SizedBox(
                height: heigh * .02
            ),
            CustomTextField(
              onClick: (value){
                _email = value;
              },
                hint: 'Enter Your Email',
                icon: Icons.email
            ),
            SizedBox(
                height: heigh * .02
            ),
            CustomTextField(
              onClick: (value){
                _password = value;
              },
                hint: 'Enter Your Password',
                icon: Icons.lock
            ),
            SizedBox(
                height: heigh * .05
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () async {
                  if(_globalKey.currentState.validate()){
                    _globalKey.currentState.save();
                    print(_email);
                    print(_password);
                    final authResilet = await _auth.singUp(_email, _password);
                    print(authResilet.user.uid);
                  }
                },
                color: Colors.black,
                child: Text(
                  'Sing up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
                height: heigh * .05
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: <Widget>[
                Text('Do have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                    width: width * .04
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
