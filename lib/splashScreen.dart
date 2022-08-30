// ignore: file_names
import 'login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Container(
            //   height: 350,
            //   width: double.infinity,
            //   child: Image.asset(
            //     'assets/images/splash.jfif',
            //     fit: BoxFit.fill,
            //   ),
            // ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xff357619),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'FF',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text('Fat Farm',
                      style: TextStyle(
                        // fontFamily: 'times new roman',
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff357619),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
