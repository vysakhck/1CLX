import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:project/extensions/context_extensions.dart';
import 'package:project/screens/signin_screen.dart';
import 'package:project/utils/1clx_theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.primary,
                  Colors.white,
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: const [0, 0.5],
              ),
            ),
          ),
          Positioned(
            top: 18,
            left: -24,
            child: SvgPicture.asset(
              'assets/Union.svg',
              width: 380,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 200, top: 12),
                  child: Image.asset(
                    'assets/whitelogo.png',
                    height: 66,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 62, top: 64),
                  child: Column(
                    children: const [
                      Text(
                        'CREATE',
                        style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 0.8),
                      ),
                      Center(
                        child: Text(
                          'YOUR BUSINESS \n WEBSITES IN \n 3 MINUTES',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Image.asset('assets/splash.png'),
                const SizedBox(height: 28),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 72),
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(128),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      context.navigate(const SignInScreen());
                    },
                    style: buttonTheme(color: Colors.transparent),
                    child: Text(
                      'Get Started Now',
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
