import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransanctionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransanctionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'Nenhum gasto cadastrado!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    height: 250,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            // builder é melhor para quando não se sabe quantos elementos existem
            : ListView.builder(
                itemCount: transactions.length,
                // função que vai renderizando os elementos conforme for necessário
                itemBuilder: (context, index) {
                  final tr = transactions[index];
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'R\$ ${tr.value.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(tr.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text(DateFormat('d MMM y').format(tr.date),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
