import 'package:ringo/ui/screens/home/home_screen.dart';
import 'package:ringo/ui/screens/login/login_screen.dart';
import 'package:ringo/ui/screens/splash/splash_screen.dart';

class Routes {
  static final routes = {
    LoginScreen.routeName: (ctx) => const LoginScreen(),
    HomeScreen.routeName: (ctx) => const HomeScreen(),
    SplashScreen.routeName: (ctx) => const SplashScreen(),
  };
}
