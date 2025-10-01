import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mylekha_cd_app/screens/home/home_screen.dart';
import 'package:mylekha_cd_app/screens/live-cart/live_cart_screen.dart';
import 'package:mylekha_cd_app/screens/login/login_by_qr_screen.dart';
import 'package:mylekha_cd_app/screens/login/login_screen.dart';
import 'package:mylekha_cd_app/screens/login/selected_device.dart';
import 'route_names.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.LOGIN_PATH,
    routes: [
      GoRoute(
        path: RouteNames.HOME_PATH,
        name: RouteNames.HOME,
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.LIVE_CART_PATH,
        name: RouteNames.LIVE_CART,
        builder: (_, __) => const LiveCartScreen(),
      ),
      GoRoute(
        path: RouteNames.LOGIN_PATH,
        name: RouteNames.LOGIN,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.LOGIN_QR_PATH,
        name: RouteNames.LOGIN_QR,
        builder: (_, __) => const LoginByQrScreen(),
      ),
      GoRoute(
        path: RouteNames.SELECTED_DEVICE_PATH,
        name: RouteNames.SELECTED_DEVICE,
        builder: (_, __) => SelectedDevice(),
      ),

      // GoRoute(
      //   path: RouteNames.STORE,
      //   name: 'store',
      //   builder: (_, __) => const StorePage(),
      //   routes: [
      //     GoRoute(
      //       path: ':id',
      //       name: 'storeDetail',
      //       builder: (context, state) {
      //         final id = state.params['id']!;
      //         return StoreDetailPage(storeId: id);
      //       },
      //     ),
      //   ],
      // ),
    ],
  );
}
