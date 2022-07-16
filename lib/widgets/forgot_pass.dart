import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ingeclimaproyecto/pages/login_page.dart';


class ForgotPass extends StatelessWidget {
  const ForgotPass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     TextEditingController _forgot = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Form(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.85,
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 3.0),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _autoSize(
                    '¿Has olvidado tu Contraseña?',
                    40.0,
                    FontWeight.bold,
                    Colors.black,
                  ),
                  const SizedBox(height: 40.0),
                  _autoSize(
                    'Por favor introduce el Correo Electrónico con el que te has registrado',
                    20.0,
                    FontWeight.w500,
                    Colors.black,
                  ),
                  const SizedBox(height: 70.0),
                  TextFormField(
                    controller: _forgot,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.email),
                      labelText: 'Correo Electrónico',
                    ),
                  ),
                  const SizedBox(height: 70.0),
                  ElevatedButton(
                    style: ButtonStyle(                      
                     backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2464ec),),     
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 30.0),
                      ),
                    ),
                    onPressed: () {},
                    child: _autoSize(
                      'Enviar Solicitud',
                      20.0,
                      FontWeight.w600,
                      Colors.white,
                    ),
                  ),            
                ],               
              ),
            ),
            const SizedBox(height: 15.0),
            TextButton(
                      onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomLogin(),
                              ),
                            ),
                          },
                      child: Text(
                        'Regresar a la pantalla de inicio',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 23),
                      ))
          ],
        ),
      ),
    );
  }

  Widget _autoSize(String data, double size, FontWeight weight, Color colors) {
    return AutoSizeText(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: size, color: colors, fontWeight: weight),
    );
  }
}
