
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter =  DateFormat.yMd();


 const uuid = Uuid();

  enum Category { food , travel , leisure , work }

  const categoryIcons = {
     Category.food:Icon(Icons.lunch_dining),
     Category.travel:Icon(Icons.flight_takeoff),
     Category.leisure:Icon(Icons.movie),
     Category.work:Icon(Icons.work)
  };

class Expence {

   Expence({
    required this.title ,
    required this.amount,
    required this.date,
    required this.category
    }): id = uuid.v4();



  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  
 String get getFormattedDate {
   return formatter.format(date);
 }
 
}

// to build unique ID we have to use uuid