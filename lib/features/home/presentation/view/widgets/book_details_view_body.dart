import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/features/home/data/model/BookModel.dart';
import 'package:apps_flutter/features/home/presentation/view/widgets/custom_details_appbar.dart';
import 'package:apps_flutter/features/home/presentation/view/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding30),
            child: Column(
              children: [
                const SizedBox(
                  height: 60.0,
                ),
                const CustomDetailsAppbar(),
                const SizedBox(height: 20.0,),
                BookDetailsSection(bookModel: bookModel),
                const Expanded(
                  child: SizedBox(
                    height: 50.0,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(height: 40.0,),
              ],
            ),
          ),
        )
      ],
    );
  }
}





