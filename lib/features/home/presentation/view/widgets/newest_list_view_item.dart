import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/core/utils/styles.dart';
import 'package:apps_flutter/features/home/data/model/BookModel.dart';
import 'package:apps_flutter/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'book_rating.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.bookModel,});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: horizontalPadding30,right: horizontalPadding30),
      child: SizedBox(
        height: 140,
        child: Row(
          children: [
            CustomBookImage(imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? ''),
            const SizedBox(width: 30.0,),
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bookModel.volumeInfo!.title,maxLines: 2,style: Styles.textStyle20.copyWith(fontFamily: kGtSectra),overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 3.0,),
                  Text(bookModel.volumeInfo!.description,style: Styles.textStyle14.copyWith(color: Colors.grey),maxLines: 2,overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 5.0,),
                   Row(
                    children: [
                      Text('Free',style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      const BookRating(),
                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


