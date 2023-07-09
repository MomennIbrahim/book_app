import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/model/BookModel.dart';
import 'book_action.dart';
import 'book_image_details.dart';
import 'book_rating_details.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookImageDetails(imageUrlDetails:bookModel.volumeInfo!.imageLinks!.thumbnail! ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          bookModel.volumeInfo!.title,
          textAlign: TextAlign.center,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          bookModel.volumeInfo!.authors![0],
          style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.white.withOpacity(0.7)),
        ),
        const SizedBox(
          height: 15.0,
        ),
        const BookRatingDetails(),
        const SizedBox(
          height: 38,
        ),
         BookAction(bookModel: bookModel),
      ],
    );
  }
}