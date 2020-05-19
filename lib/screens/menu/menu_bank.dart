import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/screens/transferencia/lista.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/pinkbank-logo.png'),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  width: 150,
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ListaTransferencia();
                      }));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.group_add,
                          color: Colors.black,
                          size: 24.0,
                        ),
                        Text(
                          'Transações',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
