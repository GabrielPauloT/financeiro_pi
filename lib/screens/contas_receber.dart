// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:financeiro_pi/ContasReceber/contasrecebertable.dart';
import 'package:financeiro_pi/DataTableMysql/services_contas_a_receber.dart';
import 'package:financeiro_pi/DataTableMysql/financeiro_contas_a_receber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home/components/custom_appbar.dart';
import 'home/components/side_menu.dart';
import 'home/components/tables.dart';
import 'home/receb_screen.dart';

class ContasReceber extends StatefulWidget {
  const ContasReceber({Key? key}) : super(key: key);

  @override
  _ContasReceberState createState() => _ContasReceberState();
}

// ignore: camel_case_types
class _ContasReceberState extends State<ContasReceber> {
  late List<Lista> _lista;
  late TextEditingController _clienteController;
  late TextEditingController _vencimentoController;
  late TextEditingController _pagoEmController;
  late TextEditingController _statuController;
  late TextEditingController _valorController;
  late TextEditingController _aPagarController;
  late TextEditingController _valorPagoController;
  late TextEditingController _tituloController;
  @override
  void initState() {
    super.initState();
    _getRegistros();
    _aPagarController = TextEditingController();
    _clienteController = TextEditingController();
    _pagoEmController = TextEditingController();
    _statuController = TextEditingController();
    _tituloController = TextEditingController();
    _valorController = TextEditingController();
    _valorPagoController = TextEditingController();
    _vencimentoController = TextEditingController();
  }

  _getRegistros() {
    Services.getLista().then((lista) {
      setState(() {
        _lista = lista;
      });
    });
  }

  _clearValues() {
    _aPagarController.text = '';
    _clienteController.text = '';
    _pagoEmController.text = '';
    _statuController.text = '';
    _tituloController.text = '';
    _valorController.text = '';
    _valorPagoController.text = '';
    _vencimentoController.text = '';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: new CustomAppBar(),
      backgroundColor: Color(0xFFF4F4F7),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
                color: Color(0xFFEBEBEE),
                height: 70,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [],
                )),
            // começa a tabela
            Container(
                width: 400,
                height: 500,
                color: Colors.white,
                padding: const EdgeInsets.all(1),
                child: ContasReceberTable()),
          ],
        ),
      ),
    );
  }
}
