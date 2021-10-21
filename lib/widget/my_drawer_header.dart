import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[600],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/info.jpeg'),
              )
            ),
          ),
          Text(
            'Wagner Vargas Challa',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'wagner.vargas@upeu.edu.pe',
            style: TextStyle(color: Colors.grey[200], fontSize: 14),
          )
        ],
      ),
    );
  }
}