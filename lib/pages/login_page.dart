import 'package:flutter/material.dart';
import 'package:ingeclimaproyecto/widgets/login_form.dart';


class CustomLogin extends StatelessWidget {
  const CustomLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(         
    children: [
      Container(
        height: double.infinity,
        decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage('assets/datacenter.jpg'),
              fit: BoxFit.cover,
            )),
      ),
      Container(
        height: 500.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      // Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //   width: 500.0,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextFields(),
      //     ],
      //   ),
      // ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: 600.0,
        child: Center(child: TextFields()))
    ],
        ),
      );
    // return SingleChildScrollView(
    //       child: Container(
    //     child: _LoginDesktop(),
    //     // child: Responsive(
    //     //   mediumScreen: _LoginDesktop(),
    //     //   // smallScreen: _LoginMobile(),
    //     //   largeScreen: _LoginDesktop(),
    //     // ),
    //   ),
    // );
  }
}

// class _LoginMobile extends StatelessWidget {
//   const _LoginMobile({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               height: double.infinity,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                 image: ExactAssetImage('assets/imagelanding.jpeg'),
//                 fit: BoxFit.cover,
//               )),
//             ),
//             Container(
//               height: 500.0,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.black, Colors.transparent],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//             Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextFields(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _LoginDesktop extends StatelessWidget {
//   const _LoginDesktop({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//     children: [
//       Container(
//         child: Image(
//           image: AssetImage('assets/imagelanding.jpeg'),
//           height: double.infinity,
//           filterQuality: FilterQuality.high,
//           fit: BoxFit.cover,
//         ),
//       ),
//       Container(
//         height: 500.0,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.black, Colors.transparent],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//       ),
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         width: 500.0,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFields(),
//           ],
//         ),
//       ),
//     ],
//         ),
//       );
//   }
// }
