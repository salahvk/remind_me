import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remind_me/config/route/route_constants.dart';
import 'package:remind_me/config/route/transition.dart';
import 'package:remind_me/features/splash/presentation/splash_screen.dart';
import 'package:remind_me/features/task/presentation/pages/add_task/add_task_screen.dart';
import 'package:remind_me/features/task/presentation/pages/home/home_screen.dart';
import 'package:remind_me/features/task/presentation/pages/task_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.getSplashRoute(),
  navigatorKey: navigatorKey,
  routes: [
    // GoRoute(
    //   name: Routes.auth,
    //   path: Routes.getAuthRoute(),
    //   pageBuilder: (context, state) => buildPageWithFadeTransition(
    //       AuthScreen(
    //         isLogin: state.extra as bool,
    //       ),
    //       state),
    // ),
    GoRoute(
      name: Routes.splash,
      path: Routes.getSplashRoute(),
      pageBuilder: (context, state) =>
          buildPageWithFadeTransition(const SplashScreen(), state),
    ),
    GoRoute(
      name: Routes.home,
      path: Routes.getHomeRoute(),
      pageBuilder: (context, state) =>
          buildPageWithFadeTransition( const HomeScreen(), state),
    ),
    GoRoute(
      name: Routes.task,
      path: Routes.getTaskRoute(),
      pageBuilder: (context, state) =>
          buildPageWithFadeTransition( TaskScreen(args: state.extra as Map,), state),
    ),
    GoRoute(
      name: Routes.addTask,
      path: Routes.getAddTaskRoute(),
      pageBuilder: (context, state) => buildPageWithFadeTransition(
          const AddTaskScreen(
            // args: state.extra as Map,
          ),
          state),
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text("Page not fount"),
    ),
  ),
  redirect: (context, state) {
    return null;
  },
);
