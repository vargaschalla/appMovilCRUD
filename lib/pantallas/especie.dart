import 'package:flutter/material.dart';

class Especie extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 600),
          child: Text('Especies',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/info.jpeg'),
        )
      ),
    );
  }
}