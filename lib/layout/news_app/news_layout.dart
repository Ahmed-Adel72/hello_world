import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/layout/news_app/cubit.dart';
import 'package:hello_world/modules/news_app/search_screen.dart';
import 'package:hello_world/shared/components/components.dart';

import '../cubit.dart';
import 'states.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit=NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: ()
                {
                  AppCubit.get(context).changeNewsMode();
                },
                icon: Icon(Icons.brightness_4_outlined,),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              items:  cubit.bottomItems ,
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {

              cubit.changeBottomNavBar(index);
            },

          ),
        );
      },
    );
  }
}
