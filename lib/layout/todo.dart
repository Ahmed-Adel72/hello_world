import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/layout/cubit.dart';
import 'package:hello_world/layout/states.dart';
import 'package:hello_world/models/file/archive_tasks.dart';
import 'package:hello_world/models/file/done_tasks.dart';
import 'package:hello_world/models/file/new_tasks.dart';
import 'package:hello_world/modules/counter/cubit.dart';
import 'package:hello_world/shared/components/constants.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {










  var scaffoldKey=GlobalKey<ScaffoldState>();
  var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool isClickable=true;





  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(0)..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
          AppCubit cubit=AppCubit.get(context);
          return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
          title: Text(
            cubit.titles[cubit.currentIndex],
          ),
          ),
          body:
          cubit.screens[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
          onPressed: ()
          {
          if(cubit.isBottomSheet)
          {
          if(formKey.currentState!.validate())
          {
          cubit.insertToDatabase(
          title: titleController.text,
          data: dateController.text,
          time: timeController.text,
          ).then((value)
          {
          Navigator.pop(context);
          cubit.isBottomSheet=false;


          });

          }
          }
          else{
          scaffoldKey.currentState!.showBottomSheet((context) =>
          Container(
          color: Colors.grey[100],
          padding: EdgeInsets.all(20.0),
          child: Form(
          key: formKey,
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          TextFormField(
          controller:titleController ,
          keyboardType: TextInputType.text,
          validator: ( value){
          if(value!.isEmpty)
          {
          return('title must not be empty');
          }
          },

          decoration: InputDecoration(
          labelText: 'Task Title',
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
          ),

          ),
          SizedBox(
          height: 15.0,
          ),
          TextFormField(
          controller:timeController ,
          keyboardType: TextInputType.text,
          validator: ( value){
          if(value!.isEmpty)
          {
          return('time must not be empty');
          }
          },
          onTap: ()
          {
          showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          ).then((value) {
          timeController.text=value!.format(context).toString();
          print(value.format(context));
          });
          },

          decoration: InputDecoration(
          labelText: 'Task time',
          prefixIcon: Icon(Icons.watch_later_outlined),
          border: OutlineInputBorder(),
          ),

          ),
          SizedBox(
          height: 15.0,
          ),
          TextFormField(
          controller:dateController ,
          keyboardType: TextInputType.datetime,
          validator: ( value){
          if(value!.isEmpty)
          {
          return('Date must not be empty');
          }
          },
          onTap: ()
          {
          showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.parse('2021-05-03'),
          ).then((value) {
          dateController.text=DateFormat.yMMMd().format(value!);
          print(DateFormat.yMMMd().format(value));
          });
          },

          decoration: InputDecoration(
          labelText: 'Task Date',
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
          ),

          ),


          ],
          ),
          ),
          )
          ).closed.then((value)
          {
          cubit.changeBottomSheetState(isSheet: false, icon: Icons.edit);

          });
          cubit.changeBottomSheetState(isSheet: true, icon: Icons.add);

          }

          },
          child: Icon(
          cubit.fabIcon,
          ),
          ),
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
      currentIndex:AppCubit.get(context).currentIndex,
      onTap: (index)
      {
      AppCubit.get(context).changeIndex(index);

      },
      items:
      [
      BottomNavigationBarItem(
      icon:Icon(Icons.menu,),
      label: 'Tasks',
      ),
      BottomNavigationBarItem(
      icon:Icon(Icons.check_circle_outline,),
      label: 'Done',
      ),
      BottomNavigationBarItem(
      icon:Icon(Icons.archive_outlined,),
      label: 'Archive',
      ),

      ],
      ),
      );
        }


      )
    );

  }

}
