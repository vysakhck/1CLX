import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:project/extensions/context_extensions.dart';
import 'package:project/screens/account_creation.dart';
import 'package:project/utils/1clx_theme.dart';

import '../widgets/custome_inputs.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 24,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, -1),
                    color: Colors.black45,
                  )
                ],
              ),
              child: Image.asset(
                'assets/signup.png',
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 0,
                top: 16,
                left: 24,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins().copyWith(
                        color: context.colorScheme.background,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomeInputField(
                    fillColor: Colors.grey[100],
                    obscureText: false,
                    hintText: 'User Name',
                    radius: 128,
                    borderSide: BorderSide.none,
                  ),
                  CustomeInputField(
                    fillColor: Colors.grey[100],
                    obscureText: false,
                    hintText: 'Email Id',
                    radius: 128,
                    borderSide: BorderSide.none,
                  ),
                  CustomeInputField(
                    fillColor: Colors.grey[100],
                    obscureText: true,
                    hintText: 'Password',
                    radius: 128,
                    borderSide: BorderSide.none,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.navigate(const AccontCreaionPage());
                    },
                    style: buttonTheme(
                        color: const Color(0xFF5E86EC), isRounded: false),
                    child: const Text(
                      'CREATE ACCOUNT',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Divider(
                        color: context.colorScheme.background,
                        thickness: 1,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 24),
                          color: context.colorScheme.primary,
                          child: const Text("or")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Sign Up with',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: context.colorScheme.background,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Gicon.png',
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: context.colorScheme.background,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Ficon.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: context.colorScheme.background,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Licon.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: context.colorScheme.background,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Ticon.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 0),
                              shape: const StadiumBorder(),
                              backgroundColor: context.colorScheme.background),
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 12,
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
