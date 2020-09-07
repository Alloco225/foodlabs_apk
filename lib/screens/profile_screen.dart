// import 'package:emairie_agent/routes.dart';
// import 'package:emairie_agent/utils/theme.dart';
// import 'package:emairie_agent/providers/Agent.dart';
// import 'package:flutter/material.dart';

// class UserProfileTab extends StatefulWidget {
//   final Agent agent;
//   UserProfileTab(this.agent);

//   @override
//   _UserProfileTabState createState() => _UserProfileTabState();
// }

// class _UserProfileTabState extends State<UserProfileTab> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           // User Tab Card
//           _buildUserTabCard(),
//         ],
//       ),
//     );
//   }

//   Expanded _buildUserTabCard() {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//         ),
//         padding: EdgeInsets.all(20),
//         margin: EdgeInsets.only(top: 20),
//         child: Column(
//           children: [
//             // AppBar
//             buildAppBar(),
//             // User Account Card Container
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                       color: Colors.grey[300],
//                     ),
//                   ],
//                 ),
//                 margin: EdgeInsets.only(top: 10),
//                 // child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     //  User Basic Info ListTile
//                     _buildUserBasicInfos(),
//                     //
//                     Divider(
//                       height: 0,
//                       thickness: 1.3,
//                     ),
//                     // Classic User Things

//                     // Free Space
//                     Expanded(child: Container()),
//                     // TODO fill with correct tiles
//                     // Expanded(child: AContainer404()),

//                     // Réglages ListTile
//                     ListTile(
//                       leading: Icon(Icons.settings),
//                       title: Text("Réglages"),
//                     ),
//                     // About ListTile
//                     AboutListTile(
//                       // icon: Image.asset("images/logo.png"),
//                       icon: Icon(Icons.info),
//                       applicationVersion: "1.1",
//                       applicationName: "Emairie",
//                       applicationIcon: Container(
//                         height: 50,
//                         width: 50,
//                         child: Image.asset("images/logo.png"),
//                       ),
//                       aboutBoxChildren: [
//                         ListTile(
//                           title: Text("Adjemin"),
//                           subtitle: Text("Company"),
//                         ),
//                         ListTile(
//                           title: Text("Amane Hosanna, Ben-Imad Kouakan"),
//                           subtitle: Text("Authors"),
//                         ),
//                       ],
//                     ),

//                     // AboutListTile
//                     Divider(
//                       height: 0,
//                       thickness: 1.3,
//                     ),
//                     //
//                     //
//                     Expanded(
//                       flex: 0,
//                       child: ListTile(
//                         leading: Icon(
//                           Icons.exit_to_app,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                         title: Text(
//                           "Déconnexion",
//                           style:
//                               TextStyle(color: Theme.of(context).primaryColor),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Container buildAppBar() {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Mon Compte",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   ListTile _buildUserBasicInfos() {
//     return ListTile(
//       leading: CircleAvatar(
//         // child: Text("SZ"),
//         radius: 30,
        
//         backgroundColor: Colors.white,
//         // backgroundImage: AssetImage("images/logo.png"),
//         backgroundImage: widget.agent.photoUrl== null ? AssetImage("images/logo.png"): NetworkImage(widget.agent?.photoUrl),
//       ),
//       title: Text(
//         // "Amane Hosanna",
//         widget.agent.name,
//         style: TextStyle(
//           fontSize: 19,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       subtitle: Text(
//         "Emairie",
//         style: TextStyle(
//           fontSize: 16,
//         ),
//       ),
//       trailing: IconButton(
//         icon: Icon(Icons.edit),
//         onPressed: () {
//           // TODO User Profile Infos Modif
//         },
//       ),
//       // trailing: Text("-\$800"),
//     );
//   }
// }
