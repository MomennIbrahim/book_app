import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/core/utils/app_router.dart';
import 'package:apps_flutter/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    navigateToOtherPage();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        /// stretch y3ny kol 7aga gwa al column  bta5od al width bta3 al screen
        children: [
          const Text(
            'Bo0Kly',
            textAlign: TextAlign.center,
            style: TextStyle(
                letterSpacing: 5.0,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 4.0,
          ),
          slidingText(),
        ],
      ),
    );
  }

  slidingText() {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) => SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'Read free books',
            textAlign: TextAlign.center,
          )),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 15), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToOtherPage() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
