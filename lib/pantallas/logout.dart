import 'package:flutter/material.dart';

class Logout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 600),
          child: Text('Salir',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/salir.jpg'),
        )
      ),
    );
  }
}