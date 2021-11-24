import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final transactions;
  final deletedTransaction;
  TransactionList({this.transactions, this.deletedTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No transactions added yet',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, i) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[i].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    title: Text(transactions[i].title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(
                      DateFormat().add_yMMMd().format(transactions[i].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          print(transactions[i].id);
                          return deletedTransaction(transactions[i].id);
                        }),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                           vertical: 10,
//                           horizontal: 15,
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                           color: Colors.purple,
//                           width: 2,
//                         )),
//                         child: Text(
//                           '\$${transactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.purple),
//                         ),
//                         padding: EdgeInsets.all(10),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(transactions[index].title,
//                               style: Theme.of(context).textTheme.headline6
//                               // TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                               ),
//                           Text(
//                             DateFormat()
//                                 .add_yMMMd()
//                                 .format(transactions[index].date),
//                             style: TextStyle(color: Colors.grey),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 );




// Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           color: Theme.of(context).primaryColor,
//                           shape: BoxShape.circle),