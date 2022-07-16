import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ingeclimaproyecto/pages/facturacion.dart';
import 'package:ingeclimaproyecto/pages/login_page.dart';
import 'package:ingeclimaproyecto/widgets/password_field.dart';
import 'numero_cedula.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  PickedFile _imageFile;
  final _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  List<File> images = [];

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }



  Future takePhoto() async {
 
  }
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _empresa = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 800.0,
        minHeight: 800.0,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              Container(
                width: size.width * 0.75,
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 3.0),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Registrar Usuario',
                      style: TextStyle(fontSize: 40.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    _empresaValidator(context),
                    const SizedBox(height: 20.0),
                    CedulaNumero(),
                    const SizedBox(height: 20.0),
                    _emailValidator(context),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: PasswordFormField(
                        controller: _passwordController,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    _confirm(),
                    const SizedBox(height: 20.0),
                    _phoneValidator(),
                    const SizedBox(height: 30.0),
                    _logoProfile(),
                    const SizedBox(height: 20.0),
                    _buttonRegister(),
                    const SizedBox(width: 15.0),
                  ],
                ),
              ),
              _buttonback(context),
              Text(
                'SimpleSolutions Corporation ©2021',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _confirm() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        controller: _confirmpassword,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.lock),
          labelText: 'Confirmar Contraseña',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "* Required";
          } else if (_passwordController.text != _confirmpassword.text) {
            return "Las contraseñas no coinciden";
          } else
            return null;
        },
      ),
    );
  }

  Widget _logoProfile() {
    return Column(
      children: [
        Text('Insertar foto del perfil(opcional)',style: TextStyle(fontSize: 20.0),),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
          child: IconButton(
              onPressed: () {
                takePhoto();
              },
              icon: Icon(
                Icons.filter,
                size: 40.0,
                color: Colors.orange,
              )
              ),
        ),
      ],
    );
  }

  Widget _buttonRegister() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2464ec)),
      ),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          print("Validated");
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
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 80.0,
          vertical: 20.0,
        ),
        child: Text(
          'Crear Cuenta',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
        ),
      ),
    );
  }

  Widget _empresaValidator(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        controller: _empresa,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.domain_outlined),
          labelText: 'Nombre de Usuario',
        ),
        validator: (String valor) {
          if (valor.isEmpty) {
            return "* Required";
          } else if (valor.isNotEmpty) {
          } else
            return null;
        },
      ),
    );
  }

  Widget _phoneValidator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField( 
        controller: _phone,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.phone_in_talk_rounded),
          labelText: 'Número Telefónico',
        ),
        validator: (String valor) {
          if (valor.isEmpty) {
            return "* Required";
          } else if (valor.length <= 8) {
            return "No es un Teléfono valido";
          } else if (valor.length == 8) {
            return "Número aceptado";
          } else
            return null;
        },
      ),
    );
  }

  Widget _emailValidator(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.alternate_email_rounded),
          labelText: 'Correo Electrónico',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "* Required";
          } else if (!value.contains('@')) {
            return "No es un correo electronico valido";
          } else if (value.contains('@')) {
          } else
            return null;
        },
      ),
    );
  }

  Widget _buttonback(BuildContext context) {
    return TextButton(
      onPressed: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CustomLogin())),
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          '¿Ya tienes una cuenta? Inicia Sesión',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        ),
      ),
    );
  }
}