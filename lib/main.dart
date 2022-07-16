import 'package:flutter/material.dart';
import 'package:ingeclimaproyecto/pages/facturacion.dart';


void main() {
  runApp(
    MyApp(),
  );
}
//aaaa
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,  
        title: 'App formulario',
        home:  Facturacion(),);
  }
}