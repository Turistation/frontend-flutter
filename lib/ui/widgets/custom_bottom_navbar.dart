// ignore_for_file: prefer_const_constructors
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:touristation/cubit/page_cubit.dart';
import 'package:touristation/shared/theme.dart';

class CustomBottomNavbar extends StatelessWidget {

  final String imgUrl;
  final int index;

  const CustomBottomNavbar({ 
  Key? key,
  required this.index,
  required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<PageCubit>().setPage(index);
      },
      child: Container(
        margin: EdgeInsets.only(top:15),
        child: Column(children: [
          Image.asset(
            imgUrl,
            height: 24,
            width: 24,
            color: context.read<PageCubit>().state == index ? keyBlueColor : keyBlackColor,
          )
        ],),
      ),
    );
  }
}