// import 'package:flutter/material.dart';
// import 'package:emairie_agent/theme.dart';

// class AProductCard extends StatelessWidget {
//   // final SvgPicture pictureAsset;
//   // TODO generalize with child property
//   // final String pictureAsset;
//   final Widget child;
//   final String title;
//   // final double price;
//   final int price;
//   final int rightSideFlex;
//   final int leftSideFlex;
//   final String subtitle;
//   final String buttonText;
//   final Color buttonColor;
//   final Color backgroundColor;
//   final Color rightSideBackgroundColor;
//   final Function onTap;
//   final bool withoutButton;
//   final EdgeInsets cardMargin;
//   final double borderRadius;
//   final double leftSideHeight;
//   final double leftSideWidth;

//   const AProductCard({
//     @required this.child,
//     @required this.title,
//     @required this.subtitle,
//     this.leftSideFlex = 2,
//     this.rightSideFlex = 3,
//     this.price,
//     // this.pictureAsset = "assets/img/logo.svg",
//     this.buttonText = "acheter",
//     this.backgroundColor = Colors.white,
//     this.rightSideBackgroundColor = Colors.white,
//     this.buttonColor,
//     this.cardMargin,
//     this.borderRadius,
//     this.leftSideHeight = 100,
//     this.leftSideWidth = 100,
//     this.withoutButton = false,
//     @required this.onTap,
//     // normally required
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//     color: backgroundColor,
//     borderRadius: BorderRadius.circular(borderRadius ?? 5),
//         ),
//         margin: cardMargin ?? EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//         child: Flex(
//     direction: Axis.horizontal,
//     // crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: [
//       // leftSide
//       Expanded(
//         flex: leftSideFlex,
//         child: Container(
//           height: leftSideHeight,
//           width: leftSideWidth,
//           padding: EdgeInsets.all(3),
//           child: child,
//         ),
//       ),
//       // rightSide
//       Expanded(
//           flex: rightSideFlex,
//           child: Container(
//             decoration: BoxDecoration(
//               color: rightSideBackgroundColor,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(borderRadius ?? 5),
//                 bottomRight: Radius.circular(borderRadius ?? 5),
//               ),
//             ),
//             // padding: EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 5),
//             padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//             child: Flex(
//               direction: Axis.vertical,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 // Bundle Title
//                 Text(
//                   title.toUpperCase(),
//                   style:
//                       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 // Prix
//                 Text(
//                   "$price Frcs",
//                   style: TextStyle(
//                     color: appPrimary,
//                     fontSize: 19,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 // Description
//                 Text(
//                   subtitle ?? "Carburant Illimité / Mois",
//                   style: TextStyle(
//                     // fontSize: 21,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 // Buton
//                 Container(
//                   width: double.infinity,
//                   child: Opacity(
//                     // opacity: withoutButton ? 0 : 1,
//                     opacity: 1,
//                     child: withoutButton
//                         ? RaisedButton(
//                             color: appPrimary,
//                             textColor: Colors.white,
//                             onPressed: null,
//                             disabledColor: appPrimary,
//                             disabledTextColor: Colors.white,
//                             child: Row(
//                                 // mainAxisAlignment:
//                                 //     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Icon(Icons.check),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     "Selectionné".toUpperCase(),
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ]),
//                           )
//                         : RaisedButton(
//                             color: appPrimary,
//                             textColor: Colors.white,
//                             onPressed: onTap,
//                             child: Text(
//                               buttonText.toUpperCase(),
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     ],
//         ),
//       );
//   }
// }
