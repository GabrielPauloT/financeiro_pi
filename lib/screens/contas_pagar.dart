// ignore_for_file: prefer_const_constructors, unnecessary_new
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
  @override
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
                                                        const EdgeInsets.all(8),
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
                                                                  "Tipo de Cobrança",
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  "Descrição",
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
                                                          TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  "Valor do Titulo",
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  "Fornecedor",
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
                child: TableContaRecebe()),
          ],
        ),
      ),
    );
  }
}
