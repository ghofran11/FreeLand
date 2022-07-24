import 'package:bot_toast/bot_toast.dart';
import 'package:dio_refresh_bot/dio_refresh_bot.dart';
import 'package:flutter/material.dart';
import 'package:freeland/app/auth/presentation/login/login_screen.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:freeland/app/auth/presentation/state/app_manager_bloc/app_manager_bloc.dart';
import 'package:freeland/app/home/presentation/ui/screen/tips_screen.dart';
import 'package:freeland/app/job/presentation/ui/screen/comment_screen.dart';
import 'package:freeland/app/job/presentation/ui/screen/job_screen.dart';
import 'package:freeland/app/job/presentation/ui/screen/offer_screen.dart';
import 'package:freeland/app/projects/presentation/ui/screen/project_on.dart';
import 'package:freeland/app/root/root_screen.dart';
import 'package:freeland/app/root/splash_screen.dart';
import 'package:freeland/app/welcome/presentation/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class RouterConfig {
  late final GoRouter router;
  late final AppManagerBloc _appManager;

  RouterConfig({required AppManagerBloc provider}) {
    _appManager = provider;
    router = GoRouter(
      observers: [BotToastNavigatorObserver()],
      refreshListenable: GoRouterRefreshStream(_appManager.stream),
      initialLocation: SplashScreen.routePath,
      routes: [
        GoRoute(
          path: SplashScreen.routePath,
          pageBuilder: SplashScreen.pageBuilder,
        ),
        GoRoute(
          path: WelcomeScreen.routePath,
          pageBuilder: WelcomeScreen.pageBuilder,
        ),
        GoRoute(
            path: LoginScreen.routePath,
            name: LoginScreen.routeName,
            pageBuilder: LoginScreen.pageBuilder,
            routes: [
              GoRoute(
                path: SignUpScreen.routePath,
                name: SignUpScreen.routeName,
                pageBuilder: SignUpScreen.pageBuilder,
              ),
            ]),
        GoRoute(
            path: RootScreen.routePath,
            name: RootScreen.routeName,
            pageBuilder: (context, state) =>
                RootScreen.pageBuilder(context, state),
            routes: [
              GoRoute(
                  path: ProjectOn.routePath,
                  name: ProjectOn.routeName,
                  pageBuilder: (context, state) =>
                      ProjectOn.pageBuilder(context, state),
                  routes: []),
              GoRoute(
                  path: TipsScreen.routePath,
                  name: TipsScreen.routeName,
                  pageBuilder: (context, state) =>
                      TipsScreen.pageBuilder(context, state),
                  routes: []),
              GoRoute(
                  path: JobScreen.routePath,
                  name: JobScreen.routeName,
                  pageBuilder: (context, state) =>
                      JobScreen.pageBuilder(context, state),
                  routes: [
                    GoRoute(
                        path:commentScreen.routePath,
                        name: commentScreen.routeName,
                        pageBuilder: (context, state) =>
                            commentScreen.pageBuilder(context, state),
                        routes: [

                        ]),
                    GoRoute(
                        path:OfferScreen.routePath,
                        name: OfferScreen.routeName,
                        pageBuilder: (context, state) =>
                            OfferScreen.pageBuilder(context, state),
                        routes: [

                        ]),
                  ]),
            ])
      ],
      debugLogDiagnostics: true,
      errorPageBuilder: _buildErrorPage,
      redirect: (state) {
        debugPrint("start redirect");

        ///  [SplashScreen]
        final bool isInSplashScreen = state.location == SplashScreen.routePath;
        final bool isUndefinedState =
            _appManager.state.status == Status.initial;
        if (isUndefinedState && !isInSplashScreen) {
          return SplashScreen.routePath;
        }

        /// -------------------- [WelcomeScreen] --------------------
        final bool isInWelcomeScreen =
            state.location != WelcomeScreen.routePath;
        final bool isFirstOpen = _appManager.state.firstOpen;
        if (isFirstOpen && !isInWelcomeScreen) {
          return WelcomeScreen.routePath;
        }

        /// -------------------- [RootScreen] --------------------

        final bool isInRootScreen = state.location == RootScreen.routePath;
        final bool isAuthenticated =
            _appManager.state.status == Status.authenticated;
        if (isAuthenticated &&
            (!isInRootScreen &&
                !state.location.contains(RootScreen.routePath))) {
          return RootScreen.routePath;
        }

        /// -------------------- [LoginScreen] --------------------

        final bool isInSignScreen = state.location == LoginScreen.routePath ||
            state.location.contains(LoginScreen.routePath);
        // &&
        // state.location != LoginScreen.routePath &&
        // !state.location.contains(SignUpScreen.routePath);
        final bool isUnAuthenticated =
            _appManager.state.status == Status.unauthenticated;
        if (isUnAuthenticated && !isInSignScreen) {
          return LoginScreen.routePath;
        }
        return null;
      },
    );
  }

  Page<void> _buildErrorPage(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: Scaffold(
        body:
            SafeArea(child: Text(state.error?.toString() ?? 'page not found')),
      ),
    );
  }
}
