

import 'package:app/model/expence.dart';
import 'package:flutter/material.dart';

class ExpenceItem extends StatelessWidget{
  const ExpenceItem(this.expence,{super.key});

  final Expence expence;

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding:EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child:  Column(
          children: [
           Text(expence.title),
           const SizedBox(height: 4,),
           Row(
            children: [
                Text('\$${expence.amount.toStringAsFixed(2)}'),
               const Spacer(),
                Row(children: [
                 const  Icon(Icons.alarm),
                 const  SizedBox(width: 8,),
                   Text(expence.getFormattedDate)
                ],),      
            ],
           )
          ]),
      ),
    );
  }
}