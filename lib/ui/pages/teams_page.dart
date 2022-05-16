// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/ui/widgets/members_card.dart';

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

    Widget teamMembers(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 115, bottom: 50),
        child: Column(
          children: [
            MembersCard(
              name: 'Muhammad\nAlfi Karom', 
              position: 'Ui Ux Designers', 
              image: 'assets/karom.png'
            ),
            MembersCard(
              name: 'I Gde Bagus\nJanardana', 
              position: 'Backend\nDeveloper', 
              image: 'assets/agus.png'
            ),
            MembersCard(
              name: 'Muhammad\nArfan\nJadulhaq', 
              position: 'Frontend web\nDeveloper', 
              image: 'assets/arfan.png'
            ),
            MembersCard(
              name: 'Sanding\nAdhieguna', 
              position: 'Mobile App\nDeveloper', 
              image: 'assets/sanding.png'
            ),
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
            teamMembers()
          ],
        )
      ),
    );
  }
}