
import 'package:flutter/cupertino.dart';
import 'package:projeto/database/app_database.dart';
import 'package:projeto/models/transacao.dart';
import 'package:sqflite/sqflite.dart';

class TransferenciaDAO {

  static const tableName = "transferencia";

  static const createTable =
      "CREATE TABLE transferencia("
      "id INTEGER PRIMARY KEY, "
      "numeroConta INTEGER,"
      "valor  DOUBLE)";

  Future<int> salvar(Transacao transacao) async {

    Database db = await createDatabase(createTable);

    final Map<String, dynamic> transacaoMap = Map();

    transacaoMap['numeroConta'] = transacao.getnumeroConta();

    transacaoMap['valor'] = transacao.getValor();

    return db.insert('transferencia', transacaoMap);

  }


  Future<List<Transacao>> findAll() async {

    Database db = await createDatabase(createTable);

    List<Map<String, dynamic>> maps = await db.query(tableName);

    List<Transacao> transacoes = List();

    for (Map<String, dynamic> map in maps) {

      transacoes.add(Transacao(
        id: map['id'],
        numeroConta: map['numeroConta'],
        valor: map['valor'],
      ));

    }
    return transacoes;
  }
}