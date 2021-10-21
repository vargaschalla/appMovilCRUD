import 'package:flutter/material.dart';
import 'package:menu/modelos/vivero.dart';
import 'package:menu/pantallas/persona.dart';
import 'package:menu/pantallas/orquidea.dart';
import 'package:menu/pantallas/familia.dart';
import 'package:menu/pantallas/genero.dart';
import 'package:menu/pantallas/logout.dart';
import 'package:menu/pantallas/especie.dart';
import 'package:menu/pantallas/viveros/vivero_main.dart';

import 'widget/my_drawer_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.persona;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.persona) {
      container = Persona();
    }else if (currentPage == DrawerSections.orquidea) {
      container = Orquidea();
    }else if (currentPage == DrawerSections.vivero) {
      container = Home(0,0);
    }else if (currentPage == DrawerSections.familia) {
      container = Familia();
    }else if (currentPage == DrawerSections.especie) {
      container = Especie();
    }else if (currentPage == DrawerSections.genero) {
      container = Genero();
    }else if (currentPage == DrawerSections.Logout) {
      container = Logout();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('BINARIOS'),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }
  Widget MyDrawerList(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, 'Personas', Icons.dashboard_outlined,
            currentPage == DrawerSections.persona ? true : false),
          menuItem(2, 'Orquideas', Icons.people_alt_outlined,
            currentPage == DrawerSections.orquidea ? true : false),
          menuItem(3, 'Viveros', Icons.event,
            currentPage == DrawerSections.vivero ? true : false),
          menuItem(4, 'Familia', Icons.notes,
            currentPage == DrawerSections.familia ? true : false),
          menuItem(5, 'Especie', Icons.settings_outlined,
            currentPage == DrawerSections.especie ? true : false),
          menuItem(6, 'Género', Icons.notifications_outlined,
            currentPage == DrawerSections.genero ? true : false),
          menuItem(7, 'Logout', Icons.logout,
            currentPage == DrawerSections.Logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected){
    return Material(
      color: selected ? Colors.green[200] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.persona;
            }else if (id == 2) {
              currentPage = DrawerSections.orquidea;
            }else if (id == 3) {
              currentPage = DrawerSections.vivero;
            }else if (id == 4) {
              currentPage = DrawerSections.familia;
            }else if (id == 5) {
              currentPage = DrawerSections.especie;
            }else if (id == 6) {
              currentPage = DrawerSections.genero;
            }else if (id == 7) {
              currentPage = DrawerSections.Logout;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections{
  persona,
  orquidea,
  vivero,
  familia,
  especie,
  genero,
  Logout,
}
