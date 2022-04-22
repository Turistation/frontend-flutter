// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/ui/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/splashimage.png'), fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 480),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Touristation',
                    style: whiteTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Forget obout work,\ncome vacation.',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40,),
                  CustomButton(
                    text: 'Lanjutkan',
                    onPressed: (){
                      Navigator.pushNamed(context, '/main-page');
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}