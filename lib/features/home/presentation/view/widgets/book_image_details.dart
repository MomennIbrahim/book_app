import 'package:flutter/material.dart';

class BookImageDetails extends StatelessWidget {
  const BookImageDetails({super.key, required this.imageUrlDetails});

  final String imageUrlDetails;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      imageUrlDetails))),
        ),
      ),
    );
  }
}