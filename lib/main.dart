import 'package:airflower/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: MyApp()));
}

myTransitionPage(GoRouterState state, Widget child, Offset offset) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: offset, end: Offset.zero).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutQuint,
        )),
        child: child,
      );
    },
  );
}

class MyApp extends ConsumerWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => myTransitionPage(
          state,
          const Scaffold(
            body: Center(child: Text("!")),
          ),
          const Offset(1, 0),
        ),
      ),
      GoRoute(
        path: '/a',
        pageBuilder: (context, state) => myTransitionPage(
          state,
          const MainScreen(),
          const Offset(1, 0),
        ),
      ),
    ],
  );

  MyApp({super.key});

  final seedColorProvider = StateProvider((ref) => Colors.teal);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color themeSeedColor = ref.watch(seedColorProvider);
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(brightness: Brightness.light, seedColor: themeSeedColor),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: themeSeedColor),
      ),
    );
  }
}
