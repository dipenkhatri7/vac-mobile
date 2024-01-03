import 'package:go_router/go_router.dart';
import 'package:vac/features/profile/presentation/views/profile.dart';
import 'package:vac/features/stream/presentation/views/stream.dart';
import 'package:vac/views/pages/auth/login.dart';
import 'package:vac/views/pages/auth/signup.dart';
import 'package:vac/views/pages/home.dart';
import 'package:vac/views/pages/home/home_page.dart';
import 'package:vac/views/pages/settings/settings.dart';
import 'package:vac/views/pages/splash/splashScreen.dart';
import 'package:vac/views/pages/stats/stats.dart';

class CustomRouter {
  static final goRouter = GoRouter(initialLocation: '/streamPage', routes: [
    // GoRoute(
    //     path: '/',
    //     builder: (_, __) {
    //       return Home();
    //     }),
    GoRoute(
        path: '/',
        builder: (_, __) {
          return Home();
        }),
    GoRoute(
        path: '/splash',
        builder: (_, __) {
          return const SplashScreen();
        }),
    GoRoute(
        path: '/profile',
        builder: (_, __) {
          return Profile();
        }),
    GoRoute(
        path: '/streamPage',
        builder: (_, __) {
          return StreamPage();
        }),
    GoRoute(
        path: '/stats',
        builder: (_, __) {
          return Stats();
        }),
    GoRoute(
        path: '/settings',
        builder: (_, __) {
          return const Settings();
        }),
    GoRoute(
        path: '/home',
        builder: (_, __) {
          return Home();
        }),
    GoRoute(
        path: '/streamPage',
        builder: (_, __) {
          return StreamPage();
        }),
    GoRoute(
        path: '/login',
        builder: (_, __) {
          return LoginScreen();
        }),
    GoRoute(
        path: '/signUp',
        builder: (_, __) {
          return SignupScreen();
        }),
  ]);
}
