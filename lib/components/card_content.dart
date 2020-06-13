import 'package:flutter/material.dart';
import '../constants.dart'; 

class CardContent extends StatelessWidget {
  CardContent({@required this.icons , @required this.textContent});
  final IconData icons;
  final String textContent;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icons,
          size: 80.0,
          ),
          SizedBox(
            height: 15.0
          ),
          Text(
            textContent,
            style: kTextContentStyle,
          )


      ],
    );
  }
}
