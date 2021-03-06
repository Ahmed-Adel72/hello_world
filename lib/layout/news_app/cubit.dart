import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/modules/news_app/business_screen.dart';
import 'package:hello_world/modules/news_app/science_screen.dart';
import 'package:hello_world/modules/news_app/settings_screen.dart';
import 'package:hello_world/modules/news_app/sports_screen.dart';
import 'package:hello_world/shared/network/remote/dio_helper.dart';

import 'states.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit(initialState) : super(NewsInitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);

  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
        icon:Icon(
          Icons.business,
        ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.science,
      ),
      label: 'Science',
    ),

  ];

  List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    if(currentIndex==1)
      getSports();
    if(currentIndex==2)
      getScience();

    emit(NewsBottomNavState());
  }

List<dynamic> business=[];
List<dynamic> sports=[];
List<dynamic> science=[];
List<dynamic> search=[];
  void getBusiness()
  {
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca ',

        },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports()
  {
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca ',
        },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetBusinessSuccessState());

    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSportsErrorState(error));
    }
    );
  }

  void getScience()
  {
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca ',
        }
    ).then((value)
    {
      print(value.data['articles'][0]['title']);
      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetScienceErrorState(error));
    });
  }

  void getSearch(String value)
  {
    search=[];
    DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q':'$value',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca ',
        }
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSearchErrorState(error));
    });
  }

}