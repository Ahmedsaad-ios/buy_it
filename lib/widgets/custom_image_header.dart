import 'package:flutter/material.dart';

class CustomImageHeader extends StatelessWidget {
  final String image;
  final String titel;
  CustomImageHeader({@required this.image, this.titel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(image),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                titel,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
