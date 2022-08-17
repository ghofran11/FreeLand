import 'package:bot_toast/bot_toast.dart';
import 'package:dio_refresh_bot/dio_refresh_bot.dart';
import 'package:flutter/material.dart';
import 'package:freeland/app/auth/presentation/login/login_screen.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:freeland/app/auth/presentation/state/app_manager_bloc/app_manager_bloc.dart';
import 'package:freeland/app/contract/contract_screen.dart';
import 'package:freeland/app/home/presentation/ui/screen/searsh_users_screen.dart';
import 'package:freeland/app/home/presentation/ui/screen/tips_screen.dart';
import 'package:freeland/app/profile/personal_profile_page.dart';
import 'package:freeland/app/profile/presentation/screens/all_projects_screen.dart';
import 'package:freeland/app/profile/presentation/screens/all_work_screen.dart';
import 'package:freeland/app/profile/presentation/screens/personal_info_update_screen.dart';
import 'package:freeland/app/profile/presentation/screens/protofolio_update_screen.dart';
import 'package:freeland/app/profile/presentation/screens/update_career_screen.dart';
import 'package:freeland/app/profile/presentation/widgets/update_add_work.dart';
import 'package:freeland/app/projects/presentation/ui/screen/add_project.dart';
import 'package:freeland/app/projects/presentation/ui/screen/all_own_project.dart';
import 'package:freeland/app/projects/presentation/ui/screen/comment_screen.dart';
import 'package:freeland/app/projects/presentation/ui/screen/offer_screen.dart';
import 'package:freeland/app/projects/presentation/ui/screen/pending_project.dart';
import 'package:freeland/app/projects/presentation/ui/screen/project_detail.dart';
import 'package:freeland/app/projects/presentation/ui/screen/project_own.dart';
import 'package:freeland/app/root/common_questions_screen.dart';
import 'package:freeland/app/root/contact_us_screen.dart';
import 'package:freeland/app/root/root_screen.dart';
import 'package:freeland/app/root/splash_screen.dart';
import 'package:freeland/app/welcome/presentation/welcome_screen.dart';
import 'package:go_router/go_router.dart';

import '../app/projects/presentation/ui/screen/working_on.dart';

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
                path: CommonQuestionsScreen.routePath,
                name: CommonQuestionsScreen.routeName,
                pageBuilder: (context, state) =>
                    CommonQuestionsScreen.pageBuilder(context, state),
              ),
              GoRoute(
                path: ContactUsScreen.routePath,
                name: ContactUsScreen.routeName,
                pageBuilder: (context, state) =>
                    ContactUsScreen.pageBuilder(context, state),
              ),
              GoRoute(
                path: PersonalInfoUpdate.routePath,
                name: PersonalInfoUpdate.routeName,
                pageBuilder: (context, state) =>
                    PersonalInfoUpdate.pageBuilder(context, state),
              ),
              GoRoute(
                path: AllProjectsScreen.routePath,
                name: AllProjectsScreen.routeName,
                pageBuilder: (context, state) =>
                    AllProjectsScreen.pageBuilder(context, state),
              ),
              GoRoute(
                path: AllWorkScreen.routePath,
                name: AllWorkScreen.routeName,
                pageBuilder: (context, state) =>
                    AllWorkScreen.pageBuilder(context, state),
              ),
              GoRoute(
                path: CareerUpdateScreen.routePath,
                name: CareerUpdateScreen.routeName,
                pageBuilder: (context, state) =>
                    CareerUpdateScreen.pageBuilder(context, state),
              ),
              GoRoute(
                  path: PortfolioUpdateScreen.routePath,
                  name: PortfolioUpdateScreen.routeName,
                  pageBuilder: (context, state) =>
                      PortfolioUpdateScreen.pageBuilder(context, state),
                  routes: [
                    GoRoute(
                      path: AddUpdateWork.routePath,
                      name: AddUpdateWork.routeName,
                      pageBuilder: (context, state) =>
                          AddUpdateWork.pageBuilder(context, state),
                    ),
                  ]),
              GoRoute(
                  path: WorkingOn.routePath,
                  name: WorkingOn.routeName,
                  pageBuilder: (context, state) =>
                      WorkingOn.pageBuilder(context, state),
                  routes: []),
              GoRoute(
                  path: AllOwnProject.routePath,
                  name: AllOwnProject.routeName,
                  pageBuilder: (context, state) =>
                      AllOwnProject.pageBuilder(context, state),
                  routes: []),
              GoRoute(
                  path: AddProject.routePath,
                  name: AddProject.routeName,
                  pageBuilder: (context, state) =>
                      AddProject.pageBuilder(context, state),
                  routes: []),
              GoRoute(
                  path: PendingProject.routePath,
                  name: PendingProject.routeName,
                  pageBuilder: (context, state) =>
                      PendingProject.pageBuilder(context, state),
                  routes: []),
              GoRoute(
                  path: ProjectOwn.routePath,
                  name: ProjectOwn.routeName,
                  pageBuilder: (context, state) =>
                      ProjectOwn.pageBuilder(context, state),
                  routes: [
                    GoRoute(
                        path: ContractScreen.routePath,
                        name: ContractScreen.routeName,
                        pageBuilder: (context, state) =>
                            ContractScreen.pageBuilder(context, state),
                        routes: []),
                  ]),
              GoRoute(
                  path: TipsScreen.routePath,
                  name: TipsScreen.routeName,
                  pageBuilder: (context, state) =>
                      TipsScreen.pageBuilder(context, state),
                  routes: []),
              GoRoute(
                  path: SearchUsersScreen.routePath,
                  name: SearchUsersScreen.routeName,
                  pageBuilder: (context, state) =>
                      SearchUsersScreen.pageBuilder(context, state),
                  routes: []),
              // GoRoute(
              //     path: PersonalProfilePage.routePath,
              //     name: PersonalProfilePage.routeName,
              //     pageBuilder: (context, state) =>
              //         PersonalProfilePage.pageBuilder(context, state),
              //     routes: []),
              GoRoute(
                  path: ProjectDetail.routePath,
                  name: ProjectDetail.routeName,
                  pageBuilder: (context, state) =>
                      ProjectDetail.pageBuilder(context, state),
                  routes: [
                    GoRoute(
                        path: CommentScreen.routePath,
                        name: CommentScreen.routeName,
                        pageBuilder: (context, state) =>
                            CommentScreen.pageBuilder(context, state),
                        routes: []),
                    GoRoute(
                        path: OfferScreen.routePath,
                        name: OfferScreen.routeName,
                        pageBuilder: (context, state) =>
                            OfferScreen.pageBuilder(context, state),
                        routes: []),
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
