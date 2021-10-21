import 'package:flutter/material.dart';
import 'package:menu/pantallas/viveros/vivero_form.dart';
import 'package:menu/pantallas/viveros/vivero_list.dart';
import 'package:menu/widget/my_drawer_header.dart';

void main() {
  runApp(Home(0,0));
}

class Home extends StatefulWidget {
  int state;
  int id;
  Home(this.state,this.id);

  @override
  _HomeState createState() => _HomeState(this.state,this.id);
}

class _HomeState extends State<Home> {
  int state;
  int id;
  int _currentIndex = 0;
  Widget _body;
  String _title;
  _HomeState(this.state,this.id);

  @override
  void initState() {
    super.initState();
    changeView(state);
  }

  void _onTap(index){
    changeView(index);
  }
  void changeView(index){
    _currentIndex = index;
    setState(() {
      switch (index) {
        case 0: {
          _title = "Form";
          _body = FormVivero(this.id);
          break;
        }
        case 1: {
          _title = "Lista";
          _body = ListaVivero();
          break;
        }

      }
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      Scaffold(
        drawer: MyHeaderDrawer(),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text('Add', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),)

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart),
              title: Text('View', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),)

            )
          ],
          currentIndex: _currentIndex,  
          onTap: _onTap,
        ),
      ),
    );
  }
}