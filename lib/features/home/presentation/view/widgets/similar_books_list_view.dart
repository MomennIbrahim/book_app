import 'package:apps_flutter/core/widgets/custom_loading_widget.dart';
import 'package:apps_flutter/features/home/presentation/controller/similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'custom_horizontal_listview_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSimilarBooksCubit, FetchSimilarBooksState>(
      builder: (context, state) {
        if (state is FetchSimilarSuccess) {
          return BuildCondition(
            condition: state.bookModel != null,
            builder: (context)=> SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.bookModel![index]);
                  },
                  child: CustomHorizontalListViewItem(
                    imageUrl:
                    state.bookModel![index].volumeInfo!.imageLinks!.thumbnail!,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 12.5,
                ),
                itemCount: state.bookModel!.length,
              ),
            ),
            fallback: (context)=> const Center(child: Text('No data right now')),
          );
        } else if (state is FetchSimilarFailure) {
          return CustomErrorWidget(errMessage: state.failure);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
