// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:financeiro_pi/ContasPagar/contaspagartable.dart';
import 'package:financeiro_pi/DataTableMysql/financeiro_contas_a_pagar.dart';
import 'package:financeiro_pi/DataTableMysql/services_contas_a_pagar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home/components/custom_appbar.dart';
import 'home/components/side_menu.dart';
import 'home/components/tables.dart';
import 'home/receb_screen.dart';

class ContasPagar extends StatefulWidget {
  const ContasPagar({Key? key}) : super(key: key);

  @override
  _ContasPagarState createState() => _ContasPagarState();
}

// ignore: camel_case_types
class _ContasPagarState extends State<ContasPagar> {
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

  _addContasPagar() {
    if (_aPagarController.text.isEmpty ||
        _clienteController.text.isEmpty ||
        _pagoEmController.text.isEmpty ||
        _statuController.text.isEmpty ||
        _tituloController.text.isEmpty ||
        _valorPagoController.text.isEmpty ||
        _valorController.text.isEmpty ||
        _vencimentoController.text.isEmpty) {
      print('Textos vazios');
      return;
    }

    Services.addLista(
            _aPagarController.text,
            _clienteController.text,
            _pagoEmController.text,
            _statuController.text,
            _tituloController.text,
            _valorPagoController.text,
            _valorController.text,
            _vencimentoController.text)
        .then((result) {
      _clearValues();
      _getRegistros();
    });
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
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(17.0),
                                      bottomLeft: Radius.circular(17.0)),
                                ),
                                child: Form(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Pesquisar...",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 20),
                                        child: Wrap(
                                          spacing: 50,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        scrollable: true,
                                                        title: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                  "Cadatro de Registro"),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            150),
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .cancel_outlined,
                                                                          color:
                                                                              Colors.red,
                                                                        )),
                                                              )
                                                            ]),
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          child: Form(
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        _statuController,
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            'Status'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      TextField(
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly
                                                                    ],
                                                                    controller:
                                                                        _tituloController,
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            'Titulo'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        _clienteController,
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            'Cliente'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      TextField(
                                                                    inputFormatters: [
                                                                      LengthLimitingTextInputFormatter(
                                                                          10)
                                                                    ],
                                                                    controller:
                                                                        _vencimentoController,
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            'Vencimento'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      TextField(
                                                                    inputFormatters: [
                                                                      LengthLimitingTextInputFormatter(
                                                                          10)
                                                                    ],
                                                                    controller:
                                                                        _aPagarController,
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            'Valor a pagar'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        _valorController,
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            'Valor'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        _valorPagoController,
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            'Valor Pago'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        _pagoEmController,
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            'Data de pagamento'),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            //mainAxisAlignment: MainAxisAlignment.center,
                                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: <Widget>[
                                                              Container(
                                                                color: Colors
                                                                    .green,
                                                                width: 200,
                                                                //width: MediaQuery.of(context).size.width * 0.20,
                                                                child:
                                                                    TextButton(
                                                                  child:
                                                                      new Text(
                                                                    'Salvar',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    _addContasPagar();
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const ContasPagar()),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.01),
                                                              Container(
                                                                color:
                                                                    Colors.red,
                                                                width: 200,
                                                                //width: MediaQuery.of(context).size.width * 0.20,
                                                                child:
                                                                    TextButton(
                                                                  child:
                                                                      new Text(
                                                                    'Cancelar',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.02,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Icon(Icons.add, size: 20),
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                        CircleBorder()),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.all(20)),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color(0xFF5C77FE)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            // começa a tabela
            Container(
                width: 300,
                height: 300,
                color: Colors.white,
                padding: const EdgeInsets.all(1),
                child: ContasPagarTable()),
          ],
        ),
      ),
    );
  }
}
