class Transacao {
  int id;
  int numeroConta;
  double valor;

  Transacao({this.id, this.numeroConta, this.valor});

  @override
  String toString() {
    return 'Transacao{ _tipoTransacao: $numeroConta, _valor: $valor}';
  }
  int getnumeroConta() {
    return this.numeroConta;
  }

  double getValor(){
    return this.valor;
  }
   int getId(){
    return this.id;
   }


}
