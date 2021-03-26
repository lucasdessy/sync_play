import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sync_play/ui/pages/auth/auth_view.dart';
import 'package:sync_play/ui/pages/history/history_view.dart';
import 'package:sync_play/ui/pages/home/home_view.dart';
import 'package:sync_play/ui/pages/register/register_view.dart';
import 'package:sync_play/ui/pages/room/room_view.dart';
import 'package:sync_play/ui/pages/splash/splash_view.dart';

class RouteService {
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const AUTH = '/login';
  static const REGISTER = '/register';
  static const HISTORY = '/history';
  static const ROOM = '/room';

  static final routes = <String, WidgetBuilder>{
    SPLASH: (ctx) => SplashView(),
    HOME: (ctx) => HomeView(),
    AUTH: (ctx) => AuthView(),
    REGISTER: (ctx) => RegisterView(),
    HISTORY: (ctx) => HistoryView(),
    ROOM: (ctx) => RoomView(),
  };
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (routes[settings.name] != null) {
      return MaterialWithModalsPageRoute(
          settings: settings, builder: routes[settings.name]!);
    }
    print('going to uknown route... ${settings.name}');
    return null;
  }
}
