import 'package:blokchain_based_voiting/ui/use_vote_page.dart';
import 'package:blokchain_based_voiting/ui/vote_feed_page.dart';
import 'package:blokchain_based_voiting/ui/login_page.dart';
import 'package:blokchain_based_voiting/ui/splash_page.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> globalNavigator = GlobalKey<NavigatorState>(debugLabel: 'main');
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B-Oylama',
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: globalNavigator,
      initialRoute: '/',
      onUnknownRoute: (settings) => throw Exception('[Main Navigator] Unknown route: ${settings.name}'),
      routes: {
        '/': (c) => const SplashPage(),
        '/voteFeed': (c) =>const VoteFeedPage(),
        '/useVote':(c)=>const UseVotePage(),
        '/login': (c) => const LoginPage(),
      },
    );
  }
}
