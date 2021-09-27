import 'package:flutter/material.dart';
class UsersModel {
  final int id;
  final String name;
  final String phone;

  UsersModel({
    required this.name,
    required this.id,
    required this.phone,

});
}

class UsersScreen extends StatelessWidget {
  List<UsersModel> users=[
    UsersModel(
      id: 1,
      name: 'Ahmed Adel',
      phone: '01122891119',
    ),
    UsersModel(
      id: 2,
      name: 'Ahmed fathi',
      phone: '01273145254',
    ),
    UsersModel(
      id: 3,
      name: 'mo Adel',
      phone: '01137687326',
    ),
    UsersModel(
      id: 1,
      name: 'Ahmed Adel',
      phone: '01122891119',
    ),
    UsersModel(
      id: 2,
      name: 'Ahmed fathi',
      phone: '01273145254',
    ),
    UsersModel(
      id: 3,
      name: 'mo Adel',
      phone: '01137687326',
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context , index) => buildUsersItem(users[index]),
        separatorBuilder: (context , index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],

          ),
        ),
        itemCount: users.length,
      ),
    );
  }

 Widget buildUsersItem(UsersModel user) =>  Padding(
   padding: const EdgeInsets.all(20.0),
   child: Row(
     children:
     [
       CircleAvatar(
         radius: 25.0,
         child: Text(
           '${user.id}',
           style: TextStyle(
             fontSize: 25.0,
             fontWeight: FontWeight.bold,
           ),
         ),
       ),
       SizedBox(
         width: 20.0,
       ),
       Column(
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children:
         [
           Text(
             '${user.name}',
             style: TextStyle(
               fontSize: 25.0,
               fontWeight: FontWeight.bold,
             ),
           ),
           Text(
             '${user.phone}',
             style: TextStyle(
               color: Colors.grey,
             ),
           ),
         ],
       ),
     ],
   ),
 );
}
