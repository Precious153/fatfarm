// import 'package:flutter/material.dart';
//
// class Build extends StatefulWidget {
//   const Build({super.key});
//
//   @override
//   State<Build> createState() => _BuildState();
// }
//
// class _BuildState extends State<Build> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             FutureBuilder<Object>(
//               future: FirebaseFirestore.instance
//               .collection('user')
//               .dpc('hacker@gmail.com')
//               .get(),
//               builder: context, snapshot) {
//                 if (snapshot.hasError) {
//                   print('error');
//                 }else if (snapshot.connectionState == ConnectionState.waiting){
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 }
//                 else if (snapshot.connectionState == ConnectionState.done) {
//                   if (snapshot.hasData) {
//
//                   }
//                 }
//
//                 }
//               }
//           ],
//         ),
//       ),
//     );
//   }
// }
