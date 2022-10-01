import 'package:flutter/cupertino.dart';
import 'package:steps_tracker_flutter/presentation/layouts/main_layout_page.dart';
import 'package:steps_tracker_flutter/presentation/pages/auth/sign_in.page.dart';
import 'package:steps_tracker_flutter/presentation/pages/history/history.page.dart';
import 'package:steps_tracker_flutter/presentation/pages/home/home.page.dart';
import 'package:steps_tracker_flutter/presentation/pages/leaderboard/leaderboard.page.dart';
import 'package:steps_tracker_flutter/presentation/pages/reward/reward.page.dart';

class Routes {
  static String root = "/";
  static String homePage = "/home_page";
  static String appLayout = "/app_layout";
  static String signInPage = "/signin_page";
  static String rewardPage = "/reward_page";
  static String historyPage = "/history_page";
  static String leaderBoardPage = "/leaderboard_page";

  static Map<String, Widget Function(BuildContext)> configureRoutes() {
    return {
      signInPage: (context) => SignInPage(),
      homePage: (context) => const HomePage(),
      appLayout: (context) => const AppLayout(),
      rewardPage: (context) => const RewardPage(),
      historyPage: (context) => const HistoryPage(),
      leaderBoardPage: (context) => const LeaderBoardPage(),
    };
  }
}
