import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/core/utils/styles.dart';
import 'package:apps_flutter/features/search/controller/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomTextFormField extends StatelessWidget {
    const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding30),
      child: SizedBox(
        height: 55.0,
        child: TextFormField(
          controller: searchController,
          onChanged: (value){
            BlocProvider.of<SearchCubit>(context).fetchSearchData(text: searchController.text);
          },
          onFieldSubmitted: (value){
            BlocProvider.of<SearchCubit>(context).fetchSearchData(text: searchController.text);
          },
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: (){
                GoRouter.of(context).pop();
              },
              icon: const Icon(FontAwesomeIcons.arrowRotateLeft,size: 20.0,),
            ),
            filled: true,
            fillColor: Colors.white12,
            focusedBorder: outLineInputBorder(),
            hintText: 'Search',
            hintStyle: Styles.textStyle16 ,
            enabledBorder: outLineInputBorder(),
          ),
        ),
      ),
    );
  }

  outLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(22.5),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}

