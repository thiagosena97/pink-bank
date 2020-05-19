import 'package:flutter/material.dart';
import 'package:projeto/database/dao_transferencia/transferencia_dao.dart';
import 'package:projeto/models/transacao.dart';
import 'package:projeto/screens/transferencia/formulario.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transacao> _transacao = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {

  TransferenciaDAO dao = TransferenciaDAO();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
      ),
      body:
      FutureBuilder<List<Transacao>> (
        initialData: List(),
        future: Future.delayed(Duration(seconds: 4)).then((value) => dao.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando"),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              List <Transacao> transacoes = snapshot.data;
              return ListView.builder(

                itemCount: transacoes.length == null ? 0 : transacoes.length,

                itemBuilder: (context, indice) {

                  Transacao transacao = transacoes[indice];

                    return ItemTransacao(transacao);

                },
              );
              break;
          }
          return null;
        },
      ),


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          },
      ),
    );
  }
}

class ItemTransacao extends StatelessWidget {

  final Transacao _transferencia;

  ItemTransacao(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: new ListTile(
        leading: Icon(Icons.monetization_on),
          title: Text('Valor: R\$ '+this._transferencia.valor.toString()),
        subtitle: Text('Numero Conta: '+this._transferencia.numeroConta.toString()),
      ),
    );
  }
}