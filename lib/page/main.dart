// import 'package:flutter/material.dart';
// import 'package:final_project/shop_page.dart';
// import 'package:final_project/promo_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.grey,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const ShopPage(),
//         'cart_page': (context) => const CartPage(),
//         'notification_page': (context) => const NotificationPage(),
//         'promo_page': (context) => const PromoPage(),
//         'question_page': (context) => const QuestionPage(),
//         'aboutus_page': (context) => const AboutUsPage(),
//       },
//     );
//   }
// }

// class CartPage extends StatelessWidget {
//   const CartPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart Page'),
//       ),
//       body: const Column(
//         children:[
//           Text('Your cart content goes here'),
//         ] ,
//       ),
//     );
//   }
// }

// class NotificationPage extends StatelessWidget {
//   const NotificationPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notification'),
//       ),
//       body: const Center(
//         child: Text(''),
//       ),
//     );
//   }
// }

// class PromoPage extends StatelessWidget {
//   const PromoPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Promo'),
//       ),
//     );
//   }
// }

// //  Mybutton(
// //     onTap() {
// //       Navigator.pushNamed(context, '/promopage');
// //     }
// //   )

// class QuestionPage extends StatelessWidget {
//   const QuestionPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FAQ Page'),
//       ),
//       body: const Center(
//         child: Text('Your question goes here'),
//       ),
//     );
//   }
// }

// class AboutUsPage extends StatelessWidget {
//   const AboutUsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('About Us Page'),
//       ),
//       body: const Center(
//         child: Text('Your content goes here'),
//       ),
//     );
//   }
// }