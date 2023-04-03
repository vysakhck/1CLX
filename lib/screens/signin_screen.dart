import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:project/extensions/context_extensions.dart';
import 'package:project/screens/signup_screen.dart';
import 'package:project/utils/1clx_theme.dart';

import '../widgets/custome_inputs.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: context.colorScheme.primary,
              child: Image.asset(
                'assets/signin.png',
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 0,
                top: 16,
                left: 24,
                right: 24,
              ),
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.poppins().copyWith(
                        color: context.colorScheme.primary,
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
                    obscureText: true,
                    hintText: 'Password',
                    radius: 128,
                    borderSide: BorderSide.none,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Text(
                            'Remember',
                            style: TextStyle(
                              color: context.colorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Forgot Password ?'))
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: buttonTheme(
                        color: const Color(0xFF5E86EC), isRounded: false),
                    child: const Text(
                      'SUBMIT',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 24),
                          color: context.colorScheme.background,
                          child: const Text("or")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Login with',
                        style: TextStyle(color: Colors.black26),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/Gicon.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/Ficon.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/Licon.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/Ticon.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 24),
                        color: context.colorScheme.background,
                        child: const Text("or"),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: 'Mobile Number',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(128),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      suffixIcon: SizedBox(
                        width: 128,
                        child: TextButton(
                          style: buttonTheme(color: Colors.grey[200]!),
                          onPressed: () {},
                          child: const Text('Request OTP'),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black26,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 0),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            context.navigate(const SignUpScreen());
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 12,
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
