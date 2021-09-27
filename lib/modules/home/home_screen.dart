import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton(
            icon:Icon(
              Icons.notification_important,
            ),
            onPressed: ()
            {
              print('notification click');
            },
          ),

          Icon(
            Icons.search,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg'),
                    height: 200.0,
                    width: 200.0,
                    fit:BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(.7),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Flower',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),



    );
  }

}