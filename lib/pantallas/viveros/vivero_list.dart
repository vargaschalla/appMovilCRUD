import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:menu/modelos/vivero.dart';
import 'package:menu/pantallas/viveros/vivero_detalle.dart';


class ListaVivero extends StatefulWidget {
  ListaVivero({Key key}) : super(key: key);

  @override
  _ListaViveroState createState() => _ListaViveroState();
}

class _ListaViveroState extends State<ListaVivero> {
  //String dataURL = 'http://192.168.8.115:8080';
  List<Vivero> viveros = [];
  Future getAll() async {
    var data = await http.get('http://192.168.8.115:8080/app/viveros');
    var jsonData = json.decode(data.body);
    print('status code : ${data.statusCode}');

    for (var u in jsonData) {
      viveros.add(Vivero(u['id'], u['nombrempresa'],u['propietario'],u['cantorq'], u['contacto'], u['ubicacion']));
      print(jsonData);
    }
    return viveros;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text('Loading...'),
              ),
            );         
          }else{ 
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(snapshot.data[index].nombrempresa,
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),
                  
                  ),
                  subtitle: Text(snapshot.data[index].propietario,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=>DetalleVivero(snapshot.data[index])));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}