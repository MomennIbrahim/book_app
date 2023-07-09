import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/features/search/presentation/view/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50.0,
        ),
        CustomTextFormField(),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding30),
          child: Text('Search Result'),
        ),
        SearchListView(),
      ],
    );
  }
}
