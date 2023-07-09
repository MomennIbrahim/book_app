import 'package:apps_flutter/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class CustomHorizontalListViewItem extends StatelessWidget {
  const CustomHorizontalListViewItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CustomBookImage(imageUrl: imageUrl);
  }
}
