// import 'package:flutter/material.dart';

// class AppDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//             ),
//             child: const Text(
//               'Crypto Insights',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.home),
//             title: const Text('Home'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.pushReplacementNamed(context, '/dashboard');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.person_pin),
//             title: const Text('Profile'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.pushReplacementNamed(context, '/profile');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.school),
//             title: const Text('AI Learning'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.pushNamed(context, '/learning');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.pushNamed(context, '/settings');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



















import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Crypto Insights',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/search');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_pin),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Bookmarks'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/bookmarks');
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('AI Learning'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/learning');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/help');
            },
          ),
        ],
      ),
    );
  }
}