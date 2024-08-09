import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransanctionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransanctionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'Nenhum gasto cadastrado!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    height: 350,
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
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 35,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                            child: Text('R\$${tr.value}'),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    ),
                  );
                },
              ));
  }
}
