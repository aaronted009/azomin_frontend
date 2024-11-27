import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: Scaffold(body: _page(),),);
  }

  Widget _page(){
    return Row(children: [
      Column(children: [
        Icon(Icons.house),
        Image(image: AssetImage("images/login-image.png"),),
      ],)
      Column(children: [
        Text("Log in"),
        TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: "azomin@example.com"),),
      ],)
    ],);
  }
}