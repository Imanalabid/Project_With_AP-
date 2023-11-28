// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class CartList extends StatelessWidget {
//   final bool isLoggedIn;

//   const CartList({Key? key, required this.isLoggedIn}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: isLoggedIn ? buildCartList() : buildLoginPage(),
//     );
//   }

//   Widget buildCartList() {
//     return Center(
//       child: Text(
//         'Cart List',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget buildLoginPage() {
//     return Center(
//       child: Text(
//         'Please log in to view the cart list',
//         style: TextStyle(fontSize: 18),
//       ),
//     );
//   }
// }
