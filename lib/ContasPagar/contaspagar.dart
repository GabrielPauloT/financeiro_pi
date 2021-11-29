// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:brasil_fields/brasil_fields.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:financeiro_pi/DataTableMysql/services_contas_a_pagar.dart';
import 'package:financeiro_pi/DataTableMysql/financeiro_contas_a_pagar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContasPagarTabelaHome extends StatefulWidget {
  ContasPagarTabelaHome() : super();
  final String title = 'Inicio';

  @override
  ContasPagarTabelaHomeState createState() => ContasPagarTabelaHomeState();
}

class ContasPagarTabelaHomeState extends State<ContasPagarTabelaHome> {
  late List<Lista> _lista;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late Lista _select;
  late bool _isatualizado;
  late String _titulo;

  late TextEditingController _clienteController;
  late TextEditingController _vencimentoController;
  late TextEditingController _pagoEmController;
  late TextEditingController _statuController;
  late TextEditingController _valorController;
  late TextEditingController _aPagarController;
  late TextEditingController _valorPagoController;
  late TextEditingController _tituloController;
  late TextEditingController _controller;
  late List<Lista> _resgistroFiltrado;
  String _searchResult = '';

  @override
  void initState() {
    super.initState();
    _getRegistros();
    _lista = [];
    _resgistroFiltrado = _lista;
    _isatualizado = false;
    _titulo = widget.title;
    _scaffoldKey = GlobalKey();

    _controller = TextEditingController();
    _aPagarController = TextEditingController();
    _clienteController = TextEditingController();
    _pagoEmController = TextEditingController();
    _statuController = TextEditingController();
    _tituloController = TextEditingController();
    _valorController = TextEditingController();
    _valorPagoController = TextEditingController();
    _vencimentoController = TextEditingController();
  }



  _showSnackBar(context, message) {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _getRegistros() {
  
    Services.getLista().then((lista) {
      setState(() {
        _lista = lista;
        _resgistroFiltrado = lista;
      });
     
    });
  }

  SingleChildScrollView _dados() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Titulo')),
            DataColumn(label: Text('Cliente')),
            DataColumn(label: Text('Vencimento')),
            DataColumn(label: Text('Valor a pagar')),
            DataColumn(label: Text('Valor')),
            DataColumn(label: Text('Valor Pago')),
            DataColumn(label: Text('Data Pagamento')),

          ],
          rows: List.generate(
              _resgistroFiltrado.length,
              (lista) => DataRow(cells: [
                    DataCell(
                      Text(_resgistroFiltrado[lista].id),
                    ),
                    DataCell(
                      Text(_resgistroFiltrado[lista].statu),
                    ),
                    DataCell(
                      Text(_resgistroFiltrado[lista].titulo),
                    ),
                    DataCell(
                      Text(_resgistroFiltrado[lista].cliente),
                    ),
                    DataCell(
                      Text(_resgistroFiltrado[lista].vencimento),
                    ),
                    DataCell(
                      Text(_resgistroFiltrado[lista].apagar),
                    ),
                    DataCell(
                      Text(_resgistroFiltrado[lista].valor),
                    ),
                    DataCell(
                      Text(_resgistroFiltrado[lista].valorpago),
                    ),
                    DataCell(
                      Text(_resgistroFiltrado[lista].pagoem),
                    ),
                  ])).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,),
            Text("Contas a Pagar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            Expanded(child: _dados()),
          ],
        ),
      ),
    );
  }
}
