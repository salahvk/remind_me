// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:remind_me/config/route/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authCheck(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SplashLogoWidget(),
            const SizedBox(height: 20),
            const SplashTitleWidget(),
            const SizedBox(height: 10),
            const SplashSubtitleWidget()
                .animate()
                .fadeIn(duration: 1.seconds)
                .slideY(begin: 0.5, end: 0),
          ],
        ),
      ),
    );
  }

  void authCheck(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      // bool isLoggedIn =
      //     await Remind().isUserLoggedIn(getUserEmail() ?? '');
      // isLoggedIn
      //     ? context.pushReplacement(
      //         Routes.getHomeRoute(),
      //       )
      // :
      context.pushReplacement(Routes.getHomeRoute(), extra: true);
    });
  }
}

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: const Icon(
        Icons.add_task,
        size: 150,
      ).animate().scale(duration: 600.ms).fadeIn(duration: 600.ms),
    );
  }
}

class SplashTitleWidget extends StatelessWidget {
  const SplashTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Remind Me',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class SplashSubtitleWidget extends StatelessWidget {
  const SplashSubtitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Stay Organized, Never Miss a Task!',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white70,
      ),
    );
  }
}
