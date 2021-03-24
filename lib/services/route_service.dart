import 'package:get/route_manager.dart';
import 'package:sync_play/ui/pages/auth/auth_bloc.dart';
import 'package:sync_play/ui/pages/auth/auth_view.dart';
import 'package:sync_play/ui/pages/home/home_bindings.dart';
import 'package:sync_play/ui/pages/home/home_view.dart';
import 'package:sync_play/ui/pages/profile_edit/profile_edit_bloc.dart';
import 'package:sync_play/ui/pages/profile_edit/profile_edit_view.dart';
import 'package:sync_play/ui/pages/register/register_bloc.dart';
import 'package:sync_play/ui/pages/register/register_view.dart';
import 'package:sync_play/ui/pages/splash/splash_view.dart';

class RouteService {
  static const SPLASH = '/splash';
  static const HOME = '/';
  static const AUTH = '/login';
  static const REGISTER = '/register';
  static const EDIT_PROFILE = '/profile';

  static final getPages = <GetPage>[
    GetPage(
      name: SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: HOME,
      page: () => HomeView(),
      binding: HomePageBindings(),
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
    ),
    GetPage(
      name: EDIT_PROFILE,
      page: () => ProfileEditView(),
      binding: ProfileEditBindings(),
    ),
  ];
}
