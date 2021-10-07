// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:financeiro_pi/repositories/lista_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/services.dart';
import '../../responsive.dart';
import 'home/components/side_menu.dart';
import 'home/receb_screen.dart';

// ignore: camel_case_types
class Registro_teste extends StatefulWidget {
  const Registro_teste({Key? key}) : super(key: key);

  @override
  _Registro_testeState createState() => _Registro_testeState();
}

// ignore: camel_case_types
class _Registro_testeState extends State<Registro_teste> {
  String dropdownValue = "Um";
  final tabela = ListaRepository.tabela;
  @override
  Widget build(BuildContext context) {
    bool visivel;
    Responsive.isDesktop(context) ? visivel = false : visivel = true;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Visibility(
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: visivel,
            );
          },
        ),
        title: Text("Financeiro", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.only(top: 15, right: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                text: 'Victor Pereira ',
                children: const [
                  WidgetSpan(
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
                                                                          Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => const RecebScreen()),
                                                                          );
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
                                                                TextFormField(
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        "Título",
                                                                  ),
                                                                ),
                                                                TextFormField(
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .datetime,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        "Vencimento",
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
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
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
                                                                      () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const RecebScreen()),
                                                                    );
                                                                  },
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
                padding: const EdgeInsets.all(20),
                child: LimitedBox(
                  maxHeight: 200,
                  maxWidth: 200,
                  child: DataTable2(
                      columnSpacing: 70,
                      horizontalMargin: 10,
                      minWidth: 200,
                      columns: [
                        new DataColumn2(
                          label: Text('Título'),
                          size: ColumnSize.M,
                        ),
                        DataColumn2(
                          label: Text('Cliente'),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('Vencimento'),
                          size: ColumnSize.M,
                        ),
                        DataColumn2(
                          label: Text('Valor'),
                          size: ColumnSize.M,
                          numeric: true,
                        ),
                        DataColumn2(
                          label: Text('A pagar'),
                          size: ColumnSize.M,
                          numeric: true,
                        ),
                        DataColumn2(
                          label: Text('Pago em'),
                          size: ColumnSize.M,
                        ),
                        DataColumn2(
                          label: Center(
                            child: Text('Valor pago'),
                          ),
                          numeric: true,
                        ),
                        DataColumn2(
                          label: Center(child: Text('Ações')),
                          size: ColumnSize.M,
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          tabela.length,
                          (lista) => DataRow(cells: [
                                DataCell(Text(
                                  tabela[lista].titulo,
                                )),
                                DataCell(Text(tabela[lista].cliente)),
                                DataCell(Text(tabela[lista].vencimento)),
                                DataCell(Text(tabela[lista].valor.toString())),
                                DataCell(Text(tabela[lista].aPagar.toString())),
                                DataCell(Text(tabela[lista].pagoEm)),
                                DataCell(Center(
                                    child: Text(
                                  tabela[lista].valorPago.toString(),
                                ))),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.yellow,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(FontAwesome.docs),
                                        color: Colors.grey,
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Duplicar Título'),
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child:
                                                        DropdownButton<String>(
                                                      value: dropdownValue,
                                                      style: const TextStyle(
                                                          color: Colors
                                                              .deepPurple),
                                                      underline: Container(
                                                        height: 2,
                                                        color: Colors
                                                            .deepPurpleAccent,
                                                      ),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          dropdownValue =
                                                              newValue!;
                                                        });
                                                      },
                                                      items: <String>[
                                                        'Um',
                                                        'Dois',
                                                        'Três',
                                                        'Quatro',
                                                        'Cinco',
                                                        'Seis',
                                                        'Sete',
                                                        'Oito',
                                                        'Nove',
                                                        'Dez',
                                                        'Onze',
                                                        'Doze',
                                                      ].map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ]))),
                )),
          ],
        ),
      ),
    );
  }
}
