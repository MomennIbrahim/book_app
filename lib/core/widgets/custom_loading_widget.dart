import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {

    var spinkit = const Center(
      child: SpinKitChasingDots(
        color: Colors.grey,
        size: 50.0,
      ),
    );
    return spinkit;
  }


}
