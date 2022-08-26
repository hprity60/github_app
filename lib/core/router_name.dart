import 'package:flutter/material.dart';

import '../modules/search/view/github_list_screen.dart';
class RouteNames {
  static const String githubListScreen = '/';
  static const String detailsScreen = '/detailsScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.githubListScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const GithubListScreen());
      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
