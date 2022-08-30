import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Container(

       child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Colors.black12,
                  height: 60,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffFFFFFF),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Livestock',
                              style: TextStyle(
                                  color: Color(0xff357619), fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffFFFFFF),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Animal Equipments',
                              style: TextStyle(
                                  color: Color(0xff357619), fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffFFFFFF),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Feed',
                              style: TextStyle(
                                  color: Color(0xff357619), fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffFFFFFF),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Market',
                              style: TextStyle(
                                  color: Color(0xff357619), fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                          height: 150,
                          color: Colors.black12,
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                color: Colors.blue,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Day Old Chicken',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'I am a very beautiful\nchick',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '# 500',
                                      style: TextStyle(
                                        color: Color(0xff357619),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Container(
                          height: 150,
                          color: Colors.black12,
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                color: Colors.blue,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Day Old Chicken',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'I am a very beautiful\nchick',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '# 500',
                                      style: TextStyle(
                                        color: Color(0xff357619),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Container(
                          height: 150,
                          color: Colors.black12,
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                color: Colors.blue,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Day Old Chicken',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'I am a very beautiful\nchick',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '# 500',
                                      style: TextStyle(
                                        color: Color(0xff357619),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Container(
                          height: 150,
                          color: Colors.black12,
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                color: Colors.blue,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Day Old Chicken',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'I am a very beautiful\nchick',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '# 500',
                                      style: TextStyle(
                                        color: Color(0xff357619),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Container(
                          height: 150,
                          color: Colors.black12,
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                color: Colors.blue,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Day Old Chicken',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'I am a very beautiful\nchick',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '# 500',
                                      style: TextStyle(
                                        color: Color(0xff357619),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Container(
                          height: 150,
                          color: Colors.black12,
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                color: Colors.blue,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Day Old Chicken',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'I am a very beautiful\nchick',
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '# 500',
                                      style: TextStyle(
                                        color: Color(0xff357619),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}
