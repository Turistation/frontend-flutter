// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget imageHeader(){
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/bukit.png'), fit: BoxFit.cover)
        ),
      );
    }

    Widget aboutTeks(){
      return Container(
        height: 380,
        width: double.infinity,
        margin: EdgeInsets.only(top: 270, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buckit Lembang',
              style: black2TextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '''
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id mi justo. Pellentesque luctus nisl in nulla porttitor dictum eget ut sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam vestibulum leo ut sodales convallis. Nunc a viverra turpis, non pretium turpis. Cras vehicula, dolor at consectetur efficitur, turpis purus lobortis mi, rutrum lobortis diam libero cursus quam. Vivamus suscipit urna magna, ut mattis magna vulputate sit amet. Mauris rutrum metus leo, nec dapibus nisi feugiat mattis. Fusce et vestibulum urna, ac ultricies leo. Nullam sodales nibh sit amet tincidunt sagittis. Nam finibus placerat scelerisque.
              ''',
              style: black2TextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal
              ),
            )
          ],
        ),
      );
    }

    Widget userReviews(){
      return Container(
        height: 250,
        width: double.infinity,
        margin: EdgeInsets.only(top: 670, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reviews',
              style: black2TextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 17,
                  width: 17,
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage('assets/star.png'),
                    )
                  ),
                ),
                Text(
                  '4,6',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Text(
              '''
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. In orci auctor augue interdum netus proin convallis mattis velit. Condimentum nisl vitae feugiat volutpat in. Lacus risus malesuada eget tincidunt sagittis ut. Massa lorem id interdum aliquam faucibus mi.
              ''',
              style: black2TextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Review By ',
                style: black2TextStyle,
                children: [
                  TextSpan(
                    text: 'Arfan Jadulhaq', style: black2TextStyle.copyWith(
                      fontWeight: FontWeight.w700
                    )
                  ),
                  TextSpan(
                    text: ', 4/17/2022', style: black2TextStyle
                  ),
                ]
              ),
              
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            imageHeader(),
            aboutTeks(),
            userReviews()
          ],
        ),
      ),
    );
  }
}