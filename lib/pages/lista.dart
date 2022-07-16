import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ListaArchivos extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  ListaArchivos({Key key, this.files, this.onOpenedFile}) : super(key: key);

  @override
  State<ListaArchivos> createState() => _ListaArchivosState();
}

class _ListaArchivosState extends State<ListaArchivos> {




  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Archivos seleccionados'),backgroundColor: Color(0xFF2464ec),),
      body: SingleChildScrollView(

        child: Container(
          child: Column(
            children: [
              Container(
                height: size.height * 0.90,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  
                  itemCount: widget.files.length = 5,
                  itemBuilder: (context,index){
                    final files = widget.files[index];
                    return Container(
                      child: buildList(files));
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(PlatformFile file){
    return (file == null)
    ? Container(
        color: Colors.white10,
      )
    : Container(
      color: Colors.red,
      child: Image.file(
          File(file.path.toString()),
          fit: BoxFit.cover,
        ),
    );
  }



}