
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/modules/counter/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit(initialState) : super(CounterInitialState());
  static CounterCubit get(context)=> BlocProvider.of(context);
  int counter=1;

  void minus()
  {
    counter--;
    emit(CounterMinusState());

  }
  void plus()
  {
    counter++;
    emit(CounterPlusState());

  }
}

