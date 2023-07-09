import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(FontAwesomeIcons.solidStar,color: Colors.yellowAccent,size: 15.0,),
        SizedBox(width: 3.5,),
        Text('0',style: Styles.textStyle14,),
        SizedBox(width: 3.0,),
        Text('(0)',style: Styles.textStyle14,),
      ],
    );
  }
}