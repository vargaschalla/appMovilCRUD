import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:menu/main.dart';
import 'package:menu/modelos/vivero.dart';
import 'package:menu/pantallas/viveros/vivero_main.dart';

class DetalleVivero extends StatefulWidget {
  Vivero vivero;
  DetalleVivero(this.vivero);

  @override
  _DetalleViveroState createState() => _DetalleViveroState(this.vivero);
}

class _DetalleViveroState extends State<DetalleVivero> {
  Vivero vivero;
  _DetalleViveroState(this.vivero);

  void edit(){
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>Home(0,vivero.id)));
  }
  void delete() async{
    var data = await http.delete('http://192.168.8.115:8080/app/viveros/${this.vivero.id}');
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>Home(1,0)));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
            title: Text(vivero.nombrempresa, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800),),            
          ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(19),
                ),
                Text("Id: "+
                  vivero.id.toString(),
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(19),
                ),
                Text("Empresa: "+
                  vivero.nombrempresa,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(19),
                ),
                Text("Propietario: "+
                  vivero.propietario,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(19),
                ),
                Text("Cant. Orquideas: "+
                  vivero.cantorq,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(19),
                ),
                Text("Contacto: "+
                  vivero.contacto,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(19),
                ),
                Text("Ubicación: "+
                  vivero.ubicacion,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(19),
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: edit,
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text('Edit'),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: delete,
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text('Delete'),
                    ),
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}