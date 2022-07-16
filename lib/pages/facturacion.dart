import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ingeclimaproyecto/widgets/content_reporte.dart';
import 'package:intl/intl.dart';

class Facturacion extends StatefulWidget {
  @override
  _FacturacionState createState() => _FacturacionState();
}

class _FacturacionState extends State<Facturacion> {
  String _dateInitialValue;
  String _dateValue;
  DateTime now= DateTime.now();
  TextEditingController _dateInitialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: _header(context),
              ),
            ),
            const SizedBox(height: 15.0),
            ContentReport()
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: AssetImage('assets/ingeclima.png'),
          height: 200.0,
          width: 400.0,
        ),
        const SizedBox(width: 15.0),
        AutoSizeText(
          'INGECLIMA\nReporte de Mantenimiento',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(width: 15.0),
        Column(
          children: [
            Text(
              'Fecha',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10.0),
            _billInfoInitialDatePicker()
          ],
        ),
      ],
    );
  }
  
  Container _billInfoInitialDatePicker() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        constraints: BoxConstraints.tightFor(width: 225, height: 50),
        child: TextFormField(
          enableInteractiveSelection: false,
          onTap: () {
            setState(() {
              FocusScope.of(context).requestFocus(new FocusNode());
              _selectDate();
            });
          },
          onSaved: (val) => _dateInitialValue = val,
          onFieldSubmitted: (val) => _dateInitialValue = val,
          controller: _dateInitialController,
          // ignore: missing_return
          validator: (value) {
            if (value.isEmpty) return DateFormat('dd/MM/yyyy').format(now);
          },
          
          decoration: InputDecoration( 
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: Colors.white,
            hintText: DateFormat('dd/MM/yyyy').format(now),
            labelStyle: TextStyle(color: Colors.black, fontSize: 14),
            prefixIcon: Icon(Icons.date_range, size: 24, color: Colors.black),
          ),
        ));
  }

  void _selectDate() async {
    DateTime picked = await showDatePicker(
        context: this.context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1980),
        lastDate: DateTime(2100),
        cancelText: 'Cancelar',
        confirmText: 'Aceptar',
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _dateValue = picked.day.toString() +
            '/' +
            picked.month.toString() +
            '/' +
            picked.year.toString();
        _dateInitialValue = _dateValue;
        _dateInitialController.text = _dateInitialValue;
        print(_dateInitialValue);
      });
    }
  }
}
