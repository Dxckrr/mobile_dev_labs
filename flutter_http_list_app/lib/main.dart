import 'package:flutter/material.dart';
import 'package:flutter_http_list_app/item_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const ListaArticulos());
}

class ListaArticulos extends StatefulWidget {
  final String sTitulo;
  const ListaArticulos({super.key, this.sTitulo = "Lista de Usuarios App"});
  @override
  State<ListaArticulos> createState() => _ListaArticulosState();
}

class _ListaArticulosState extends State<ListaArticulos> {
  Future<Widget> _consultarUsuarios() async {
    String sUrl = "https://api.npoint.io/bffbb3b6b3ad5e711dd2";
    try {
      final oRespuesta = await http.get(
        //http.get / http.post
        Uri.parse(sUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        //body: { "param1": "valor1" },
      );
      dynamic oJsonDatos = jsonDecode(utf8.decode(oRespuesta.bodyBytes));
      List aItems = oJsonDatos["items"];
      List<Widget> awItems = [];
      for (var aItem in aItems) {
        awItems.add(
          ItemUser(
            image: 'assets/${aItem["imagen"].toString()}',
            name: aItem["nombre"].toString(),
            program: aItem["carrera"].toString(),
            averageScore: aItem["promedio"],
          ),
        );
      }
      return ListView(children: awItems);
    } catch (e) {
      print("ERROR AL ENVIAR/RECIBIR SOLICITUD:");
      print(e);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List w/ HTTP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'List HTTP App!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder<Widget>(
          /*
            (new) FutureBuilder<Widget> FutureBuilder({
              Key? key,
              Future<Widget>? future,
              Widget? initialData,
              required Widget Function(BuildContext, AsyncSnapshot<Widget>) builder,
            })
          */
          future: //{Future<Widget>? future}
              _consultarUsuarios(),
          builder: //{required Widget Function(BuildContext, AsyncSnapshot<Widget>) builder}
          (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data ?? Container();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
