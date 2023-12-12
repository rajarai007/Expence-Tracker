import 'package:app/model/expence.dart';
import 'package:app/widget/expence_items.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget{
 const ExpenceList({Key?key, required this.expence}):super(key: key);
  
  final List<Expence>expence;
  @override
  Widget build(BuildContext context){

    return ListView.builder(
      itemCount: expence.length,
      itemBuilder: (context , index) => ExpenceItem(expence[index]),);
  }
  }
