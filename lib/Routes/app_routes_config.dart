
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:social_champ_task/Routes/app_routes_constants.dart';
import 'package:social_champ_task/View/DetailsScreen.dart';
import 'package:social_champ_task/View/HomeScreen.dart';




class AppRoutes{
  GoRouter router = GoRouter(
    initialLocation: "/home",
      routes:[
        GoRoute(
          name: homeRoute,
          path: '/home',
          pageBuilder: (context, state) {
            return customTransitionPage(context, state ,HomeScreen());
          },
        ),
        GoRoute(
          name: detailsRoute,
          path: '/details',
          pageBuilder: (context, state) {
            final data = state.extra as Map<String, dynamic>?;
            return customTransitionPage(context, state ,DetailsScreen(data: data,));
          },
        ),
      ]);


}
Page<dynamic> customTransitionPage(BuildContext context,GoRouterState state,Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity:
        CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}