import 'package:data_table_2/data_table_2.dart';
import 'package:financeiro_pi/core/repositories/lista_repository.dart';
import 'package:flutter/material.dart';
import '../receb_screen.dart';

class TableContaRecebe extends StatefulWidget {
  const TableContaRecebe({ Key? key }) : super(key: key);

  @override
  _TableContaRecebeState createState() => _TableContaRecebeState();
}

class _TableContaRecebeState extends State<TableContaRecebe> {
  final tabela = ListaRepository.tabela;
  @override

  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
      child:  
            DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn(
                label: Text('Status'),
              ),
              DataColumn(
                label: Text('Título'),
              ),
              DataColumn(
                label: Text('Cliente'),
              ),
              DataColumn(
                label: Text('Vencimento'),
              ),
              DataColumn(
                label: Text('Valor'),
                numeric: true,
              ),
              DataColumn(
                label: Text('A pagar'),
                numeric: true,
              ),
              DataColumn(
                label: Text('Pago em'),
                numeric: true,
              ),
              DataColumn(
                label: Text('Valor pago'),
                numeric: true,
              ),
              DataColumn(
                label: Text(''),
                numeric: true,
              ),
              
            ],
            rows: List<DataRow>.generate(
                tabela.length,
                (lista) => DataRow(
                  cells: [
                    DataCell(Text(tabela[lista].status.toString())),
                    DataCell(Text(tabela[lista].titulo,)),
                    DataCell(Text(tabela[lista].cliente)),
                    DataCell(Text(tabela[lista].vencimento)),
                    DataCell(Text(tabela[lista].valor.toString())),
                    DataCell(Text(tabela[lista].aPagar.toString())),
                    DataCell(Text(tabela[lista].pagoEm,)),
                    DataCell(Text(tabela[lista].valorPago.toString(),)),
                    DataCell(
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              showDialog(
                              context: context,
                              builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Alteração de Registro"),
                                  Container(
                                    padding:const EdgeInsets.only(left: 150),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const RecebScreen()
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.cancel_outlined,color: Colors.red,)
                                    ),
                                  )
                                ],
                              ),
                              content: Padding(
                                padding:const EdgeInsets.all(8),
                                child: Form(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        keyboardType:TextInputType.text,
                                        decoration: const InputDecoration(
                                          labelText: "Tipo de Cobrança",
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:TextInputType.text,
                                        decoration:const InputDecoration(
                                          labelText:"Descrição",
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:TextInputType.datetime,
                                        decoration: const InputDecoration(
                                          labelText: "Vencimento",
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: "Valor do Titulo",
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        decoration:const InputDecoration(
                                          labelText: "Fornecedor",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisSize:MainAxisSize.max,
                                  children: <Widget>[
                                    Container(
                                      color: Colors.green,
                                      width: 200,
                                      child: TextButton(
                                        child: const Text('Salvar', style: TextStyle(color: Colors.white),),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width *0.01),
                                    Container(
                                      color: Colors.red,
                                      width: 200,
                                      child: TextButton(
                                        child: const Text('Cancelar',style: TextStyle(color: Colors.white),),
                                        onPressed: () {
                                          Navigator.push(
                                              context,MaterialPageRoute(
                                                builder:(context) => const RecebScreen()
                                              ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                                  ],
                                )
                              ],
                            );
                          });
                            },
                            child: const Icon(Icons.edit, color: Colors.yellow),
                          ),

                          //const Padding(padding: EdgeInsets.only(right: 30)),
                          
                          GestureDetector(
                            onTap: (){
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
                                    const Text("Realmente deseja excluir o registro ?"),
                                    Container(
                                      padding:const EdgeInsets.only(left: 10, bottom: 5,
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          const RecebScreen()),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons
                                                .cancel_outlined,
                                            color:
                                                Colors.red,
                                          )),
                                    )
                                  ]),
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
                                        child: const Text(
                                          'Sim',
                                          style: TextStyle(
                                              color: Colors
                                                  .white),
                                        ),
                                        onPressed: () {
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
                                      color: Colors.red,
                                      width: 200,
                                      //width: MediaQuery.of(context).size.width * 0.20,
                                      child: TextButton(
                                        child: const  Text(
                                          'Não',
                                          style: TextStyle(
                                              color: Colors
                                                  .white),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (context) =>
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
                            child: const Icon(Icons.delete, color: Colors.red),),
                        ],
                      )
                    )
                    ]))
  
                    ),
      );
  }
}