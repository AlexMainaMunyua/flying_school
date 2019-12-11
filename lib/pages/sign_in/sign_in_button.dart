import 'package:flutter/material.dart';
import 'package:flying_school/common_widgets/custom_raised_button.dart';


class SignInButton extends CustomRaisedButton{
  SignInButton({
    Key key,
    @required String text,
    @required Color color,
    @required VoidCallback onPressed,
    Color textColor = Colors.black87,
    double height = 50.0,
    @required Decoration decoration,
  }): super(
    key: key,
    child: Text(text, style:  TextStyle(color: textColor, fontSize: 15.0),),
    color: color,
    textColor: textColor,
    height: height,
    onPressed: onPressed,
   
  );
}