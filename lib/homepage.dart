
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatfarm/upload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser;
  final CollectionReference _reference =  FirebaseFirestore.instance.collection('users-data');

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: Color(0xff357619),
            title: Center(
              child: Text('MarketPlace',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xffFFFFFF)
              )),
            ),
            // title: Container(
            //   decoration: BoxDecoration(
            //       color: Color(0xffFFFFFF),
            //       borderRadius: BorderRadius.circular(20)),
            //   child: TextField(
            //     onChanged: (value) {},
            //     cursorColor: Colors.black,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         focusedBorder: InputBorder.none,
            //         enabledBorder: InputBorder.none,
            //         errorBorder: InputBorder.none,
            //         disabledBorder: InputBorder.none,
            //         hintText: 'Search...',
            //         prefixIcon: Icon(Icons.search)),
            //   ),
            // )
    ),

        body:StreamBuilder(
          stream: _reference.snapshots().asBroadcastStream(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
            if(snapshot.hasError){
              return Center(child: Text('error'));
            }else{
              if(!snapshot.hasData){
                Center(child:
                CircularProgressIndicator(color: Colors.red,));
              }else{
                final datavalue =
                snapshot.data!.docs.toList();
                print(datavalue.length);
                print(datavalue[0].data());
                return Container(
                  height: 800,
                  child : ListView.builder(
                      itemCount: datavalue.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                            startActionPane: ActionPane(
                            motion: ScrollMotion(),
                        children: [
                        SlidableAction(
                        onPressed: (_) async {
                        var formDoc = await FirebaseFirestore
                            .instance
                            .collection("users-data")
                            .where("name" == "${datavalue[index]['name']}")
                            .where("price" == "${datavalue[index]['price']}")
                            .get();

                        // await FirebaseFirestore.instance.collection("users-data").doc().delete();
                        print(formDoc);
                        },
                        icon: Icons.edit,
                        backgroundColor: Colors.blueAccent,
                        ),
                        ],
                        ),
                        endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                        SlidableAction(
                        onPressed: (_) {},
                        icon: Icons.delete_outline,
                        backgroundColor: Colors.red,
                        )
                        ],
                        ),
                         child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                              height: 150,
                              color: Colors.black12,
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                      height: 150,
                                      child:
                                      Image.file(File('${datavalue[index]['imagepath'].toString()}'))
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                             Text(
                                              '${datavalue[index]['name']}',
                                              style: TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // PopupMenuButton(
                                            //   itemBuilder: (BuildContext context) =>
                                            //   <PopupMenuEntry>[
                                            //     const PopupMenuItem(
                                            //       child: Text('Edit'),
                                            //     ),
                                            //     const PopupMenuItem(
                                            //       child: Text('Delete'),
                                            //     ),
                                            //   ],
                                            // )
                                          ],
                                        ),
                                        Text(
                                          '${datavalue[index]['description']}',
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                        Text(
                                        '₦',
                                          style: TextStyle(
                                            color: Color(0xff357619),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                            Text(
                                              '${datavalue[index]['price']}',
                                              style: TextStyle(
                                                color: Color(0xff357619),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        );
                      }),

                );
              }
              return SizedBox();
            }
          },
        ),



        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff357619),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Upload()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
