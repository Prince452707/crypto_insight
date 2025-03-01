// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'theme.dart'; // Assuming this contains your ThemeProvider class

// class ProfileScreen extends StatelessWidget {
//   Future<void> _signOut(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       print("User signed out successfully");
//       // After signing out, the auth state listener in CryptoExchangeApp will redirect to AuthScreen
//     } catch (e) {
//       print("Sign out failed: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to sign out: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () => _signOut(context),
//             tooltip: 'Sign Out',
//           ),
//         ],
//       ),
//       body: user == null
//           ? Center(child: Text('No user signed in'))
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Profile Picture
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: user.photoURL != null
//                         ? NetworkImage(user.photoURL!)
//                         : null,
//                     child: user.photoURL == null
//                         ? Icon(Icons.person, size: 50, color: Colors.grey)
//                         : null,
//                   ),
//                   SizedBox(height: 20),
//                   // Display Name
//                   Text(
//                     user.displayName ?? 'No display name',
//                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   SizedBox(height: 10),
//                   // Email
//                   Text(
//                     user.email ?? 'No email',
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           color: Colors.grey[700],
//                         ),
//                   ),
//                   SizedBox(height: 10),
//                   // Email Verification Status
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         user.emailVerified
//                             ? Icons.verified
//                             : Icons.warning_amber_rounded,
//                         color: user.emailVerified ? Colors.green : Colors.red,
//                         size: 20,
//                       ),
//                       SizedBox(width: 5),
//                       Text(
//                         user.emailVerified ? 'Email Verified' : 'Email Not Verified',
//                         style: TextStyle(
//                           color: user.emailVerified ? Colors.green : Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 30),
//                   // Theme Toggle
//                   Card(
//                     elevation: 2,
//                     child: ListTile(
//                       title: Text('Dark Mode'),
//                       trailing: Switch(
//                         value: themeProvider.isDarkMode,
//                         onChanged: (value) {
//                           themeProvider.toggleTheme();
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Sign Out Button (alternative to AppBar action)
//                   ElevatedButton.icon(
//                     onPressed: () => _signOut(context),
//                     icon: Icon(Icons.exit_to_app),
//                     label: Text('Sign Out'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.redAccent,
//                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
















// import 'package:crypto_insight/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   Future<void> _signOut(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       print("User signed out successfully");
//     } catch (e) {
//       print("Sign out failed: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to sign out: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () => _signOut(context),
//             tooltip: 'Sign Out',
//           ),
//         ],
//       ),
//       body: user == null
//           ? const Center(child: Text('No user signed in'))
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: user.photoURL != null
//                         ? NetworkImage(user.photoURL!)
//                         : null,
//                     child: user.photoURL == null
//                         ? Icon(Icons.person, size: 50, color: Colors.grey)
//                         : null,
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     user.displayName ?? 'No display name',
//                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     user.email ?? 'No email',
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           color: Colors.grey[700],
//                         ),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         user.emailVerified
//                             ? Icons.verified
//                             : Icons.warning_amber_rounded,
//                         color: user.emailVerified ? Colors.green : Colors.red,
//                         size: 20,
//                       ),
//                       SizedBox(width: 5),
//                       Text(
//                         user.emailVerified ? 'Email Verified' : 'Email Not Verified',
//                         style: TextStyle(
//                           color: user.emailVerified ? Colors.green : Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 30),
//                   Card(
//                     elevation: 2,
//                     child: ListTile(
//                       title: Text('Dark Mode'),
//                       trailing: Switch(
//                         value: themeProvider.isDarkMode,
//                         onChanged: (value) {
//                           themeProvider.toggleTheme();
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton.icon(
//                     onPressed: () => _signOut(context),
//                     icon: Icon(Icons.exit_to_app),
//                     label: Text('Sign Out'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.redAccent,
//                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }






















// import 'package:crypto_insight/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart'; // Add this dependency for date formatting

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   Future<void> _signOut(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       print("User signed out successfully");
//       Navigator.pushReplacementNamed(context, '/auth');
//     } catch (e) {
//       print("Sign out failed: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to sign out: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final theme = themeProvider.currentTheme;

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 200.0,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(
//                 user?.displayName ?? 'User',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   shadows: [Shadow(color: Colors.black45, blurRadius: 5)],
//                 ),
//               ),
//               background: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       theme.primaryColor.withOpacity(0.8),
//                       theme.scaffoldBackgroundColor,
//                     ],
//                   ),
//                 ),
//                 child: Center(
//                   child: CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 46,
//                       backgroundImage: user?.photoURL != null
//                           ? NetworkImage(user!.photoURL!)
//                           : null,
//                       child: user?.photoURL == null
//                           ? Icon(Icons.person, size: 50, color: Colors.grey)
//                           : null,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.logout),
//                 onPressed: () => _signOut(context),
//                 tooltip: 'Sign Out',
//               ),
//             ],
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (user == null)
//                     const Center(child: Text('No user signed in'))
//                   else ...[
//                     // User Info Card
//                     Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(Icons.email, color: theme.primaryColor),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                   child: Text(
//                                     user.email ?? 'No email',
//                                     style: theme.textTheme.bodyLarge,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 12),
//                             Row(
//                               children: [
//                                 Icon(
//                                   user.emailVerified
//                                       ? Icons.verified
//                                       : Icons.warning_amber_rounded,
//                                   color: user.emailVerified
//                                       ? Colors.green
//                                       : Colors.red,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   user.emailVerified
//                                       ? 'Email Verified'
//                                       : 'Email Not Verified',
//                                   style: TextStyle(
//                                     color: user.emailVerified
//                                         ? Colors.green
//                                         : Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 12),
//                             Row(
//                               children: [
//                                 Icon(Icons.date_range, color: theme.primaryColor),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   'Joined: ${user.metadata.creationTime != null ? DateFormat.yMMMd().format(user.metadata.creationTime!) : 'Unknown'}',
//                                   style: theme.textTheme.bodyLarge,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     // Theme Toggle Card
//                     Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: ListTile(
//                         leading: Icon(
//                           themeProvider.isDarkMode
//                               ? Icons.dark_mode
//                               : Icons.light_mode,
//                           color: theme.primaryColor,
//                         ),
//                         title: const Text('Dark Mode'),
//                         trailing: Switch(
//                           value: themeProvider.isDarkMode,
//                           onChanged: (value) {
//                             themeProvider.toggleTheme();
//                           },
//                           activeColor: theme.primaryColor,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     // Sign Out Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton.icon(
//                         onPressed: () => _signOut(context),
//                         icon: const Icon(Icons.exit_to_app),
//                         label: const Text('Sign Out'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
























// profile_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:crypto_insight/theme.dart'; // Ensure this matches your ThemeProvider

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (!snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/auth');
          });
          return const Scaffold(body: SizedBox.shrink());
        }
        return _ProfileScreenContent();
      },
    );
  }
}

class _ProfileScreenContent extends StatefulWidget {
  @override
  State<_ProfileScreenContent> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<_ProfileScreenContent> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User signed out successfully");
      Navigator.pushReplacementNamed(context, '/auth');
    } catch (e) {
      print("Sign out failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign out: $e')),
      );
    }
  }

  Future<void> _changePassword(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('No user signed in');

      final newPassword = _newPasswordController.text.trim();
      await user.updatePassword(newPassword);
      print("Password changed successfully");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated successfully')),
      );
      _newPasswordController.clear();
      _confirmPasswordController.clear();
      Navigator.pop(context); // Close dialog
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = _formatFirebaseError(e);
      });
      print('FirebaseAuthException: ${e.code} - ${e.message}');
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
      print('Unexpected error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  String _formatFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'requires-recent-login':
        return 'Please sign out and sign back in to change your password.';
      case 'weak-password':
        return 'Password must be at least 6 characters.';
      default:
        return e.message ?? 'An unexpected error occurred.';
    }
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text('Change Password'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a new password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    validator: (value) {
                      if (value != _newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  if (_errorMessage.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      _errorMessage,
                      style: TextStyle(
                          color: themeProvider.currentTheme.colorScheme.error),
                    ),
                  ],
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _isLoading ? null : () => _changePassword(context),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!; // Non-null due to StreamBuilder
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.0,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushReplacementNamed(context, '/search');
                }
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                user.displayName ?? 'User',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 5)],
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.primaryColor.withOpacity(0.8),
                      theme.scaffoldBackgroundColor,
                    ],
                  ),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 56,
                      backgroundImage: user.photoURL != null
                          ? NetworkImage(user.photoURL!)
                          : null,
                      child: user.photoURL == null
                          ? Icon(Icons.person, size: 60, color: Colors.grey)
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Account Details',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow(
                            icon: Icons.email,
                            label: 'Email',
                            value: user.email ?? 'No email',
                            theme: theme,
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow(
                            icon: user.emailVerified
                                ? Icons.verified
                                : Icons.warning_amber_rounded,
                            label: 'Verification',
                            value:
                                user.emailVerified ? 'Verified' : 'Not Verified',
                            textColor: user.emailVerified
                                ? Colors.green
                                : Colors.red,
                            theme: theme,
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow(
                            icon: Icons.date_range,
                            label: 'Joined',
                            value: user.metadata.creationTime != null
                                ? DateFormat.yMMMd()
                                    .format(user.metadata.creationTime!)
                                : 'Unknown',
                            theme: theme,
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow(
                            icon: Icons.login,
                            label: 'Last Sign-In',
                            value: user.metadata.lastSignInTime != null
                                ? DateFormat.yMMMd()
                                    .add_jm()
                                    .format(user.metadata.lastSignInTime!)
                                : 'Unknown',
                            theme: theme,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Stats',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor,
                            ),
                          ),
                          // const SizedBox(height: 16),
                          // _buildStatRow(
                          //   icon: Icons.bookmark,
                          //   label: 'Bookmarks',
                          //   value: '12', // Placeholder; replace with real data
                          //   theme: theme,
                          // ),
                          // const SizedBox(height: 12),
                          // _buildStatRow(
                          //   icon: Icons.school,
                          //   label: 'Lessons Completed',
                          //   value: '5', // Placeholder; replace with real data
                          //   theme: theme,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            themeProvider.isDarkMode
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            color: theme.primaryColor,
                          ),
                          title: const Text('Dark Mode'),
                          trailing: Switch(
                            value: themeProvider.isDarkMode,
                            onChanged: (value) {
                              themeProvider.toggleTheme();
                            },
                            activeColor: theme.primaryColor,
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.lock, color: theme.primaryColor),
                          title: const Text('Change Password'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () => _showChangePasswordDialog(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _signOut(context),
                      icon: const Icon(Icons.exit_to_app),
                      label: const Text('Sign Out'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? textColor,
    required ThemeData theme,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: theme.primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: textColor ?? Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatRow({
    required IconData icon,
    required String label,
    required String value,
    required ThemeData theme,
  }) {
    return Row(
      children: [
        Icon(icon, color: theme.primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }
}