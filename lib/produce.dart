import 'package:flutter/material.dart';

class Produce extends StatefulWidget {
  const Produce({super.key});

  @override
  State<Produce> createState() => _ProduceState();
}

class _ProduceState extends State<Produce> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Day Old Chicken',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PopupMenuButton(
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry>[
                            const PopupMenuItem(
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem(
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      ],
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
    );
  }
}
