import 'package:apps_flutter/features/home/data/model/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/functions/custom_lanch_url.dart';
import '../../../../../core/widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
                text: 'Free',
                onPressed: () {},
                backGroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
              )),
          Expanded(
              child: CustomButton(
                text: bookModel.volumeInfo?.previewLink != null ?'Free Preview' : 'Not available',
                onPressed: (){
                 customLaunchUrl(url: bookModel.volumeInfo!.previewLink!,context: context);
                },
                backGroundColor: Colors.pinkAccent,
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              )),
        ],
      ),
    );
  }
}
