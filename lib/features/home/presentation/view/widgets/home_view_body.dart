import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'featured_newest_list_view.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              Padding(
                padding: EdgeInsets.only(top: 35.0, left: horizontalPadding30, right: horizontalPadding30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: FeaturedNewestListView(),
        )
      ],
    );
  }
}
