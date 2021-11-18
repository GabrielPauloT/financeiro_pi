// ignore_for_file: file_names, non_constant_identifier_names

class Lista {
  String id;
  String statu;
  String titulo;
  String cliente;
  String vencimento;
  String valor;
  String apagar;
  String pagoem;
  String valorpago;

  Lista({
    required this.id,
    required this.statu,
    required this.titulo,
    required this.cliente,
    required this.vencimento,
    required this.valor,
    required this.apagar,
    required this.pagoem,
    required this.valorpago,
  });

  factory Lista.fromJson(Map<String, dynamic> json) {
    return Lista(
      id: json['id'] as String,
      statu: json['statu'] as String,
      titulo: json['titulo'] as String,
      cliente: json['cliente'] as String,
      vencimento: json['vencimento'] as String,
      valor: json['valor'] as String,
      apagar: json['apagar'] as String,
      pagoem: json['pagoem'] as String,
      valorpago: json['valorpago'] as String,
    );
  }
}
