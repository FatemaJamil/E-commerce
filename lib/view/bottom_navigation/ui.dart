//
//
// import 'package:flutter/material.dart';
//
//
//
//
//
// class HomeScreenPage extends StatefulWidget {
//   const HomeScreenPage({super.key});
//
//   @override
//   State<HomeScreenPage> createState() => _HomeScreenPageState();
// }
//
// class _HomeScreenPageState extends State<HomeScreenPage> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNav();
//   }
// }
//
//
// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});
//
//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }
//
// class _BottomNavState extends State<BottomNav> {
//   int _index = 0;
//
//
//   final List<Widget> _screens = [
//     NoteScreen(i:0),
//     FolderScreen(),
//     TrashScreen(),
//     SettingScreen(),
//   ];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor:Color(0xffeeee),
//       body: _screens[_index],
//
//       bottomNavigationBar: Container(
//         height: 70,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           border: Border(
//             top: BorderSide(
//               color: Colors.black,
//               width: 4.0,
//             ),
//
//           ),
//         ),
//         child: BottomNavigationBar(
//           currentIndex: _index,
//           onTap: (value) {
//             setState(() {
//               _index = value;
//             });
//           },
//
//           type: BottomNavigationBarType.fixed,
//
//
//           selectedItemColor: Colors.black,
//           unselectedItemColor: Colors.grey,
//
//
//           items: const [
//             // এখানে আইকনে কালার দেওয়ার দরকার নেই, কারণ selectedItemColor/unselectedItemColor সেটি নিয়ন্ত্রণ করবে।
//             BottomNavigationBarItem(
//               icon: Icon(Icons.note_add,color: Colors.black,), // কালার সরিয়ে দিলাম
//               label: "Note",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.folder_copy,color: Colors.blue),
//               label: "Folder",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.delete_forever,color: Colors.blue),
//               label: "Trash",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings,color: Colors.blue),
//               label: "Settings",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
// // 3. স্ক্রিন উইজেটগুলি (StatelessWidget হিসেবে তৈরি করা হলো)
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("", style: TextStyle(fontSize: 24,color: Colors.lightBlueAccent)));
//   }
// }
//
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("", style: TextStyle(fontSize: 24)));
//   }
// }
//
// class AddNoteScreen extends StatelessWidget {
//   const AddNoteScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("", style: TextStyle(fontSize: 24)));
//   }
// }
//
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("", style: TextStyle(fontSize: 24)));
//   }
// }