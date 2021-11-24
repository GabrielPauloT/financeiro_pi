// ignore_for_file: prefer_collection_literals, constant_identifier_names, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'financeiro_contas_a_receber.dart';

class Services {
  static const ROOT =
      'http://172.19.21.36/financeiro_pi/db_contas_a_receber.php';

  static const _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_EMP_ACTION = 'ADD_EMP';
  static const _DELETE_EMP_ACTION = 'DELETE_EMP';

  static Future<List<Lista>> getLista() async {
    try {
      var map = Map<String, dynamic>();
      map['acao'] = _GET_ALL_ACTION;

      final response = await http.post((Uri.parse(ROOT)), body: map);
      print('getLista Response: ${response.body}');
      if (response.statusCode == 200) {
        List<Lista> list = parseResponse(response.body);
        return list;
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty(); // return an empty list on exception/error
    }
  }

  static List<Lista> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Lista>((json) => Lista.fromJson(json)).toList();
  }

  // Method to add Lista to the database...
  static Future<String> addLista(
      String statu,
      String titulo,
      String cliente,
      String vencimento,
      String valor,
      String apagar,
      String pagoem,
      String valorpago) async {
    try {
      var map = Map<String, dynamic>();
      map['acao'] = _ADD_EMP_ACTION;
      map['statu'] = statu;
      map['titulo'] = titulo;
      map['cliente'] = cliente;
      map['vencimento'] = vencimento;
      map['valor'] = valor;
      map['apagar'] = apagar;
      map['pagoem'] = pagoem;
      map['valorpago'] = valorpago;

      final response = await http.post((Uri.parse(ROOT)), body: map);

      print('addLista Response: ${response.body}');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to Delete an Lista from Database...
  static Future<String> deleteLista(String id) async {
    try {
      var map = Map<String, dynamic>();
      map['acao'] = _DELETE_EMP_ACTION;
      map['id'] = id;
      final response = await http.post((Uri.parse(ROOT)), body: map);
      print('deleteLista Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }

  // Method to update an Lista in Database...
  static Future<String> updateLista(
      String id,
      String statu,
      String titulo,
      String cliente,
      String vencimento,
      String valor,
      String apagar,
      String pagoem,
      String valorpago) async {
    try {
      var map = Map<String, dynamic>();
      map['acao'] = _UPDATE_EMP_ACTION;
      map['id'] = id;
      map['statu'] = statu;
      map['titulo'] = titulo;
      map['cliente'] = cliente;
      map['vencimento'] = vencimento;
      map['valor'] = valor;
      map['apagar'] = apagar;
      map['pagoem'] = pagoem;
      map['valorpago'] = valorpago;

      final response = await http.post((Uri.parse(ROOT)), body: map);

      print('updateLista Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
