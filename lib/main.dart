import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tweaxy/Views/profile/profile_screen.dart';
import 'package:tweaxy/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:tweaxy/views/homepage.dart';
import 'package:tweaxy/views/signup/authentication_view.dart';
import 'package:tweaxy/constants.dart';
import 'package:tweaxy/views/login/login_view_page1.dart';
import 'package:tweaxy/views/signup/create_account_view.dart';
import 'package:tweaxy/views/signup/create_account_web_view.dart';
import 'package:tweaxy/views/splash_screen.dart';
import 'package:tweaxy/views/start_screen.dart';
import 'package:tweaxy/views/start_screen_web.dart';

void main() {
  // _save(); 
  runApp(const TweaXy());
}

class TweaXy extends StatelessWidget {
  const TweaXy({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: brightness,
          useMaterial3: false,
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
          dialogBackgroundColor: isDarkMode ? Colors.black : Colors.white,
        ),
        routes: {
          kSplashScreen: (context) => const SplashScreen(),
          kStartScreen: (context) => const StartScreen(),
          kWebStartScreen: (context) => const WebStartScreen(),
          kLogin1Screen: (context) => const LoginViewPage1(),
          kCreateAcountScreen: (context) => const CreateAccountView(),
          kCreateAcountWebScreen: (context) => const CreateAccountWebView(),
          kAuthenticationScreen: (context) => const AuthenticationView(),
          kProfileScreen: (context) => const ProfileScreen(),
          kHomeScreen: (context) => HomePage(),
        },
        initialRoute: kProfileScreen,
      ),
    );
  }
}

void _save() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', 'clpj7l5wq00033h9kml3a9vkp');
  await prefs.setString('token',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IlwiY2xwajdsNXdxMDAwMzNoOWttbDNhOXZrcFwiIiwiaWF0IjoxNzAxMjI4NjA2LCJleHAiOjE3MDM4MjA2MDZ9.qrToCvvaZTBWK1yn-fFlYE9zkU2ZsYwA3PiW1uVFvCo');
}
