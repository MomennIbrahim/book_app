import 'package:apps_flutter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRatingDetails extends StatelessWidget {
  const BookRatingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.solidStar,color: Colors.yellowAccent,size: 15.0,),
        SizedBox(width: 6.0,),
        Text('4.4',style: Styles.textStyle14,),
        SizedBox(width: 7.0,),
        Text('(345)',style: Styles.textStyle14,),
      ],
    );
  }
}