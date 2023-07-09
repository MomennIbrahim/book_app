import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/core/widgets/custom_error_widget.dart';
import 'package:apps_flutter/core/widgets/custom_loading_widget.dart';
import 'package:apps_flutter/features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:apps_flutter/features/home/presentation/view/widgets/custom_horizontal_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../controller/featured_books_cubit/featured_books_state.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.only(left: horizontalPadding30),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                    },
                    child: CustomHorizontalListViewItem(
                        imageUrl: state
                            .books[index].volumeInfo!.imageLinks!.thumbnail!)),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15.0,
                ),
                itemCount: state.books.length,
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
