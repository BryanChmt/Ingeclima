import 'dart:convert';
import 'package:http/http.dart' as http;

class SaveReporte {
  static final String _apiKey = '012948189298389189';
  static final String _baseURL = 'ingeclima.net';
  static final String _endpoint = '/webservice/service.php';

  Future<Map<String, dynamic>> save_reporte(
    String modelo,
    String marca,
    String serie,
    String succion,
    String unidad,
    String liquido,
    String equipo,
    String l1n,
    String l1,
    String l2,
    String l3,
    String temperaturas,
    String abanico,
    String rel,
    String placa,
    String dropdown,
    String selectedcheck,
    String  cliente,
    String  personal,
    String  diagnos,

    // List check
  ) async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'post_reporte',
      'api_key': _apiKey,
      'modelo': modelo,
      'marca': marca,
      'serie': serie,
      'succion': succion,
      'unidad': unidad,
      'liquido': liquido,
      'equipo': equipo,
      'l1n': l1n,
      'l1': l1,
      'l2': l2,
      'l3': l3,
      'temperaturas': temperaturas,
      'abanico': abanico,
      'rel': rel,
      'placa': placa,
      'dropdow': dropdown,
      'check': selectedcheck,
      'cliente' :cliente,
      'personal':personal,
      'diagnos':diagnos,
    });

    print('URL: {$url}');

    final response = await http.get(url,
    //  headers: {
    //    'Access-Control-Allow-Origin': '*',
    //  }
    );
    print(json.decode(response.body));
    return {'error': false, 'report': json.decode(response.body)};

  }
}
