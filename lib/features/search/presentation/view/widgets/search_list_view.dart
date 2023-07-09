import 'package:apps_flutter/core/widgets/custom_error_widget.dart';
import 'package:apps_flutter/core/widgets/custom_loading_widget.dart';
import 'package:apps_flutter/features/home/presentation/view/widgets/newest_list_view_item.dart';
import 'package:apps_flutter/features/search/controller/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../controller/search_state.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
      if(state is SearchSuccessState)
        {
          return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.bookModel[index]);
                          print('Clicked');
                        },
                        child: BooksListViewItem(bookModel: state.bookModel[index],),
                    ),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 10.0,),
                itemCount: state.bookModel.length
            ),
          );
        }else if (state is SearchFailureState){
        print(state.errMessage);
        if(state.errMessage == "type 'Null' is not a subtype of type 'String'") {
          return const Center(child: Text('no results'),);
        }else{
          return CustomErrorWidget(errMessage: state.errMessage);
        }

      }else if (state is SearchLoadingState){
        return const CustomLoadingWidget();
      }else{
        return  Container();
      }
      },
    );
  }
}
