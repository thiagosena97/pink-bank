import 'package:flutter/material.dart';
import 'package:projeto/components/editor.dart';
import 'package:projeto/database/app_database.dart';
import 'package:projeto/database/dao_transferencia/transferencia_dao.dart';
import 'package:projeto/models/transacao.dart';

const _tituloAppBar = 'Criando transferencia';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _dicaCampoNumeroConta = '0000-0';
const _rotuloCampoNumeroConta = 'Numero da Conta';
const _botaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return FormularioTransferenciaState();

  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  TransferenciaDAO dao = TransferenciaDAO();

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFFFC0CB),
      appBar: AppBar(
        //backgroundColor: Color(0xFFFF1493),
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoNumeroConta,
            ),
            Editor(
              dica: _dicaCampoNumeroConta,
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_botaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            )
          ],
        ),
      ),
    );
  }
//ALTERAR PRA DOUBLE
  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      Transacao transacaoCriada = Transacao(
        numeroConta: numeroConta,
        valor: valor,
      );
      dao.salvar(transacaoCriada).then((id){

        Navigator.pop(context);
      });
    }
  }
}