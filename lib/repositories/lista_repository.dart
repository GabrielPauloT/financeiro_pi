import 'package:financeiro_pi/models/model_lista.dart';

class ListaRepository {

  static List<Lista> tabela = [

    Lista(
      
          foto: 'assets/contas_receber/esdras.jfif', 
          titulo: 'Cadastro', 
          cliente: 'Esdras Lemos', 
          vencimento: '03/10/2021', 
          valor: 10000.0, 
          aPagar: 10000.0, 
          pagoEm: 'Não pago.', 
          valorPago: 0, 
          
  ),

      Lista(
      
          foto: 'assets/contas_receber/marcos.jfif', 
          titulo: 'Cadastro', 
          cliente: 'Marcos Antônio', 
          vencimento: '03/10/2021', 
          valor: 1000.0, 
          aPagar: 500.0, 
          pagoEm: '05/10/2021', 
          valorPago: 500.0, 
          
  ),

      Lista(
      
          foto: 'assets/contas_receber/gabriel_s.jfif', 
          titulo: 'Cadastro', 
          cliente: 'Gabriel', 
          vencimento: '03/10/2021', 
          valor: 10000.0, 
          aPagar: 10000.0, 
          pagoEm: 'Não pago.', 
          valorPago: 0, 
          
  ),


  ];


}



