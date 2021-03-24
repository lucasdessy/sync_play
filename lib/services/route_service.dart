import 'package:get/route_manager.dart';
import 'package:sync_play/ui/pages/auth/auth_bloc.dart';
import 'package:sync_play/ui/pages/auth/auth_view.dart';
import 'package:sync_play/ui/pages/home/home_view.dart';
import 'package:sync_play/ui/pages/register/register_bloc.dart';
import 'package:sync_play/ui/pages/register/register_view.dart';

class RouteService {
  static const HOME = '/';
  static const AUTH = '/login';
  static const REGISTER = '/register';

  static final getPages = <GetPage>[
    GetPage(
      name: HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: AUTH,
      page: () => AuthView(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: REGISTER,
      page: () => RegisterView(),
      binding: RegisterPageBindings(),
    )
  ];
}
