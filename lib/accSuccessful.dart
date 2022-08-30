import 'homepage.dart';
import 'login.dart';
import 'package:flutter/material.dart';

class AccSuccessful extends StatefulWidget {
  const AccSuccessful({super.key});

  @override
  State<AccSuccessful> createState() => _AccSuccessfulState();
}

class _AccSuccessfulState extends State<AccSuccessful> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 50),
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
            const SizedBox(height: 40),
            const Center(
              child: Text('Account Created\nSuccessfully',
                  textAlign: TextAlign.center,
                  // ignore: unnecessary_const
                  style: const TextStyle(
                      // fontFamily: 'times new roman',
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff000000))),
            ),
            const SizedBox(height: 50),
            const Icon(Icons.mark_chat_read,
                size: 150, color: Color(0xff357619)),
            const SizedBox(height: 100),
            SizedBox(
              height: 60,
              width: 315,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff357619),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Icon(Icons.arrow_forward_sharp, size: 40)),
            ),
          ],
        ),
      ),
    );
  }
}
