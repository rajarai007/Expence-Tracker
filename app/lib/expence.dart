

import 'package:app/new_expence.dart';
import 'package:app/widget/expence_list.dart';
import 'package:app/model/expence.dart';
import 'package:flutter/material.dart';


class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {

 
 final List<Expence> _registeredExpences = [
  Expence(title: 'Flutter Course', amount: 99, date: DateTime.now(), category: Category.work),
  Expence(title: "Cinema", amount: 15.69 , date: DateTime.now(), category: Category.leisure),
 ];
 

void _openAddExpenseOverlay(){
  showModalBottomSheet(context: context, builder: (ctx)=> const NewExpense() );
 }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay
          , icon: const Icon(Icons.add))
        ],
      ),
      body:   Column(
        children:  [
         const Text("The chart"),
          Expanded(child: ExpenceList(expence:  _registeredExpences))
       ],
      ),  
    );
  }
}

