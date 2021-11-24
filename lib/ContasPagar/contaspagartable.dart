import 'package:financeiro_pi/DataTableMysql/services_contas_a_pagar.dart';
import 'package:financeiro_pi/DataTableMysql/financeiro_contas_a_pagar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContasPagarTable extends StatefulWidget {
  ContasPagarTable() : super();
  final String title = 'Inicio';

  @override
  ContasPagarTableState createState() => ContasPagarTableState();
}

class ContasPagarTableState extends State<ContasPagarTable> {
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

  @override
  void initState() {
    super.initState();
    _getRegistros();
    _lista = [];
    _isatualizado = false;
    _titulo = widget.title;
    _scaffoldKey = GlobalKey();

    _aPagarController = TextEditingController();
    _clienteController = TextEditingController();
    _pagoEmController = TextEditingController();
    _statuController = TextEditingController();
    _tituloController = TextEditingController();
    _valorController = TextEditingController();
    _valorPagoController = TextEditingController();
    _vencimentoController = TextEditingController();
  }

  _showTitulo(String msg) {
    setState(() {
      _titulo = msg;
    });
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
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
    _showTitulo('Adicionando pessoa');
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
      _showTitulo(widget.title);
    });
  }

  _getRegistros() {
    _showTitulo('Carregando dados... aguardade');
    Services.getLista().then((lista) {
      setState(() {
        _lista = lista;
      });
      _showTitulo(widget.title);
    });
  }

  _deletePessoa(Lista lista) {
    _showTitulo('Deletando pessoa');
    Services.deleteLista(lista.id).then((result) {
      _getRegistros();
      _showTitulo(widget.title);
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

  _updateContasPagar(Lista lista) {
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
    _showTitulo('Atualizando pessoa');
    Services.updateLista(
            lista.id,
            //id,
            _statuController.text,
            _tituloController.text,
            _clienteController.text,
            _vencimentoController.text,
            _valorController.text,
            _aPagarController.text,
            _pagoEmController.text,
            _valorPagoController.text)
        .then((result) {
      _clearValues();
      _getRegistros();
      _showTitulo(widget.title);
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
            DataColumn(label: Text('Ações')),
          ],
          rows: _lista
              .map((lista) => DataRow(cells: [
                    DataCell(
                      Text(lista.id),
                    ),
                    DataCell(
                      Text(lista.statu),
                    ),
                    DataCell(
                      Text(lista.titulo),
                    ),
                    DataCell(
                      Text(lista.cliente),
                    ),
                    DataCell(
                      Text(lista.vencimento),
                    ),
                    DataCell(
                      Text(lista.apagar),
                    ),
                    DataCell(
                      Text(lista.valor),
                    ),
                    DataCell(
                      Text(lista.valorpago),
                    ),
                    DataCell(
                      Text(lista.pagoem),
                    ),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _deletePessoa(lista);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.update,
                            color: Colors.yellow,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Cadatro de Registro"),
                                          Container(
                                            padding: EdgeInsets.only(left: 150),
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                icon: const Icon(
                                                  Icons.cancel_outlined,
                                                  color: Colors.red,
                                                )),
                                          )
                                        ]),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Form(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: TextField(
                                                controller: _statuController,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                        hintText: 'Status'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: TextField(
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                controller: _tituloController,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                        hintText: 'Titulo'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: TextField(
                                                controller: _clienteController,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                        hintText: 'Cliente'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: TextField(
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      10)
                                                ],
                                                controller:
                                                    _vencimentoController,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                        hintText: 'Vencimento'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: TextField(
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      10)
                                                ],
                                                controller: _aPagarController,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                        hintText:
                                                            'Valor a pagar'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: TextField(
                                                controller: _valorController,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                        hintText: 'Valor'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: TextField(
                                                controller:
                                                    _valorPagoController,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                        hintText: 'Valor Pago'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: TextField(
                                                controller: _pagoEmController,
                                                decoration:
                                                    InputDecoration.collapsed(
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
                                        mainAxisSize: MainAxisSize.max,
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            color: Colors.green,
                                            width: 200,
                                            //width: MediaQuery.of(context).size.width * 0.20,
                                            child: TextButton(
                                              child: new Text(
                                                'Salvar',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                _updateContasPagar(lista);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01),
                                          Container(
                                            color: Colors.red,
                                            width: 200,
                                            //width: MediaQuery.of(context).size.width * 0.20,
                                            child: TextButton(
                                              child: new Text(
                                                'Cancelar',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
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
                        ),
                      ],
                    )),
                  ]))
              .toList(),
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
                                            builder: (BuildContext context) {
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
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 150),
                                                        child: IconButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            icon: const Icon(
                                                              Icons
                                                                  .cancel_outlined,
                                                              color: Colors.red,
                                                            )),
                                                      )
                                                    ]),
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Form(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: TextField(
                                                            controller:
                                                                _statuController,
                                                            decoration:
                                                                InputDecoration
                                                                    .collapsed(
                                                                        hintText:
                                                                            'Status'),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: TextField(
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            controller:
                                                                _tituloController,
                                                            decoration:
                                                                InputDecoration
                                                                    .collapsed(
                                                                        hintText:
                                                                            'Titulo'),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: TextField(
                                                            controller:
                                                                _clienteController,
                                                            decoration:
                                                                InputDecoration
                                                                    .collapsed(
                                                                        hintText:
                                                                            'Cliente'),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: TextField(
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  10)
                                                            ],
                                                            controller:
                                                                _vencimentoController,
                                                            decoration:
                                                                InputDecoration
                                                                    .collapsed(
                                                                        hintText:
                                                                            'Vencimento'),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: TextField(
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  10)
                                                            ],
                                                            controller:
                                                                _aPagarController,
                                                            decoration:
                                                                InputDecoration
                                                                    .collapsed(
                                                                        hintText:
                                                                            'Valor a pagar'),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: TextField(
                                                            controller:
                                                                _valorController,
                                                            decoration:
                                                                InputDecoration
                                                                    .collapsed(
                                                                        hintText:
                                                                            'Valor'),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: TextField(
                                                            controller:
                                                                _valorPagoController,
                                                            decoration:
                                                                InputDecoration
                                                                    .collapsed(
                                                                        hintText:
                                                                            'Valor Pago'),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: TextField(
                                                            controller:
                                                                _pagoEmController,
                                                            decoration:
                                                                InputDecoration
                                                                    .collapsed(
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
                                                        MainAxisSize.max,
                                                    //mainAxisAlignment: MainAxisAlignment.center,
                                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        color: Colors.green,
                                                        width: 200,
                                                        //width: MediaQuery.of(context).size.width * 0.20,
                                                        child: TextButton(
                                                          child: new Text(
                                                            'Salvar',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          onPressed: () {
                                                            _addContasPagar();
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
                                                        color: Colors.red,
                                                        width: 200,
                                                        //width: MediaQuery.of(context).size.width * 0.20,
                                                        child: TextButton(
                                                          child: new Text(
                                                            'Cancelar',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          onPressed: () {},
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
                                        shape: MaterialStateProperty.all(
                                            CircleBorder()),
                                        padding: MaterialStateProperty.all(
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
            Expanded(child: _dados()),
          ],
        ),
      ),
    );
  }
}
