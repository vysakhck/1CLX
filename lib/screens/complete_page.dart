import 'package:flutter/material.dart';
import 'package:project/extensions/context_extensions.dart';

import '../utils/1clx_theme.dart';

class Page9 extends StatefulWidget {
  const Page9({super.key});

  @override
  State<Page9> createState() => _Page9State();
}

class _Page9State extends State<Page9> {
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
                stops: const [0, 0.3],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/complete.png'),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          'CONGRATS! \n YOU COMPLETED THE PROCESS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Your Business Website URL: https://www.IcIx.com/businessname',
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      SizedBox(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: buttonTheme(
                            color: const Color(0xFF5E86EC),
                          ),
                          child: Text(
                            'DASHBOARD',
                            style: context.textTheme.titleMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: buttonTheme(
                            color: context.colorScheme.primary,
                          ),
                          child: Text(
                            'WEBSITE',
                            style: context.textTheme.titleMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/img1.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/img2.png'),
          ),
        ],
      ),
    );
  }
}
