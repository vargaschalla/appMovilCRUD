import 'package:flutter/material.dart';

class Persona extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 600),
          child: Text('Personas',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/persona.jpg'),
        )
      ),
    );
  }
}