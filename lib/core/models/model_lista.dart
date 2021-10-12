class Lista {
  int status;
  String titulo;
  String cliente;
  String vencimento;
  double valor;
  double aPagar;
  String pagoEm;
  double valorPago;

  Lista({
    required this.status,
    required this.titulo,
    required this.cliente,
    required this.vencimento,
    required this.valor,
    required this.aPagar,
    required this.pagoEm,
    required this.valorPago,
  });
}

class Login {
  String email;
  String senha;

  Login({required this.email, required this.senha});
}
