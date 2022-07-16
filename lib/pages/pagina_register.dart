import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ingeclimaproyecto/widgets/register_form.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 800.0,
          minHeight: 800.0,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: ExactAssetImage('assets/datacenter.jpg'),
                fit: BoxFit.cover,
              )),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            RegisterForm()
          ],
        ),
      ),
    );
  }
}
