// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget header(){
      return Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              icon: Icon(Icons.arrow_back)
            ),
            Center(
              child: Text(
                'Our Teams',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: keyBackgroundColor,
      body: SingleChildScrollView(
        child:Stack(
          children: [
            header(),
          ],
        )
      ),
    );
  }
}