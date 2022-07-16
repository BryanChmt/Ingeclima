import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ingeclimaproyecto/pages/facturacion.dart';
import 'package:ingeclimaproyecto/pages/forgot.dart';
import 'package:ingeclimaproyecto/pages/pagina_register.dart';
import 'package:ingeclimaproyecto/widgets/password_field.dart';


class TextFields extends StatefulWidget {
  @override
  __TextFieldsState createState() => __TextFieldsState();
}

class __TextFieldsState extends State<TextFields> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
    final TextEditingController _login = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(   
      key: _formKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.85,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 3.0),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ingreso',
                    style: TextStyle(fontSize: 40.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60.0),
                  _correovalidator(),
                  SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: PasswordFormField(
                      controller: _passwordController,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  _botonIngresa(),
                ],
              ),
            ),
            _buttonforgot('¿Has olvidado tu contraseña?', context),
            _buttonregister('¿No tienes una cuenta? Regístrate', context),
          ],
        ),
      ),
    );
  }

  Widget _correovalidator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.alternate_email_rounded),
          labelText: 'Correo Electrónico',
        ),
        controller: _login,
        validator: (String value) {
          if (value.isEmpty) {
            return "* Required";
          } else if (!value.contains('@')) {
            return "No es un correo electronico valido";
          } else if (value.contains('@')) {
            _passwordController.clear();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Facturacion();
                  
                }, 
              ),
             
            );
          } else
            return null;
        },
      ),
    );
  }

  Widget _botonIngresa() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2464ec)),
      ),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          print("Validated");
        } else {
          print("Not Validated");
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0),
        child: Text(
          'Ingresar',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
        ),
      ),
    );
  }

  Widget _buttonforgot(String texto, BuildContext context) {
    return TextButton(
      onPressed: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForgotPage())),
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget _buttonregister(String texto, BuildContext context) {
    return TextButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPage(),
          ),
        ),
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
