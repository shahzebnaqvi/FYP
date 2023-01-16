import 'package:get/get.dart';
import 'package:medicalapp/Views/Auth/Login/login_screen.dart';
import 'package:medicalapp/Views/Auth/Register/register_screen.dart';
import 'package:medicalapp/Views/Auth/auth_home_screen.dart';
import 'package:medicalapp/Views/Auth/auth_home_screenas_doctor_or_patient.dart';
import 'package:medicalapp/Views/Onboarding/onboard_screen1.dart';
import 'package:medicalapp/Views/Splash/splash_screen.dart';

class AppRoutes {
  static String splash = "/";
  static String onboarding = "/onboarding1";
  static String abc = "/onboarding";
  static String authhomeScreen = "/AuthHomeScreen";
  static String doctororpatient = "/DoctorOrPatient";
  static String loginscreen = "/LoginScreen";
  static String registerscreen = "/RegisterScreen";
  static String registerhomescreen = "/RegisterHomeScreen";

  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: authhomeScreen,
      page: () => AuthHomeScreen(),
    ),
    GetPage(
      name: loginscreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingScreen1(),
    ),
    GetPage(
      name: registerscreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: doctororpatient,
      page: () => DoctorOrPatient(),
    ),
  ];
}
