import 'package:get/get.dart';

import '../view/auth_screen/login_screen.dart';
import '../view/auth_screen/signup_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/movie_detail_screen.dart';
import '../view/screens/movie_search.dart';
import '../view/screens/ticket_booking_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    LoginScreen.page,
    SignupScreen.page,
    HomeScreen.page,
    MovieDetailsScreen.page,
    TicketBookingScreen.page,
    MovieSearch.page,
  ];
}
