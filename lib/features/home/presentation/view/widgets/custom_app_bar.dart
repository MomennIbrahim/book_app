import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding30, vertical: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Bo0Kly',
            textAlign: TextAlign.center,
            style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                ),
          ),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass,size: 24.0,)),
        ],
      ),
    );
  }
}