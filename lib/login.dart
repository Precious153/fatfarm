import 'package:fatfarm/produce.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homepage.dart';
import 'signUp.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _visible = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return 'E-mail address is required.';

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

    return null;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(children: [
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
              const Center(
                child: Text('Welcome Back !',
                    style: TextStyle(
                        // fontFamily: 'times new roman',
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff000000))),
              ),
              const SizedBox(height: 40),
             Form(
               key: _formKey,
               child: Column(
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text(
                         'Email Address',
                         style: const TextStyle(
                           fontWeight: FontWeight.w400,
                           fontSize: 16,
                         ),
                       ),
                       const SizedBox(height: 2),
                       SizedBox(
                         height: 80,
                         width: 315,
                         child: Column(
                           children: [
                             Container(
                               // color: Color(0xffA0A0A0),
                               child: TextFormField(
                                 controller: _email,
                                 validator: validateEmail,
                                 decoration: InputDecoration(
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(8),
                                   ),
                                   hintText: 'Enter your Email Address',
                                   hintStyle: const TextStyle(
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                     color: Color(0xff8C8C8C),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 20),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text(
                         'Enter Password',
                         style: TextStyle(
                           fontWeight: FontWeight.w400,
                           fontSize: 16,
                           color: Color(0xff333333),
                         ),
                       ),
                       const SizedBox(height: 2),
                       SizedBox(
                         height: 80,
                         width: 315,
                         child: Container(
                           child: TextFormField(
                             controller: _password,
                             validator: (value) {
                               if (value!.isEmpty) return 'Password field entry is needed';
                             },
                             obscureText: _visible,
                             decoration: InputDecoration(
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(8),
                                 ),
                                 labelStyle: const TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w400,
                                 ),
                                 suffixIcon: IconButton(
                                   onPressed: () {
                                     setState(() {
                                       _visible = !_visible;
                                     });
                                   },
                                   icon: _visible
                                       ? const Icon(
                                     Icons.visibility,
                                   )
                                       : const Icon(
                                     Icons.visibility_off,
                                   ),
                                 )),
                           ),
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 5),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       GestureDetector(
                         onTap: (() {}),
                         child: const Text(
                           'Forgot password?',
                           style: const TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.w400,
                             color: const Color(0xff0056E0),
                           ),
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 50),
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
                         onPressed: () async {
                           if(_formKey.currentState!.validate()) {
                             setState(() {
                               isLoading = true;
                             });
                             // isLoading = true;
                             // setState(() {});
                             try{
                               await
                               FirebaseAuth.instance.
                               signInWithEmailAndPassword(
                                 email: _email.text.trim(),
                                 password: _password.text,
                               ).then((value) =>
                                   Navigator.pushReplacement(context,
                                       MaterialPageRoute(
                                           builder: (context) => Homepage())));
                             }on FirebaseAuthException catch (error) {
                               print(error);
                             }catch(e,s){
                               print(e);
                               print(s);
                             }
                             Future.delayed(Duration(seconds: 4)).then((
                                 value) {
                               isLoading = false;
                               setState(() {});
                             });
                           }
                         },
                         child: isLoading == false
                             ? const Center(
                           child: Text(
                             'Log In',
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.w600,
                               color: Color(0xffFFFFFF),
                             ),
                           ),
                         )
                             : const Center(
                             child: CircularProgressIndicator(
                                 color: Colors.white))),
                   ),
                 ],
               ),
             ),

              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account yet? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    }),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff0056E0),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
