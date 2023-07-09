import 'package:apps_flutter/core/widgets/custom_error_widget.dart';
import 'package:apps_flutter/core/widgets/custom_loading_widget.dart';
import 'package:apps_flutter/features/home/presentation/controller/newest_books_cubit/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../controller/newest_books_cubit/newest_books_cubit.dart';
import 'newest_list_view_item.dart';

class FeaturedNewestListView extends StatelessWidget {
  const FeaturedNewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,
                      extra: state.books[index]);
                },
                child: BooksListViewItem(
                  bookModel: state.books[index],
                )),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
            itemCount: state.books.length,
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
