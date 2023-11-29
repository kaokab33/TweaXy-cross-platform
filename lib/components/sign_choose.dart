import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sign_button/sign_button.dart';
import 'package:tweaxy/components/sign_in_with.dart';
import 'package:tweaxy/components/start_screen_divider.dart';
import 'package:tweaxy/components/toasts/custom_web_toast.dart';
import 'package:tweaxy/constants.dart';
import 'package:tweaxy/services/login_api.dart';
import 'package:tweaxy/services/sign_in.dart';
import 'package:tweaxy/services/sign_in_google.dart';

class SignChoose extends StatefulWidget {
  const SignChoose({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  State<SignChoose> createState() => _SignChooseState();
}

class _SignChooseState extends State<SignChoose> {
///////////////////////////////
  void signInWithGoogle() async {
    try {
      var googleAccount = await GoogleSingInApi.loginWeb();
      if (googleAccount != null) {
        var googleToken = await GoogleSingInApi.getGoogleToken();
        debugPrint("google account ${googleAccount.email}");
        if (googleToken != null) {
          debugPrint("Google Token: $googleToken");
        } else {
          debugPrint("token is null");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  const Text(
                    "Error in Signing in with Google",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      } else {
        debugPrint("google account is null");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                const Text(
                  "Error in Signing in with Google",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint("error in google sign in $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              const Text(
                "Error in Signing in with Google",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

///////////////////
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: SignWithButton(
            type: widget.isDarkMode ? ButtonType.googleDark : ButtonType.google,
            onPressed: () async {
              try {
                signInWithGoogle();
                //   Map<String, dynamic> loginGoogle =
                //       await LoginApi().SignInWithGoogle();
                //   if (loginGoogle['status'] == "success") {
                //     //go to home page
                //     print(loginGoogle);
                //     Navigator.pushNamed(context, kStartScreen);
                //   }
                // } on DioException catch (e) {
                //   //    print('DioException: ${e.toString()}');
                //   // ignore: use_build_context_synchronously
                //   // showSnackBar(context, e.response!.data['message']);
                //   showToastWidget(
                //     CustomWebToast(
                //       message: e.response!.data['message'],
                //     ),
                //     position: ToastPosition.bottom,
                //     duration: const Duration(seconds: 2),
                //   );
              } on Exception catch (e) {
                //   print(e.toString());
                if (kIsWeb) {
                  showToastWidget(
                    CustomWebToast(
                      message: e.toString(),
                    ),
                    position: ToastPosition.bottom,
                    duration: const Duration(seconds: 2),
                  );
                } else {
                  showToastWidget(
                    CustomWebToast(
                      message: e.toString(),
                    ),
                    position: ToastPosition.bottom,
                    duration: const Duration(seconds: 2),
                  );
                }
              }
            },
            size: ButtonSize.medium,
          ),
        ),
        // SizedBox(
        //   width: double.infinity,
        //   child: SignWithButton(
        //     type: !isDarkMode ? ButtonType.facebook : ButtonType.facebookDark,
        //     onPressed: () {
        //       //TODO: implement continue with facebook logic
        //     },
        //     size: ButtonSize.large,
        //   ),
        // ),
        // SizedBox(
        //   width: double.infinity,
        //   child: SignWithButton(
        //     type: !isDarkMode ? ButtonType.github : ButtonType.githubDark,
        //     onPressed: () {
        //       //TODO: implement continue with github logic
        //       var res = SignInServices.signInGithub();
        //       // print("sign in" + res.toString());
        //     },
        //     size: ButtonSize.medium,
        //   ),
        // ),
        StartScreenDivider(isDarkMode: widget.isDarkMode),
      ],
    );
  }
}
