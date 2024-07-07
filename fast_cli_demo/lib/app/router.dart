import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fast_cli_demo/features/authentication/ui/forgot_password_view.dart';
import 'package:fast_cli_demo/features/authentication/ui/profile_view.dart';
import 'package:fast_cli_demo/features/authentication/ui/register_view.dart';
import 'package:fast_cli_demo/features/authentication/ui/reset_password_view.dart';
import 'package:fast_cli_demo/features/authentication/ui/sign_in_view.dart';
import 'package:fast_cli_demo/features/feedback/ui/feedback/feedback_view.dart';
import 'package:fast_cli_demo/features/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:fast_cli_demo/features/home/ui/home/home_view.dart';

import 'package:fast_cli_demo/features/subscriptions/ui/subscription/subscription_view.dart';

import 'package:fast_cli_demo/features/home/ui/onboarding/onboarding_view.dart';
import 'package:fast_cli_demo/features/settings/ui/settings/settings_view.dart';
import 'package:fast_cli_demo/features/shared/utils/navigation/auth_guard.dart';
import 'package:fast_cli_demo/modules/rss/ui/rss/rss_view.dart';

//x Chat x//
import 'package:fast_cli_demo/modules/chat/ui/chat/chat_view.dart';
//x Chat x//

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: ('View,Route'))
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, guards: [AuthGuard()]),
        AutoRoute(page: OnboardingRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page, path: '/reset-password'),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: SettingsRoute.page),

        //* Chat *//
        AutoRoute(page: ChatRoute.page),
        //* Chat *//

        AutoRoute(page: FeedbackRoute.page),
        AutoRoute(page: NewFeedbackRoute.page),
        AutoRoute(page: RssRoute.page),

        AutoRoute(page: SubscriptionRoute.page),

        // New Routes
      ];
}
