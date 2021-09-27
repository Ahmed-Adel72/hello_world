import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/modules/counter/cubit.dart';
import 'package:hello_world/modules/counter/states.dart';

class CounterScreen extends StatelessWidget{
  // 1. constructor
  // 2. init state
  // 3. build

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(0),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'MINUS',
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      'PLUS',
                    ),

                  ),


                ],
              ),
            ),
          );
        },
      )
    );
      }

  }

