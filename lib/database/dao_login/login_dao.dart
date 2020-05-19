import 'package:flutter/cupertino.dart';

class LoginModel {
  int id;
  String usuario;
  String senha;

  LoginModel({this.id, this.usuario, this.senha});

  @override
  String toString() {
    return 'Transacao{ _tipoTransacao: $usuario, _valor: $senha}';
  }

  String getUsuario() {
    return this.usuario;
  }

  String getSenha() {
    return this.senha;
  }

  int getId() {
    return this.id;
  }
}