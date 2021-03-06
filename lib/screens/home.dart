// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:easy_mask/easy_mask.dart';
import 'package:financeiro_pi/ContasPagar/contaspagar.dart';
import 'package:financeiro_pi/DataTableMysql/services_contas_a_receber.dart';
import 'package:financeiro_pi/DataTableMysql/financeiro_contas_a_receber.dart';
import 'package:financeiro_pi/core/repositories/lista_repository.dart';
import 'package:financeiro_pi/screens/contas_pagar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashBoard extends StatefulWidget {
  DashBoard() : super();

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  late List<Lista> _lista_contas_recebe;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late List<Lista> _resgistroFiltrado;

  @override
  void initState() {
    super.initState();
    _getRegistros();
    _lista_contas_recebe = [];
    _resgistroFiltrado = _lista_contas_recebe;
    _scaffoldKey = GlobalKey();
  }



  _getRegistros() {
    Services.getLista().then((lista) {
      setState(() {
        _lista_contas_recebe = lista;
        _resgistroFiltrado = lista;
      });
    });
  }
  

  SingleChildScrollView _contas_a_receber() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID'.toUpperCase())),
            DataColumn(label: Text('Status'.toUpperCase())),
            DataColumn(label: Text('Titulo'.toUpperCase())),
            DataColumn(label: Text('Cliente'.toUpperCase())),
            DataColumn(label: Text('Vencimento'.toUpperCase())),
            DataColumn(label: Text('Valor a pagar'.toUpperCase())),
            DataColumn(label: Text('Valor'.toUpperCase())),
            DataColumn(label: Text('Valor Pago'.toUpperCase())),
            DataColumn(label: Text('Data Pagamento'.toUpperCase())),
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
            Text("Contas a receber", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            Expanded(child: _contas_a_receber()),
            Expanded(child: ContasPagarTabelaHome()),
          ],
        ),
      ),
    );
  }
}
