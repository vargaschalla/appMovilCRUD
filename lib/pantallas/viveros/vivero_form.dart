import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:menu/main.dart';
import 'package:menu/modelos/vivero.dart';
import 'package:menu/pantallas/viveros/vivero_main.dart';

class FormVivero extends StatefulWidget {
  int id;
  FormVivero(this.id);

  @override
  _FormViveroState createState() => _FormViveroState(this.id);
}

class _FormViveroState extends State<FormVivero> {
  int id;
  _FormViveroState(this.id);
  Vivero vivero = Vivero(0,'','','','','');
  Future save()async{
    if (vivero.id == 0) {
      await http.post('http://192.168.8.115:8080/app/viveros', 
      headers: <String,String>{'Context-Type':'application/json;Charset=UTF-8'},
      body: <String,String>{
        'nombrempresa':vivero.nombrempresa,
        'propietario':vivero.propietario,
        'cantorq':vivero.cantorq,
        'contacto':vivero.contacto,
        'ubicacion':vivero.ubicacion
      });
    }else{
      await http.put('http://192.168.8.115:8080/app/viveros/${vivero.id.toString()}', 
      headers: <String,String>{'Context-Type':'application/json;Charset=UTF-8'},
      body: <String,String>{
        'nombrempresa':vivero.nombrempresa,
        'propietario':vivero.propietario,
        'cantorq':vivero.cantorq,
        'contacto':vivero.contacto,
        'ubicacion':vivero.ubicacion
      });      
    }
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>Home(1,0)));
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.id !=0) {
      getOne();
    }
  }
  void getOne() async{
    var data =await http.get('http://192.168.8.115:8080/app/viveros/${this.id}');
    var u = json.decode(data.body);
    setState(() {
    vivero = Vivero(u['id'], u['nombrempresa'],u['propietario'],u['cantorq'], u['contacto'], u['ubicacion']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Padding(
          padding: EdgeInsets.all(19.0),
            child: Column(
              children: [
                Visibility(
                  visible: false,
                  child: TextField(
                    controller: TextEditingController(
                      text: vivero.id.toString(),
                    ),
                  ),
                ),
                TextField(
                  controller: TextEditingController(
                    text: vivero.nombrempresa
                  ),
                  onChanged: (val){
                    vivero.nombrempresa = val;
                  },
                  decoration: InputDecoration(
                    labelText: "Nombre de la Empresa",
                    icon: Icon(Icons.apartment,color: Colors.blue,)
                  ),
                ),
                TextField(
                  controller: TextEditingController(
                    text: vivero.propietario
                  ),
                  onChanged: (val){
                    vivero.propietario = val;
                  },
                  decoration: InputDecoration(
                    labelText: "Nombre del Propietario",
                    icon: Icon(Icons.person,color: Colors.blue)
                  ),
                ),
                TextField(
                  controller: TextEditingController(
                    text: vivero.cantorq
                  ),
                  onChanged: (val){
                    vivero.cantorq = val;
                  },
                  decoration: InputDecoration(
                    labelText: "Cantidad de Orquideas",
                    icon: Icon(Icons.filter_vintage, color: Colors.blue)
                  ),
                ),
                TextField(
                  controller: TextEditingController(
                    text: vivero.contacto
                  ),
                  onChanged: (val){
                    vivero.contacto = val;
                  },
                  decoration: InputDecoration(
                    labelText: "Contacto",
                    icon: Icon(Icons.local_phone_sharp, color: Colors.blue)
                  ),
                ),
                TextField(
                  controller: TextEditingController(
                    text: vivero.ubicacion
                  ),
                  onChanged: (val){
                    vivero.ubicacion = val;
                  },
                  decoration: InputDecoration(
                    labelText: "Ubicación de la Empresa",
                    icon: Icon(Icons.location_pin, color: Colors.blue)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: MaterialButton(
                    onPressed: save,
                    minWidth: double.infinity,
                    color: Colors.blue[400],
                    textColor: Colors.white,
                    child: Text('Save', style: TextStyle(fontStyle: FontStyle.italic),),
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}