// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:financeiro_pi/repositories/lista_repository.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class HomeII extends StatelessWidget {
  const HomeII({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabela = ListaRepository.tabela;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title:
            Text("Financeiroo", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DataTable2(
            columnSpacing: 70,
            horizontalMargin: 10,
            minWidth: 400,
            columns: [
              new DataColumn2(
                label: Text('Título'),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: Text('Cliente'),
                size: ColumnSize.M,
              ),
              DataColumn2(
                label: Text('Vencimento'),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: Text('Valor'),
                size: ColumnSize.S,
                numeric: true,
              ),
              DataColumn2(
                label: Text('A pagar'),
                size: ColumnSize.S,
                numeric: true,
              ),
              DataColumn2(
                label: Text('Pago em'),
                size: ColumnSize.S,
              ),
              DataColumn(
                label: Text('Valor pago'),
                numeric: true,
              ),
            ],
            rows: List<DataRow>.generate(
                tabela.length,
                (lista) => DataRow(cells: [
                      DataCell(Text(tabela[lista].titulo)),
                      DataCell(Text(tabela[lista].cliente)),
                      DataCell(Text(tabela[lista].vencimento)),
                      DataCell(Text(tabela[lista].valor.toString())),
                      DataCell(Text(tabela[lista].aPagar.toString())),
                      DataCell(Text(tabela[lista].pagoEm)),
                      DataCell(Text(tabela[lista].valorPago.toString())),
                    ]))),
      ),
    );
  }
}
