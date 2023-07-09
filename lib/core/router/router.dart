import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixa_bay_intermediate/presentation/detail/detail_screen.dart';
import 'package:pixa_bay_intermediate/presentation/main/main_screen.dart';
import 'package:pixa_bay_intermediate/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(),
          child: const MainScreen(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailScreen();
          },
        ),
      ],
    ),
  ],
);
