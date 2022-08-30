// ignore_for_file: unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';

import 'accSuccessful.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _visible = true;
  bool _checked = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return 'Password is required.';

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';

    return null;
  }

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
                child: Text('Enter your details correctly below',
                    style: const TextStyle(
                        // fontFamily: 'times new roman',
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff000000))),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'First Name',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 2),
                            SizedBox(
                              height: 60,
                              width: 160,
                              child: Column(
                                children: [
                                  Container(
                                    // color: Color(0xffA0A0A0),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty)
                                          return 'Firstname field entry is needed';
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        hintText: 'Enter First Name',
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
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Last Name',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 2),
                              SizedBox(
                                height: 60,
                                width: 140,
                                child: Column(
                                  children: [
                                    Container(
                                      // color: Color(0xffA0A0A0),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return 'Lastname field entry is needed';
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          hintText: 'Enter Last Name',
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone Number',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        SizedBox(
                          height: 60,
                          width: 315,
                          child: Column(
                            children: [
                              Container(
                                // color: Color(0xffA0A0A0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty)
                                      return 'PhoneNumber field entry is needed';
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: 'Enter your Phone Number',
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
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email Address',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        SizedBox(
                          height: 60,
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
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Create Password',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: const Color(0xff333333),
                          ),
                        ),
                        const SizedBox(height: 2),
                        SizedBox(
                          height: 60,
                          width: 315,
                          child: Container(
                            child: TextFormField(
                              controller: _password,
                              validator: validatePassword,
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
                    const SizedBox(height: 30),
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
                                  createUserWithEmailAndPassword(
                                    email: _email.text.trim(),
                                    password: _password.text,
                                  ).then((value) =>
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                              builder: (context) => AccSuccessful())));
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
                            'Create Account',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        )
                            : const Center(
                            child:
                            CircularProgressIndicator(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _checked,
                    onChanged: (bool? value) {
                      setState(() {
                        _checked = !_checked;
                      });
                    },
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'I agree to the ',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff000000),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'terms of services ',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff0056E0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: const [
                        //     Text(
                        //       'and ',
                        //       style: TextStyle(
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w400,
                        //         color: Color(0xff000000),
                        //       ),
                        //     ),
                        //     // Text(
                        //     //   'privacy policy',
                        //     //   style: TextStyle(
                        //     //     fontSize: 14,
                        //     //     fontWeight: FontWeight.w400,
                        //     //     color: Color(0xff0056E0),
                        //     //   ),
                        //     // ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ]),
          ),
        ),
      ),
    );
  }
}
