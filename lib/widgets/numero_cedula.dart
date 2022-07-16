import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CedulaNumero extends StatefulWidget {
  CedulaNumero({Key key}) : super(key: key);

  @override
  _CedulaNumeroState createState() => _CedulaNumeroState();
}

class _CedulaNumeroState extends State<CedulaNumero> {
  String dropdownStr = "Cedula Física";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.perm_identity),
                labelText: 'Número de Cedula',
              ),
              validator: (String valor) {
                if (valor.isEmpty) {
                  return "* Required";
                } else if (!valor.contains('0')) {
                  return "Debe de contener ceros(0)";
                } else if (valor.contains('0')) {
                } else
                  return null;
              },
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          DropdownButton(
            value: dropdownStr,
            onChanged: (String newValue) {
              setState(
                () {
                  dropdownStr = newValue;
                },
              );
            },
            items: [
              'Cedula Física',
              'Cedula Jurídica',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
