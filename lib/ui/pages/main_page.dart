// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touristation/cubit/page_cubit.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/ui/pages/explore_page.dart';
import 'package:touristation/ui/pages/home_page.dart';
import 'package:touristation/ui/pages/teams_page.dart';
import 'package:touristation/ui/widgets/custom_bottom_navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buildContent(int currentIndex){
      switch(currentIndex){
        case 0:
          return HomePage();
        case 1:
          return ExplorePage();
        case 2 :
          return TeamsPage();
        default :
          return HomePage();
      }
    }

    Widget customBottomNavbar(){
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: keyWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavbar(imgUrl: 'assets/Home.png', index: 0,),
              CustomBottomNavbar(imgUrl: 'assets/explore.png', index: 1,),
              CustomBottomNavbar(imgUrl: 'assets/teams.png', index: 2,),
            ],
          ),
        )
      );
    } 

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: keyBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavbar()
            ],
          )
        );
      },
    );
  }
}