import 'package:financeiro_pi/core/models/model_lista.dart';

class ListaRepository {

  static List<Lista> tabela = [

    Lista(
      
          status: 2,
          titulo: 'Cadastro', 
          cliente: 'Esdras Lemos', 
          vencimento: '03/10/2021', 
          valor: 10000, 
          aPagar: 1000, 
          pagoEm: 'Não pago.', 
          valorPago: 10, 
          
  ),

      Lista(
      
          status: 1,
          titulo: 'Cadastro', 
          cliente: 'Marcos Antônio', 
          vencimento: '10/10/2021', 
          valor: 1233, 
          aPagar: 500, 
          pagoEm: '05/10/2021', 
          valorPago: 500, 
          
  ),

      Lista(
      
          status: 1,
          titulo: 'Cadastro', 
          cliente: 'Gabriel Paulo', 
          vencimento: '07/10/2021', 
          valor: 102300, 
          aPagar: 1000, 
          pagoEm: 'Não pago.', 
          valorPago: 0, 
          
  ),

      Lista(
      
          status: 3,
          titulo: 'Cadastro', 
          cliente: 'Victor Pereira', 
          vencimento: '05/10/2021', 
          valor: 1452, 
          aPagar: 1000, 
          pagoEm: 'Não pago.', 
          valorPago: 0, 
          
  ),

        Lista(
      
          status: 2,
          titulo: 'Cadastro', 
          cliente: 'Gabriel Phillipy', 
          vencimento: '15/10/2021', 
          valor: 108452, 
          aPagar: 108452, 
          pagoEm: 'Não pago.', 
          valorPago: 0, 
          
  ),


  ];


}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}



