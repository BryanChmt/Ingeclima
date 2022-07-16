import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingeclimaproyecto/models/checkbox.dart';
import 'package:ingeclimaproyecto/pages/lista.dart';
import 'package:ingeclimaproyecto/provider/save_reporte.dart';
import 'package:open_file/open_file.dart';

class ContentReport extends StatefulWidget {
  @override
  _ContentReportState createState() => _ContentReportState();
}

class _ContentReportState extends State<ContentReport> {
  String modelo;
  String dropdown;
  FilePickerResult result;
  List path = [];
  String imagenbits;

  PlatformFile file;

  enviar() async {
    //asignacion de variables

    dropdown = dropdownStr;
    String jsonlist = jsonEncode(selecteditems);
    String pathlist = jsonEncode(imagenbits);
    print(jsonlist);

    Map<String, dynamic> info = await _savereport.save_reporte(
      pathlist,
      _marca.text,
      _serie.text,
      _succion.text,
      _unidad.text,
      _liquido.text,
      _equipo.text,
      _l1n.text,
      _l1.text,
      _l2.text,
      _l3.text,
      _temperaturas.text,
      _abanico.text,
      _rel.text,
      _placa.text,
      dropdown,
      jsonlist,
      _firma.text,
      _personal.text,
      _diagnos.text,
    );

    print(info);
    print('este es un mensaje para el servidor $path');
  }

  final _formKey = GlobalKey<FormState>();
  final _savereport = new SaveReporte();

  String dropdownStr = "UFINET";
  TextEditingController _modelo = TextEditingController();
  TextEditingController _marca = TextEditingController();
  TextEditingController _serie = TextEditingController();
  TextEditingController _succion = TextEditingController();
  TextEditingController _unidad = TextEditingController();
  TextEditingController _liquido = TextEditingController();
  TextEditingController _equipo = TextEditingController();
  TextEditingController _l1n = TextEditingController();
  TextEditingController _l1 = TextEditingController();
  TextEditingController _l2 = TextEditingController();
  TextEditingController _l3 = TextEditingController();
  TextEditingController _temperaturas = TextEditingController();
  TextEditingController _abanico = TextEditingController();
  TextEditingController _rel = TextEditingController();
  TextEditingController _placa = TextEditingController();

  //controllers de la parte inferior
  TextEditingController _firma = TextEditingController();
  TextEditingController _personal = TextEditingController();
  TextEditingController _diagnos = TextEditingController();

  final izquierda = [
    CheckBoxState(title: 'Revisión de cañuela y soporteria', id: 1),
    CheckBoxState(title: 'Revisión de termianles y aislamiento', id: 2),
    CheckBoxState(title: 'Revisión de bandeja y drenaje', id: 3),
    CheckBoxState(title: 'Revisión de control o termostato', id: 4),
    CheckBoxState(title: 'Revisión de filtro', id: 5),
    CheckBoxState(title: 'Revisión de batería del control', id: 6),
    CheckBoxState(title: 'Limpieza de turbina o aspas', id: 7),
    CheckBoxState(title: 'Revisión de carga refrigerante', id: 8),
    CheckBoxState(title: 'Revisión de tarjeta electrónica', id: 9),
    CheckBoxState(title: 'Revisión de alimentación eléctrica', id: 10),
  ];
  final derecha = [
    CheckBoxState(title: 'Revisión de vibraciones', id: 11),
    CheckBoxState(title: 'Revisión del nivel de aceite', id: 12),
    CheckBoxState(title: 'Revisión de fugas de refrigerantes', id: 13),
    CheckBoxState(title: 'Limpieza de serpentines', id: 14),
    CheckBoxState(title: 'Revisión de contactos del contacdor', id: 15),
    CheckBoxState(title: 'Limpieza de chasis(encerado)', id: 16),
    CheckBoxState(title: 'Limpieza de sistema eléctrico', id: 17),
    CheckBoxState(title: 'Revisión rodamientos de motores', id: 18),
    CheckBoxState(title: 'Peinar serpentines', id: 19),
    CheckBoxState(title: 'Revisión de bomba de condensado', id: 20),
  ];

  var selecteditems = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                width: size.width * 0.90,
                child: Column(
                  children: [
                    Container(
                      color: Color(0xFF2464ec),
                      width: size.width * 0.90,
                      child: Center(
                          child: Text('INFORME TÉCNICO',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30.0))),
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 11.0, left: 15),
                            child: DropdownButton(
                              isExpanded: true,
                              iconSize: 70.0,
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.black),
                              value: dropdownStr,
                              onChanged: (String newValue) {
                                setState(
                                  () {
                                    dropdownStr = newValue;
                                  },
                                );
                              },
                              items: [
                                'UFINET',
                                'Tigo',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: _content(
                            'Modelo:',
                            TextInputType.name,
                            FilteringTextInputFormatter.singleLineFormatter,
                            _modelo,
                            (String value) {
                              if (value.isEmpty) {
                                return "Campo requerido";
                              } else
                                return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: _content(
                            'Marca:',
                            TextInputType.name,
                            FilteringTextInputFormatter.singleLineFormatter,
                            _marca,
                            (String value) {
                              if (value.isEmpty) {
                                return "Campo requerido";
                              } else
                                return null;
                            },
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: _content(
                            'Serie:',
                            TextInputType.name,
                            FilteringTextInputFormatter.singleLineFormatter,
                            _serie,
                            (String value) {
                              if (value.isEmpty) {
                                return "Campo requerido";
                              } else
                                return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    _autoSize('Voltaje:', 1, 35.0),
                    Row(
                      children: [
                        Flexible(flex: 2, child: _onlydigits('L1-N', _l1n)),
                        Flexible(flex: 2, child: _onlydigits('L1-2', _l1)),
                        Flexible(flex: 2, child: _onlydigits('L1-L2', _l2)),
                        Flexible(flex: 2, child: _onlydigits('L2-L3', _l3)),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: _content(
                            'Presión de Succión:',
                            TextInputType.name,
                            FilteringTextInputFormatter.singleLineFormatter,
                            _succion,
                            (String value) {
                              if (value.isEmpty) {
                                return null;
                              } else
                                return null;
                            },
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: _content(
                            'Tipo de Unidad:',
                            TextInputType.name,
                            FilteringTextInputFormatter.singleLineFormatter,
                            _unidad,
                            (String value) {
                              if (value.isEmpty) {
                                return null;
                              } else
                                return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: _content(
                            'Presión de Liquido:',
                            TextInputType.name,
                            FilteringTextInputFormatter.singleLineFormatter,
                            _liquido,
                            (String value) {
                              if (value.isEmpty) {
                                return null;
                              } else
                                return null;
                            },
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: _content(
                            'Ubicación del Equipo:',
                            TextInputType.name,
                            FilteringTextInputFormatter.singleLineFormatter,
                            _equipo,
                            (String value) {
                              if (value.isEmpty) {
                                return null;
                              } else
                                return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _autoSize('Temperaturas del', 2, 15.0),
                            _autoSize('Sitio', 2, 15.0),
                          ],
                        ),
                        Flexible(
                            flex: 2, child: _onlydigits('', _temperaturas)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _autoSize('Amperaje del', 2, 15.0),
                            _autoSize('Motor Abanico', 2, 15.0),
                          ],
                        ),
                        Flexible(flex: 2, child: _onlydigits('', _abanico)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _autoSize('Amperaje del', 2, 15.0),
                            _autoSize('Compresor', 2, 15.0),
                          ],
                        ),
                        Flexible(flex: 2, child: _onlydigits('Real', _rel)),
                        Flexible(flex: 2, child: _onlydigits('Placa', _placa)),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF2464ec),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                      ),
                      width: size.width * 0.90,
                      child: Center(
                          child: Text('PUNTOS DE INSPECCIÓN',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30.0))),
                    ),
                    _checked(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          pickFile();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: _autoSize('Seleccionar imagen', 1, 20.0),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF2464ec)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          loadSelected(result.files);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0),
                          child: _autoSize('Vista previa', 1, 20.0),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF2464ec)),
                        ),
                      ),
                    ),
                    _contenidoInferior(context),
                    _diagnostico()
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("Validated");
                      enviar();
                    } else {
                      print("Not Validated");
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 15.0),
                    child: _autoSize('Guardar Reporte', 1, 20.0),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF2464ec)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _checked() {
    return Container(
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0)),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: ListView(
                children: [...izquierda.map(bodySingle).toList()],
              ),
            ),
            Flexible(
              flex: 2,
              child: ListView(
                children: [...derecha.map(bodySingle).toList()],
              ),
            ),
          ],
        ));
  }

  Widget bodySingle(CheckBoxState checkbox) {
    return CheckboxListTile(
        value: checkbox.value,
        controlAffinity: ListTileControlAffinity.platform,
        title: Text(checkbox.title),
        activeColor: Color(0xFF2464ec),
        onChanged: (bool value) {
          setState(() {
            // selecteditems.clear();
            checkbox.value = value;

            if (checkbox.value == true) {
              selecteditems.add(checkbox.id);
            } else {
              selecteditems.forEach((element) {
                print(element);
                if (checkbox.id == element) {
                  selecteditems.remove(element);
                }
              });
            }
          });
        });
  }

  Widget _content(
      String dato,
      TextInputType tipo,
      FilteringTextInputFormatter valid,
      TextEditingController controller,
      Function validator) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextFormField(
        controller: controller,
        inputFormatters: <TextInputFormatter>[valid],
        keyboardType: tipo,
        style: TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          labelText: dato,
        ),
        validator: validator,
        onChanged: (value) {
          modelo = value;
        },
      ),
    );
  }

  Widget _onlydigits(String dato, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.singleLineFormatter
        ],
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          labelText: dato,
        ),
      ),
    );
  }

  Widget _contenidoInferior(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Técnico:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Campo requerido";
                    } else
                      return null;
                  },
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Firma',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          VerticalDivider(
            width: 80.0,
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Firma y nombre del Cliente:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Campo requerido";
                    } else
                      return null;
                  },
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Firma',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _autoSize(String data, int lines, double size) {
    return AutoSizeText(
      data,
      maxLines: lines,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  Widget _diagnostico() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Diagnóstico', border: OutlineInputBorder()),
      maxLines: 15,
    );
  }

  void pickFile() async {
    result = await FilePicker.platform.pickFiles(
      
      allowMultiple: true,
      type: FileType.image,
    );

    if (result == null) return;

    loadSelected(result.files);

    setState(() {
      path = result.names;
    });


    print('estos son los nombres enlistados ${path }');

    
    //List bytes = File(path.toString()).readAsBytesSync();
    //imagenbits = base64.encode(bytes);
   // print('esto es el traslado a bits $imagenbits');
  }

  void loadSelected(List<PlatformFile> files) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ListaArchivos(files: files, onOpenedFile: viewFile),
      ),
    );
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
