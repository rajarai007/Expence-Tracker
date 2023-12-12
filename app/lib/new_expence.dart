import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/model/expence.dart';

class NewExpense extends StatefulWidget{
 const NewExpense ({super.key, this.onAddExpense});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}



final void Function (Expence expence) onAddExpense;


final formatter = DateFormat.yMd();

enum ItemList {food ,travel , leasure , work}

class _NewExpenseState extends State <NewExpense>{




// this is one approach
// var _enteredTitle = '';

// void _saveTitleInput (String inputValue){
//   _enteredTitle=inputValue;
// }

final _titleController = TextEditingController();

final _amoutController = TextEditingController();

 DateTime? _selectedDate; 



void _presnetDatePicker()async{
  final now = DateTime.now();
  final firstDate = DateTime(now.year-1,now.month,now.day);
 final pickedDate = await showDatePicker(
    context: context,
    initialDate: now, 
    firstDate: firstDate, 
    lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
}



void _submitExpenseData (){
  final enteredAmout = double.tryParse(_amoutController.text);
  final amoutIsInvalid = enteredAmout == null || enteredAmout <=0;
   if(_titleController.text.trim().isEmpty || amoutIsInvalid || _selectedDate == null){
      showDialog(context: context, builder: (ctx)=> AlertDialog(
        title: const Text('Invalid input'),
        content: const Text("Please make sure a valid title amout category was entered"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(ctx);
          }, child: const Text("Okay") )
        ],
      ) );
      return;
   }
}

ItemList _selectedCategory = ItemList.leasure;





@override
  void dispose() {
    _titleController.dispose();
    _amoutController.dispose();
   super.dispose();
  }





@override
  Widget build(BuildContext context) {
    
    return  Padding(padding: EdgeInsets.all(16),
    child:  Column(
      children:  [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(
            label:  Text("Title")
          ),
        ),

        Row(
          children: [
            
        Expanded(
          child: TextField(
            controller: _amoutController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              label: Text("Amount")
            ),
          ),
        ),

          const SizedBox(width: 16,),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_selectedDate == null ? "No date selected" : formatter.format(_selectedDate!) ),
                IconButton(onPressed: _presnetDatePicker,
                icon: const Icon(Icons.calendar_month),)
              ],
            ),
          ),
          ],
        ),
      const SizedBox(height: 60),
      // this is the dropdown logic
        Row(
          children: [
           DropdownButton(
            value: _selectedCategory,
           items: ItemList.values.map((Category) => 
           DropdownMenuItem(
            value:Category ,
            child: Text(Category.name.toUpperCase()),),).toList(),
            onChanged: (value){
                if(value==null){
                  return;
                }
              setState(() {
                _selectedCategory = value;
              });
            }),
        
        const  Spacer(),


            TextButton(onPressed: (){
              Navigator.pop(context);
            },
             child: const Text("Cancel")),

            ElevatedButton(onPressed: _submitExpenseData
             , child: const Text("Save Expense")),
          ],
        )




      ], 
    ),
    );
    
  }
}