import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text("No Transactions added yet!"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView(
                children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          )),
                          child: Text(
                            '\$${tx.amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tx.title,
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text(
                                DateFormat.yMMMd().format(tx.date),
                                style: TextStyle(color: Colors.red),
                              )
                            ])
                      ],
                    ),
                  );
                }).toList(),
              ));
  }
}
