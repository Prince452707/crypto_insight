// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'theme.dart'; // Assuming this is your theme provider file

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLogin = true; // Toggle between login and signup
//   String _errorMessage = '';

//   // Email/Password Authentication
//   Future<void> _authenticate() async {
//     try {
//       if (_isLogin) {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//       } else {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//       }
//       Navigator.pushReplacementNamed(context, '/'); // Redirect to home (SearchScreen)
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         _errorMessage = e.message ?? 'An error occurred';
//       });
//     }
//   }

//   // Google Sign-In
//   Future<void> _signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) return; // User canceled Google Sign-In

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);
//       Navigator.pushReplacementNamed(context, '/'); // Redirect to home
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Google Sign-In failed: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_isLogin ? 'Login' : 'Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 10),
//             if (_errorMessage.isNotEmpty)
//               Text(
//                 _errorMessage,
//                 style: TextStyle(color: Colors.red),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _authenticate,
//               child: Text(_isLogin ? 'Login' : 'Sign Up'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: _signInWithGoogle,
//               icon: Icon(Icons.g_mobiledata), // Google icon
//               label: Text('Sign ${_isLogin ? 'In' : 'Up'} with Google'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _isLogin = !_isLogin;
//                   _errorMessage = '';
//                 });
//               },
//               child: Text(_isLogin
//                   ? 'Need an account? Sign Up'
//                   : 'Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }











// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'theme.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLogin = true;
//   String _errorMessage = '';

//   Future<void> _authenticate() async {
//     try {
//       if (_isLogin) {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         print("Signed in with email/password");
//       } else {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         print("Signed up with email/password");
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         _errorMessage = e.message ?? 'An error occurred';
//       });
//       print("Email auth error: $e");
//     }
//   }

//   Future<void> _signInWithGoogle() async {
//     try {
//       print("Starting Google Sign-In");
//       final GoogleSignIn googleSignIn = GoogleSignIn(
//         scopes: ['email'],
//         signInOption: SignInOption.standard, // Force manual account selection
//       );
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       if (googleUser == null) {
//         print("Google Sign-In canceled by user");
//         return;
//       }
//       print("Google user signed in: ${googleUser.email}");
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       print("Firebase signed in with Google credential");
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Google Sign-In failed: $e';
//       });
//       print("Google Sign-In error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_isLogin ? 'Login' : 'Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 10),
//             if (_errorMessage.isNotEmpty)
//               Text(
//                 _errorMessage,
//                 style: TextStyle(color: Colors.red),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _authenticate,
//               child: Text(_isLogin ? 'Login' : 'Sign Up'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: _signInWithGoogle,
//               icon: Icon(Icons.g_mobiledata),
//               label: Text('Sign ${_isLogin ? 'In' : 'Up'} with Google'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _isLogin = !_isLogin;
//                   _errorMessage = '';
//                 });
//               },
//               child: Text(_isLogin
//                   ? 'Need an account? Sign Up'
//                   : 'Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'theme.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLogin = true;
//   String _errorMessage = '';
//   bool _isLoading = false;
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   Future<void> _authenticate() async {
//     setState(() => _isLoading = true);
//     try {
//       if (_isLogin) {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         print("Signed in with email/password");
//       } else {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         print("Signed up with email/password");
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         _errorMessage = e.message ?? 'An error occurred';
//       });
//       print("Email auth error: $e");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _signInWithGoogle() async {
//     setState(() => _isLoading = true);
//     try {
//       print("Starting Google Sign-In");
//       final GoogleSignIn googleSignIn = GoogleSignIn(
//         scopes: ['email'],
//         signInOption: SignInOption.standard,
//       );
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       if (googleUser == null) {
//         print("Google Sign-In canceled by user");
//         return;
//       }
//       print("Google user signed in: ${googleUser.email}");
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       print("Firebase signed in with Google credential");
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Google Sign-In failed: $e';
//       });
//       print("Google Sign-In error: $e");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final isDarkMode = themeProvider.isDarkMode;

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: isDarkMode
//                 ? [Colors.grey[900]!, Colors.grey[800]!]
//                 : [Colors.blueGrey[50]!, Colors.white],
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: Center(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Logo or Title
//                     Icon(
//                       Icons.currency_bitcoin,
//                       size: 80,
//                       color: isDarkMode ? Colors.amber : Colors.blueGrey,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Crypto Insight',
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: isDarkMode ? Colors.white : Colors.blueGrey[900],
//                       ),
//                     ),
//                     SizedBox(height: 40),
//                     // Form Card
//                     Card(
//                       elevation: 8,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               _isLogin ? 'Welcome Back' : 'Join Us',
//                               style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                             ),
//                             SizedBox(height: 20),
//                             TextField(
//                               controller: _emailController,
//                               decoration: InputDecoration(
//                                 labelText: 'Email',
//                                 prefixIcon: Icon(Icons.email),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               keyboardType: TextInputType.emailAddress,
//                             ),
//                             SizedBox(height: 16),
//                             TextField(
//                               controller: _passwordController,
//                               decoration: InputDecoration(
//                                 labelText: 'Password',
//                                 prefixIcon: Icon(Icons.lock),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               obscureText: true,
//                             ),
//                             SizedBox(height: 16),
//                             if (_errorMessage.isNotEmpty)
//                               Text(
//                                 _errorMessage,
//                                 style: TextStyle(color: Colors.redAccent, fontSize: 14),
//                                 textAlign: TextAlign.center,
//                               ),
//                             SizedBox(height: 20),
//                             _isLoading
//                                 ? CircularProgressIndicator()
//                                 : ElevatedButton(
//                                     onPressed: _authenticate,
//                                     style: ElevatedButton.styleFrom(
//                                       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       backgroundColor: isDarkMode ? Colors.amber : Colors.blueGrey,
//                                     ),
//                                     child: Text(
//                                       _isLogin ? 'Login' : 'Sign Up',
//                                       style: TextStyle(fontSize: 16, color: Colors.white),
//                                     ),
//                                   ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     // Google Sign-In Button
//                     _isLoading
//                         ? SizedBox.shrink()
//                         : OutlinedButton.icon(
//                             onPressed: _signInWithGoogle,
//                             icon: Icon(Icons.g_mobiledata, color: Colors.blue),
//                             label: Text(
//                               'Sign ${_isLogin ? 'In' : 'Up'} with Google',
//                               style: TextStyle(
//                                 color: isDarkMode ? Colors.white : Colors.blueGrey[800],
//                                 fontSize: 16,
//                               ),
//                             ),
//                             style: OutlinedButton.styleFrom(
//                               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               side: BorderSide(color: isDarkMode ? Colors.amber : Colors.blueGrey),
//                             ),
//                           ),
//                     SizedBox(height: 20),
//                     // Toggle Login/Sign-Up
//                     TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _isLogin = !_isLogin;
//                           _errorMessage = '';
//                         });
//                       },
//                       child: Text(
//                         _isLogin ? 'Need an account? Sign Up' : 'Already have an account? Login',
//                         style: TextStyle(
//                           color: isDarkMode ? Colors.amber : Colors.blueGrey[700],
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'theme.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLogin = true;
//   String _errorMessage = '';
//   bool _isLoading = false;
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   Future<void> _authenticate() async {
//     setState(() => _isLoading = true);
//     try {
//       if (_isLogin) {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         print("Signed in with email/password");
//       } else {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         print("Signed up with email/password");
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         _errorMessage = e.message ?? 'An error occurred';
//       });
//       print("Email auth error: $e");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _signInWithGoogle() async {
//     setState(() => _isLoading = true);
//     try {
//       print("Starting Google Sign-In");
//       final GoogleSignIn googleSignIn = GoogleSignIn(
//         scopes: ['email'],
//         signInOption: SignInOption.standard,
//       );
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       if (googleUser == null) {
//         print("Google Sign-In canceled by user");
//         return;
//       }
//       print("Google user signed in: ${googleUser.email}");
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       print("Firebase signed in with Google credential");
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Google Sign-In failed: $e';
//       });
//       print("Google Sign-In error: $e");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               themeProvider.currentTheme.primaryColor.withOpacity(0.1),
//               themeProvider.currentTheme.scaffoldBackgroundColor,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: Center(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Logo and Title
//                     Icon(
//                       Icons.currency_bitcoin,
//                       size: 80,
//                       color: themeProvider.currentTheme.primaryColor,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Crypto Insight',
//                       style: themeProvider.currentTheme.textTheme.headlineMedium?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 40),
//                     // Form Card
//                     Card(
//                       elevation: 8,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               _isLogin ? 'Welcome Back' : 'Join Us',
//                               style: themeProvider.currentTheme.textTheme.headlineSmall?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             TextField(
//                               controller: _emailController,
//                               decoration: InputDecoration(
//                                 labelText: 'Email',
//                                 prefixIcon: Icon(Icons.email),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               keyboardType: TextInputType.emailAddress,
//                             ),
//                             SizedBox(height: 16),
//                             TextField(
//                               controller: _passwordController,
//                               decoration: InputDecoration(
//                                 labelText: 'Password',
//                                 prefixIcon: Icon(Icons.lock),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               obscureText: true,
//                             ),
//                             SizedBox(height: 16),
//                             if (_errorMessage.isNotEmpty)
//                               Text(
//                                 _errorMessage,
//                                 style: themeProvider.currentTheme.textTheme.bodySmall?.copyWith(
//                                   color: themeProvider.currentTheme.colorScheme.error,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             SizedBox(height: 20),
//                             _isLoading
//                                 ? CircularProgressIndicator(
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       themeProvider.currentTheme.primaryColor,
//                                     ),
//                                   )
//                                 : ElevatedButton(
//                                     onPressed: _authenticate,
//                                     style: ElevatedButton.styleFrom(
//                                       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                     ),
//                                     child: Text(
//                                       _isLogin ? 'Login' : 'Sign Up',
//                                       style: themeProvider.currentTheme.textTheme.labelLarge?.copyWith(
//                                         color: themeProvider.currentTheme.colorScheme.onPrimary,
//                                       ),
//                                     ),
//                                   ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     _isLoading
//                         ? SizedBox.shrink()
//                         : OutlinedButton.icon(
//                             onPressed: _signInWithGoogle,
//                             icon: Icon(Icons.g_mobiledata, color: themeProvider.currentTheme.primaryColor),
//                             label: Text(
//                               'Sign ${_isLogin ? 'In' : 'Up'} with Google',
//                               style: themeProvider.currentTheme.textTheme.labelLarge,
//                             ),
//                             style: OutlinedButton.styleFrom(
//                               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//                     SizedBox(height: 20),
//                     TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _isLogin = !_isLogin;
//                           _errorMessage = '';
//                         });
//                       },
//                       child: Text(
//                         _isLogin ? 'Need an account? Sign Up' : 'Already have an account? Login',
//                         style: themeProvider.currentTheme.textTheme.bodyMedium?.copyWith(
//                           color: themeProvider.currentTheme.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'theme.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({Key? key}) : super(key: key);

//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLogin = true;
//   String _errorMessage = '';
//   bool _isLoading = false;
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   Future<void> _authenticate() async {
//     if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//       setState(() => _errorMessage = 'Please fill in all fields');
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       UserCredential userCredential;
//       if (_isLogin) {
//         userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         print("Signed in with email/password: ${userCredential.user?.email}");
//       } else {
//         userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         print("Signed up with email/password: ${userCredential.user?.email}");
//       }
//       _navigateToSearchScreen(context);
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         _errorMessage = _formatFirebaseError(e);
//       });
//       print("Email auth error: ${e.code} - ${e.message}");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _signInWithGoogle() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       print("Starting Google Sign-In");
//       final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
//       await googleSignIn.signOut(); // Clear previous session for fresh sign-in

//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       if (googleUser == null) {
//         setState(() => _errorMessage = 'Google Sign-In was canceled');
//         print("Google Sign-In canceled by user");
//         return;
//       }

//       print("Google user signed in: ${googleUser.email}");
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       if (googleAuth.accessToken == null || googleAuth.idToken == null) {
//         throw Exception('Google authentication tokens are null');
//       }

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       print("Firebase signed in with Google: ${userCredential.user?.email}");
//       _navigateToSearchScreen(context);
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Google Sign-In failed: ${e.toString()}';
//       });
//       print("Google Sign-In error: $e");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   void _navigateToSearchScreen(BuildContext context) {
//     Navigator.pushReplacementNamed(context, '/search');
//   }

//   String _formatFirebaseError(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'user-not-found':
//         return 'No user found with this email.';
//       case 'wrong-password':
//         return 'Incorrect password.';
//       case 'email-already-in-use':
//         return 'This email is already registered.';
//       case 'invalid-email':
//         return 'Invalid email format.';
//       case 'weak-password':
//         return 'Password should be at least 6 characters.';
//       default:
//         return e.message ?? 'An error occurred. Please try again.';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               themeProvider.currentTheme.primaryColor.withOpacity(0.1),
//               themeProvider.currentTheme.scaffoldBackgroundColor,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: Center(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.currency_bitcoin,
//                       size: 80,
//                       color: themeProvider.currentTheme.primaryColor,
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       'Crypto Insight',
//                       style:
//                           themeProvider.currentTheme.textTheme.headlineMedium?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: themeProvider.currentTheme.primaryColor,
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     Card(
//                       elevation: 8,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(24.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               _isLogin ? 'Welcome Back' : 'Join Us',
//                               style: themeProvider.currentTheme.textTheme.headlineSmall
//                                   ?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                                 color: themeProvider.currentTheme.primaryColorDark,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             TextField(
//                               controller: _emailController,
//                               decoration: InputDecoration(
//                                 labelText: 'Email',
//                                 prefixIcon: const Icon(Icons.email, color: Colors.grey),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide: BorderSide(
//                                     color: themeProvider.currentTheme.primaryColor,
//                                     width: 2,
//                                   ),
//                                 ),
//                               ),
//                               keyboardType: TextInputType.emailAddress,
//                             ),
//                             const SizedBox(height: 16),
//                             TextField(
//                               controller: _passwordController,
//                               decoration: InputDecoration(
//                                 labelText: 'Password',
//                                 prefixIcon: const Icon(Icons.lock, color: Colors.grey),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide: BorderSide(
//                                     color: themeProvider.currentTheme.primaryColor,
//                                     width: 2,
//                                   ),
//                                 ),
//                               ),
//                               obscureText: true,
//                             ),
//                             const SizedBox(height: 16),
//                             if (_errorMessage.isNotEmpty)
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 8.0),
//                                 child: Text(
//                                   _errorMessage,
//                                   style: themeProvider.currentTheme.textTheme.bodySmall
//                                       ?.copyWith(
//                                     color:
//                                         themeProvider.currentTheme.colorScheme.error,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             const SizedBox(height: 20),
//                             _isLoading
//                                 ? CircularProgressIndicator(
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       themeProvider.currentTheme.primaryColor,
//                                     ),
//                                   )
//                                 : ElevatedButton(
//                                     onPressed: _authenticate,
//                                     style: ElevatedButton.styleFrom(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 40, vertical: 14),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       backgroundColor:
//                                           themeProvider.currentTheme.primaryColor,
//                                     ),
//                                     child: Text(
//                                       _isLogin ? 'Login' : 'Sign Up',
//                                       style: themeProvider
//                                           .currentTheme.textTheme.labelLarge
//                                           ?.copyWith(
//                                         color: themeProvider
//                                             .currentTheme.colorScheme.onPrimary,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     _isLoading
//                         ? const SizedBox.shrink()
//                         : OutlinedButton.icon(
//                             onPressed: _signInWithGoogle,
//                             icon: const Icon(Icons.g_mobiledata, size: 28),
//                             label: Text(
//                               'Sign ${_isLogin ? 'In' : 'Up'} with Google',
//                               style: themeProvider.currentTheme.textTheme.labelLarge
//                                   ?.copyWith(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             style: OutlinedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 30, vertical: 14),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               side: BorderSide(
//                                 color: themeProvider.currentTheme.primaryColor,
//                               ),
//                             ),
//                           ),
//                     const SizedBox(height: 20),
//                     TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _isLogin = !_isLogin;
//                           _errorMessage = '';
//                           _emailController.clear();
//                           _passwordController.clear();
//                         });
//                       },
//                       child: Text(
//                         _isLogin
//                             ? 'Need an account? Sign Up'
//                             : 'Already have an account? Login',
//                         style:
//                             themeProvider.currentTheme.textTheme.bodyMedium?.copyWith(
//                           color: themeProvider.currentTheme.primaryColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'theme.dart'; // Assuming this contains ThemeProvider

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
//   // Controllers
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();

//   // State variables
//   bool _isLogin = true;
//   bool _isLoading = false;
//   bool _obscurePassword = true;
//   String _errorMessage = '';

//   // Animation
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   // Authentication methods
//   Future<void> _authenticate() async {
//     if (!_validateInputs()) return;

//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final email = _emailController.text.trim();
//       final password = _passwordController.text.trim();

//       if (_isLogin) {
//         List<String> signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//         if (signInMethods.isEmpty) throw Exception('No account found with this email');

//         final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         if (!userCredential.user!.emailVerified) {
//           await userCredential.user!.sendEmailVerification();
//           await FirebaseAuth.instance.signOut();
//           throw Exception('Please verify your email before logging in');
//         }
//         _navigateToNextScreen();
//       } else {
//         List<String> signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//         if (signInMethods.isNotEmpty) throw Exception('This email is already registered');

//         final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         await userCredential.user!.updateDisplayName(
//           '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
//         );
//         await userCredential.user!.sendEmailVerification();
//         await FirebaseAuth.instance.signOut();
//         setState(() {
//           _isLogin = true; // Switch back to login mode
//           _errorMessage = 'Verification email sent. Please check your inbox.';
//         });
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() => _errorMessage = _formatFirebaseError(e));
//     } catch (e) {
//       setState(() => _errorMessage = e.toString());
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _signInWithGoogle() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final googleSignIn = GoogleSignIn(scopes: ['email']);
//       await googleSignIn.signOut(); // Clear previous session
//       final googleUser = await googleSignIn.signIn();

//       if (googleUser == null) throw Exception('Google Sign-In cancelled');

//       final googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);
//       _navigateToNextScreen();
//     } catch (e) {
//       setState(() => _errorMessage = e.toString());
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _resetPassword() async {
//     if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
//       setState(() => _errorMessage = 'Please enter a valid email');
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
//       setState(() => _errorMessage = 'Password reset email sent. Check your inbox.');
//     } catch (e) {
//       setState(() => _errorMessage = 'Error sending reset email: ${e.toString()}');
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   // Validation
//   bool _validateInputs() {
//     if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//       setState(() => _errorMessage = 'Email and password are required');
//       return false;
//     }
//     if (!_isLogin && (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty)) {
//       setState(() => _errorMessage = 'First and last names are required');
//       return false;
//     }
//     if (!_emailController.text.contains('@') || !_emailController.text.contains('.')) {
//       setState(() => _errorMessage = 'Please enter a valid email');
//       return false;
//     }
//     if (_passwordController.text.length < 6) {
//       setState(() => _errorMessage = 'Password must be at least 6 characters');
//       return false;
//     }
//     return true;
//   }

//   void _navigateToNextScreen() {
//     Navigator.pushReplacementNamed(context, '/search');
//   }

//   String _formatFirebaseError(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'user-not-found': return 'No user found with this email.';
//       case 'wrong-password': return 'Incorrect password.';
//       case 'email-already-in-use': return 'This email is already registered.';
//       case 'invalid-email': return 'Invalid email format.';
//       case 'weak-password': return 'Password must be at least 6 characters.';
//       default: return e.message ?? 'An error occurred. Please try again.';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               themeProvider.currentTheme.primaryColor.withOpacity(0.2),
//               themeProvider.currentTheme.scaffoldBackgroundColor,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 children: [
//                   // Header
//                   Icon(Icons.currency_bitcoin, size: 80, color: themeProvider.currentTheme.primaryColor),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Crypto Insight',
//                     style: themeProvider.currentTheme.textTheme.headlineMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: themeProvider.currentTheme.primaryColor,
//                     ),
//                   ),
//                   const SizedBox(height: 32),

//                   // Auth Card
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(24.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             _isLogin ? 'Welcome Back' : 'Create Account',
//                             style: themeProvider.currentTheme.textTheme.headlineSmall?.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 24),

//                           // Registration fields
//                           if (!_isLogin) ...[
//                             _buildTextField(_firstNameController, 'First Name', Icons.person),
//                             const SizedBox(height: 16),
//                             _buildTextField(_lastNameController, 'Last Name', Icons.person),
//                             const SizedBox(height: 16),
//                           ],

//                           // Common fields
//                           _buildTextField(
//                             _emailController,
//                             'Email',
//                             Icons.email,
//                             keyboardType: TextInputType.emailAddress,
//                           ),
//                           const SizedBox(height: 16),
//                           _buildTextField(
//                             _passwordController,
//                             'Password',
//                             Icons.lock,
//                             obscureText: _obscurePassword,
//                             suffixIcon: IconButton(
//                               icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
//                               onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
//                             ),
//                           ),
//                           const SizedBox(height: 16),

//                           // Error message
//                           if (_errorMessage.isNotEmpty)
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 8.0),
//                               child: Text(
//                                 _errorMessage,
//                                 style: TextStyle(color: themeProvider.currentTheme.colorScheme.error),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),

//                           // Forgot Password
//                           if (_isLogin)
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: TextButton(
//                                 onPressed: _resetPassword,
//                                 child: Text(
//                                   'Forgot Password?',
//                                   style: TextStyle(color: themeProvider.currentTheme.primaryColor),
//                                 ),
//                               ),
//                             ),

//                           // Main button
//                           const SizedBox(height: 24),
//                           _isLoading
//                               ? const CircularProgressIndicator()
//                               : ElevatedButton(
//                                   onPressed: _authenticate,
//                                   style: ElevatedButton.styleFrom(
//                                     minimumSize: const Size(double.infinity, 50),
//                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                                   ),
//                                   child: Text(_isLogin ? 'Login' : 'Sign Up'),
//                                 ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   // Google Sign-In
//                   const SizedBox(height: 16),
//                   if (!_isLoading)
//                     OutlinedButton.icon(
//                       onPressed: _signInWithGoogle,
//                       icon: const Icon(Icons.g_mobiledata, size: 24),
//                       label: Text('Continue with Google'),
//                       style: OutlinedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       ),
//                     ),

//                   // Toggle auth mode
//                   const SizedBox(height: 16),
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _isLogin = !_isLogin;
//                         _errorMessage = '';
//                         _emailController.clear();
//                         _passwordController.clear();
//                         _firstNameController.clear();
//                         _lastNameController.clear();
//                       });
//                     },
//                     child: Text(
//                       _isLogin ? 'Need an account? Sign Up' : 'Have an account? Login',
//                       style: TextStyle(color: themeProvider.currentTheme.primaryColor),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     TextEditingController controller,
//     String label,
//     IconData icon, {
//     TextInputType keyboardType = TextInputType.text,
//     bool obscureText = false,
//     Widget? suffixIcon,
//   }) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon),
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         filled: true,
//         fillColor: Colors.grey[100],
//       ),
//     );
//   }
// }






















// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'theme.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen>
//     with SingleTickerProviderStateMixin {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   Timer? _debounce;

//   bool _isLogin = true;
//   bool _isAuthLoading = false;
//   bool _isGoogleLoading = false;
//   bool _isResetLoading = false;
//   bool _obscurePassword = true;
//   String _errorMessage = '';

//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );
//     _animationController.forward();

//     FirebaseAuth.instance.authStateChanges().listen((user) {
//       if (user != null && user.emailVerified && mounted) {
//         Navigator.pushReplacementNamed(context, '/search');
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _debounce?.cancel();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   Future<void> _authenticate() async {
//     if (!_validateInputs()) return;

//     setState(() {
//       _isAuthLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final email = _emailController.text.trim();
//       final password = _passwordController.text.trim();

//       if (_isLogin) {
//         List<String> signInMethods =
//             await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//         if (signInMethods.isEmpty) {
//           throw Exception('No account found with this email. Please sign up.');
//         }
//         if (!signInMethods.contains('password')) {
//           throw Exception(
//               'This email is registered with Google. Use "Continue with Google" instead.');
//         }

//         final userCredential =
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         if (!userCredential.user!.emailVerified) {
//           await userCredential.user!.sendEmailVerification();
//           await FirebaseAuth.instance.signOut();
//           throw Exception('Please verify your email before logging in.');
//         }
//       } else {
//         List<String> signInMethods =
//             await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//         if (signInMethods.isNotEmpty) {
//           throw Exception('This email is already registered. Please log in.');
//         }

//         final userCredential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         await userCredential.user!.updateDisplayName(
//           '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
//         );
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user!.uid)
//             .set({
//           'email': email,
//           'displayName':
//               '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//         await userCredential.user!.sendEmailVerification();
//         await FirebaseAuth.instance.signOut();
//         setState(() {
//           _isLogin = true;
//           _errorMessage = 'Account created! Please verify your email and log in.';
//         });
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() => _errorMessage = _formatFirebaseError(e));
//     } catch (e) {
//       setState(() => _errorMessage = e.toString());
//     } finally {
//       setState(() => _isAuthLoading = false);
//     }
//   }

//   void _authenticateWithDebounce() {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(const Duration(milliseconds: 300), _authenticate);
//   }

//   Future<void> _signInWithGoogle() async {
//     setState(() {
//       _isGoogleLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
//       await googleSignIn.signOut();
//       final googleUser = await googleSignIn.signIn();

//       if (googleUser == null) throw Exception('Google Sign-In cancelled');

//       final googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (e) {
//       setState(() => _errorMessage = e.toString());
//     } finally {
//       setState(() => _isGoogleLoading = false);
//     }
//   }

//   Future<void> _resetPassword() async {
//     if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
//       setState(() => _errorMessage = 'Please enter a valid email');
//       return;
//     }

//     setState(() {
//       _isResetLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       await FirebaseAuth.instance
//           .sendPasswordResetEmail(email: _emailController.text.trim());
//       if (mounted) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Success'),
//             content: const Text('Password reset email sent. Check your inbox.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     } catch (e) {
//       setState(() => _errorMessage = 'Error sending reset email: ${e.toString()}');
//     } finally {
//       setState(() => _isResetLoading = false);
//     }
//   }

//   bool _validateInputs() {
//     if (!_formKey.currentState!.validate()) return false;
//     return true;
//   }

//   String _formatFirebaseError(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'user-not-found':
//         return 'No account found with this email. Please sign up.';
//       case 'wrong-password':
//         return 'Incorrect password. Try again.';
//       case 'email-already-in-use':
//         return 'This email is already registered. Please log in.';
//       case 'invalid-email':
//         return 'Invalid email format.';
//       case 'weak-password':
//         return 'Password must be at least 6 characters.';
//       case 'too-many-requests':
//         return 'Too many attempts. Please try again later.';
//       case 'network-request-failed':
//         return 'Network error. Please check your connection.';
//       default:
//         return e.message ?? 'An unexpected error occurred.';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               themeProvider.currentTheme.primaryColor.withOpacity(0.2),
//               themeProvider.currentTheme.scaffoldBackgroundColor,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     Icon(Icons.currency_bitcoin,
//                         size: 80, color: themeProvider.currentTheme.primaryColor),
//                     const SizedBox(height: 16),
//                     Text(
//                       'Crypto Insight',
//                       style: themeProvider.currentTheme.textTheme.headlineMedium
//                           ?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: themeProvider.currentTheme.primaryColor,
//                       ),
//                     ),
//                     const SizedBox(height: 32),
//                     Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(24.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               _isLogin ? 'Welcome Back' : 'Create Account',
//                               style: themeProvider.currentTheme.textTheme.headlineSmall
//                                   ?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             if (!_isLogin) ...[
//                               _buildTextField(
//                                   _firstNameController, 'First Name', Icons.person,
//                                   validator: (value) => value!.isEmpty
//                                       ? 'First name is required'
//                                       : null),
//                               const SizedBox(height: 16),
//                               _buildTextField(
//                                   _lastNameController, 'Last Name', Icons.person,
//                                   validator: (value) => value!.isEmpty
//                                       ? 'Last name is required'
//                                       : null),
//                               const SizedBox(height: 16),
//                             ],
//                             _buildTextField(
//                               _emailController,
//                               'Email',
//                               Icons.email,
//                               keyboardType: TextInputType.emailAddress,
//                               validator: (value) {
//                                 if (value!.isEmpty) return 'Email is required';
//                                 if (!value.contains('@') || !value.contains('.'))
//                                   return 'Invalid email format';
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 16),
//                             _buildTextField(
//                               _passwordController,
//                               'Password',
//                               Icons.lock,
//                               obscureText: _obscurePassword,
//                               validator: (value) {
//                                 if (value!.isEmpty) return 'Password is required';
//                                 if (value.length < 6) {
//                                   return 'Password must be at least 6 characters';
//                                 }
//                                 return null;
//                               },
//                               suffixIcon: IconButton(
//                                 icon: Icon(_obscurePassword
//                                     ? Icons.visibility
//                                     : Icons.visibility_off),
//                                 onPressed: () =>
//                                     setState(() => _obscurePassword = !_obscurePassword),
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             if (_errorMessage.isNotEmpty)
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 8.0),
//                                 child: Text(
//                                   _errorMessage,
//                                   style: TextStyle(
//                                       color:
//                                           themeProvider.currentTheme.colorScheme.error),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             if (_isLogin)
//                               Align(
//                                 alignment: Alignment.centerRight,
//                                 child: TextButton(
//                                   onPressed: _isResetLoading ? null : _resetPassword,
//                                   child: Text(
//                                     'Forgot Password?',
//                                     style: TextStyle(
//                                         color: themeProvider.currentTheme.primaryColor),
//                                   ),
//                                 ),
//                               ),
//                             const SizedBox(height: 24),
//                             ElevatedButton(
//                               onPressed: _isAuthLoading ? null : _authenticateWithDebounce,
//                               style: ElevatedButton.styleFrom(
//                                 minimumSize: const Size(double.infinity, 50),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12)),
//                               ),
//                               child: _isAuthLoading
//                                   ? const CircularProgressIndicator(color: Colors.white)
//                                   : Text(_isLogin ? 'Login' : 'Sign Up'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     OutlinedButton.icon(
//                       onPressed: _isGoogleLoading ? null : _signInWithGoogle,
//                       icon: _isGoogleLoading
//                           ? const SizedBox(
//                               width: 24,
//                               height: 24,
//                               child: CircularProgressIndicator(strokeWidth: 2),
//                             )
//                           : const Icon(Icons.g_mobiledata, size: 24),
//                       label: const Text('Continue with Google'),
//                       style: OutlinedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12)),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _isLogin = !_isLogin;
//                           _errorMessage = '';
//                         });
//                       },
//                       child: Text(
//                         _isLogin ? 'Need an account? Sign Up' : 'Have an account? Login',
//                         style:
//                             TextStyle(color: themeProvider.currentTheme.primaryColor),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     TextEditingController controller,
//     String label,
//     IconData icon, {
//     TextInputType keyboardType = TextInputType.text,
//     bool obscureText = false,
//     Widget? suffixIcon,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon),
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         filled: true,
//         fillColor: Colors.grey[100],
//       ),
//     );
//   }
// }


















// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crypto_insight/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   bool _isLogin = true;
//   bool _isAuthLoading = false;
//   bool _isGoogleLoading = false;
//   bool _isResetLoading = false;
//   bool _obscurePassword = true;
//   String _errorMessage = '';

//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );
//     _animationController.forward();

//     FirebaseAuth.instance.authStateChanges().listen((user) {
//       if (user != null && user.emailVerified && mounted) {
//         Navigator.pushReplacementNamed(context, '/search');
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   Future<void> _authenticate() async {
//     if (!_validateInputs()) return;

//     setState(() {
//       _isAuthLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final email = _emailController.text.trim().toLowerCase();
//       final password = _passwordController.text.trim();

//       print('Authenticating with email: "$email"');
//       if (_isLogin) {
//         // Try direct login first to bypass potential fetchSignInMethodsForEmail issues
//         print('Attempting direct login...');
//         try {
//           final userCredential =
//               await FirebaseAuth.instance.signInWithEmailAndPassword(
//             email: email,
//             password: password,
//           );

//           if (!userCredential.user!.emailVerified) {
//             await userCredential.user!.sendEmailVerification();
//             setState(() {
//               _errorMessage =
//                   'Please verify your email. A link has been sent to $email.';
//             });
//             return;
//           }
//           print('Direct login successful: ${userCredential.user!.email}');
//           Navigator.pushReplacementNamed(context, '/search');
//         } on FirebaseAuthException catch (e) {
//           if (e.code == 'user-not-found') {
//             print('Direct login failed: User not found. Checking sign-in methods...');
//             List<String> signInMethods = await _fetchSignInMethodsWithRetry(email);
//             print('Sign-in methods after retry: $signInMethods');
//             if (signInMethods.isEmpty) {
//               throw Exception('No account found with this email. Please sign up.');
//             }
//             if (!signInMethods.contains('password')) {
//               throw Exception(
//                   'This email is registered with Google. Use "Continue with Google".');
//             }
//             // If methods exist, retry login
//             final userCredential =
//                 await FirebaseAuth.instance.signInWithEmailAndPassword(
//               email: email,
//               password: password,
//             );
//             if (!userCredential.user!.emailVerified) {
//               await userCredential.user!.sendEmailVerification();
//               setState(() {
//                 _errorMessage =
//                     'Please verify your email. A link has been sent to $email.';
//               });
//               return;
//             }
//             print('Retry login successful: ${userCredential.user!.email}');
//             Navigator.pushReplacementNamed(context, '/search');
//           } else {
//             throw e; // Re-throw other FirebaseAuthExceptions (e.g., wrong-password)
//           }
//         }
//       } else {
//         // Registration
//         List<String> signInMethods =
//             await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//         print('Pre-registration check: $signInMethods');
//         if (signInMethods.isNotEmpty) {
//           throw Exception('This email is already registered. Please log in.');
//         }

//         final userCredential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         print('User created with UID: ${userCredential.user!.uid}');
//         await userCredential.user!.updateDisplayName(
//           '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
//         );
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user!.uid)
//             .set({
//           'email': email,
//           'displayName':
//               '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//         await userCredential.user!.sendEmailVerification();

//         // Verify registration
//         await Future.delayed(Duration(seconds: 3));
//         List<String> methods =
//             await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//         print('Post-registration methods: $methods');
//         if (methods.isEmpty) {
//           print('WARNING: Registration succeeded but account not found');
//           setState(() {
//             _errorMessage =
//                 'Registration failed to sync with Firebase. Please try again.';
//           });
//           await FirebaseAuth.instance.signOut();
//           return;
//         }

//         setState(() {
//           _isLogin = true;
//           _errorMessage =
//               'Account created! Please verify your email at $email and log in.';
//           _emailController.clear();
//           _passwordController.clear();
//           _firstNameController.clear();
//           _lastNameController.clear();
//         });
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() => _errorMessage = _formatFirebaseError(e));
//       print('FirebaseAuthException: ${e.code} - ${e.message}');
//     } catch (e) {
//       setState(() => _errorMessage = e.toString());
//       print('Unexpected error: $e');
//     } finally {
//       setState(() => _isAuthLoading = false);
//     }
//   }

//   Future<List<String>> _fetchSignInMethodsWithRetry(String email) async {
//     const maxRetries = 5; // Increased retries
//     const delaySeconds = 3; // Increased delay
//     List<String> signInMethods = [];

//     for (int i = 0; i < maxRetries; i++) {
//       signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//       print('Retry $i: Sign-in methods for "$email": $signInMethods');
//       if (signInMethods.isNotEmpty) break;
//       if (i < maxRetries - 1) await Future.delayed(Duration(seconds: delaySeconds));
//     }
//     return signInMethods;
//   }

//   Future<void> _signInWithGoogle() async {
//     setState(() {
//       _isGoogleLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
//       await googleSignIn.signOut();
//       final googleUser = await googleSignIn.signIn();

//       if (googleUser == null) throw Exception('Google Sign-In cancelled');

//       final googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (e) {
//       setState(() => _errorMessage = e.toString());
//     } finally {
//       setState(() => _isGoogleLoading = false);
//     }
//   }

//   Future<void> _resetPassword() async {
//     if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
//       setState(() => _errorMessage = 'Please enter a valid email');
//       return;
//     }

//     setState(() {
//       _isResetLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       await FirebaseAuth.instance
//           .sendPasswordResetEmail(email: _emailController.text.trim().toLowerCase());
//       if (mounted) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Success'),
//             content: const Text('Password reset email sent. Check your inbox.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     } catch (e) {
//       setState(() => _errorMessage = 'Error sending reset email: ${e.toString()}');
//     } finally {
//       setState(() => _isResetLoading = false);
//     }
//   }

//   bool _validateInputs() {
//     if (!_formKey.currentState!.validate()) return false;
//     return true;
//   }

//   String _formatFirebaseError(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'user-not-found':
//         return 'No account found with this email. Please sign up.';
//       case 'wrong-password':
//         return 'Incorrect password. Try again.';
//       case 'email-already-in-use':
//         return 'This email is already registered. Please log in.';
//       case 'invalid-email':
//         return 'Invalid email format.';
//       case 'weak-password':
//         return 'Password must be at least 6 characters.';
//       case 'too-many-requests':
//         return 'Too many attempts. Please try again later.';
//       case 'network-request-failed':
//         return 'Network error. Please check your connection.';
//       default:
//         return e.message ?? 'An unexpected error occurred.';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               themeProvider.currentTheme.primaryColor.withOpacity(0.2),
//               themeProvider.currentTheme.scaffoldBackgroundColor,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     Icon(Icons.currency_bitcoin,
//                         size: 80, color: themeProvider.currentTheme.primaryColor),
//                     const SizedBox(height: 16),
//                     Text(
//                       'Crypto Insight',
//                       style: themeProvider.currentTheme.textTheme.headlineMedium
//                           ?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: themeProvider.currentTheme.primaryColor,
//                       ),
//                     ),
//                     const SizedBox(height: 32),
//                     Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(24.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               _isLogin ? 'Welcome Back' : 'Create Account',
//                               style: themeProvider.currentTheme.textTheme.headlineSmall
//                                   ?.copyWith(fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 24),
//                             if (!_isLogin) ...[
//                               _buildTextField(
//                                   _firstNameController, 'First Name', Icons.person,
//                                   validator: (value) => value!.isEmpty
//                                       ? 'First name is required'
//                                       : null),
//                               const SizedBox(height: 16),
//                               _buildTextField(
//                                   _lastNameController, 'Last Name', Icons.person,
//                                   validator: (value) => value!.isEmpty
//                                       ? 'Last name is required'
//                                       : null),
//                               const SizedBox(height: 16),
//                             ],
//                             _buildTextField(
//                               _emailController,
//                               'Email',
//                               Icons.email,
//                               keyboardType: TextInputType.emailAddress,
//                               validator: (value) {
//                                 if (value!.isEmpty) return 'Email is required';
//                                 if (!value.contains('@') || !value.contains('.'))
//                                   return 'Invalid email format';
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 16),
//                             _buildTextField(
//                               _passwordController,
//                               'Password',
//                               Icons.lock,
//                               obscureText: _obscurePassword,
//                               validator: (value) {
//                                 if (value!.isEmpty) return 'Password is required';
//                                 if (value.length < 6) {
//                                   return 'Password must be at least 6 characters';
//                                 }
//                                 return null;
//                               },
//                               suffixIcon: IconButton(
//                                 icon: Icon(_obscurePassword
//                                     ? Icons.visibility
//                                     : Icons.visibility_off),
//                                 onPressed: () =>
//                                     setState(() => _obscurePassword = !_obscurePassword),
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             if (_errorMessage.isNotEmpty)
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 8.0),
//                                 child: Text(
//                                   _errorMessage,
//                                   style: TextStyle(
//                                       color:
//                                           themeProvider.currentTheme.colorScheme.error,
//                                       fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             if (_isLogin)
//                               Align(
//                                 alignment: Alignment.centerRight,
//                                 child: TextButton(
//                                   onPressed: _isResetLoading ? null : _resetPassword,
//                                   child: Text(
//                                     'Forgot Password?',
//                                     style: TextStyle(
//                                         color: themeProvider.currentTheme.primaryColor),
//                                   ),
//                                 ),
//                               ),
//                             const SizedBox(height: 24),
//                             ElevatedButton(
//                               onPressed: _isAuthLoading ? null : _authenticate,
//                               style: ElevatedButton.styleFrom(
//                                 minimumSize: const Size(double.infinity, 50),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12)),
//                               ),
//                               child: _isAuthLoading
//                                   ? const CircularProgressIndicator(color: Colors.white)
//                                   : Text(_isLogin ? 'Login' : 'Sign Up'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     OutlinedButton.icon(
//                       onPressed: _isGoogleLoading ? null : _signInWithGoogle,
//                       icon: _isGoogleLoading
//                           ? const SizedBox(
//                               width: 24,
//                               height: 24,
//                               child: CircularProgressIndicator(strokeWidth: 2),
//                             )
//                           : const Icon(Icons.g_mobiledata, size: 24),
//                       label: const Text('Continue with Google'),
//                       style: OutlinedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12)),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _isLogin = !_isLogin;
//                           _errorMessage = '';
//                         });
//                       },
//                       child: Text(
//                         _isLogin ? 'Need an account? Sign Up' : 'Have an account? Login',
//                         style:
//                             TextStyle(color: themeProvider.currentTheme.primaryColor),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     TextEditingController controller,
//     String label,
//     IconData icon, {
//     TextInputType keyboardType = TextInputType.text,
//     bool obscureText = false,
//     Widget? suffixIcon,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon),
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         filled: true,
//         fillColor: Colors.grey[100],
//       ),
//     );
//   }
// }




















// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:url_launcher/url_launcher.dart';
// import 'theme.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
  
//   bool _isLogin = true;
//   bool _isAuthLoading = false;
//   bool _isGoogleLoading = false;
//   bool _isResetLoading = false;
//   bool _obscurePassword = true;
//   String _errorMessage = '';
//   String? _emailError;
//   String? _passwordError;
  
//   bool _justCreatedAccount = false;
//   bool _showVerificationMessage = false;

//   // Animation controllers
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;

//   // Authentication service
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   StreamSubscription<User?>? _authStateSubscription;

//   @override
//   void initState() {
//     super.initState();
    
//     // Setup animations
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
    
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );
    
//     _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//     );
    
//     _animationController.forward();

//     // Setup auth state listener
//     _authStateSubscription = _auth.authStateChanges().listen((user) {
//       if (user != null && mounted) {
//         if (user.emailVerified) {
//           _updateUserLastLogin(user.uid);
//           Navigator.pushReplacementNamed(context, '/search');
//         } else if (!_showVerificationMessage) {
//           setState(() {
//             _showVerificationMessage = true;
//           });
//         }
//       }
//     });

//     // Add listeners for real-time validation
//     _emailController.addListener(_validateEmailOnChange);
//     _passwordController.addListener(_validatePasswordOnChange);
//   }

//   @override
//   void dispose() {
//     _emailController.removeListener(_validateEmailOnChange);
//     _passwordController.removeListener(_validatePasswordOnChange);
    
//     _emailController.dispose();
//     _passwordController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
    
//     _animationController.dispose();
//     _authStateSubscription?.cancel();
    
//     super.dispose();
//   }

//   void _validateEmailOnChange() {
//     if (_emailController.text.isNotEmpty) {
//       final bool isValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text);
//       setState(() {
//         _emailError = isValid ? null : 'Invalid email format';
//       });
//     } else {
//       setState(() {
//         _emailError = null;
//       });
//     }
//   }

//   void _validatePasswordOnChange() {
//     if (_passwordController.text.isNotEmpty) {
//       setState(() {
//         _passwordError = _passwordController.text.length < 6 
//             ? 'Password must be at least 6 characters' 
//             : null;
//       });
//     } else {
//       setState(() {
//         _passwordError = null;
//       });
//     }
//   }

//   Future<void> _updateUserLastLogin(String uid) async {
//     await _firestore.collection('users').doc(uid).update({
//       'lastLogin': FieldValue.serverTimestamp(),
//     });
//   }

//   Future<void> _authenticate() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() {
//       _isAuthLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final email = _emailController.text.trim();
//       final password = _passwordController.text.trim();

//       if (_isLogin) {
//         await _handleLogin(email, password);
//       } else {
//         await _handleSignup(email, password);
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() => _errorMessage = _formatFirebaseError(e));
//     } catch (e) {
//       setState(() => _errorMessage = e.toString().replaceFirst('Exception: ', ''));
//     } finally {
//       if (mounted) setState(() => _isAuthLoading = false);
//     }
//   }

//   Future<void> _handleLogin(String email, String password) async {
//     try {
//       // Check sign-in methods
//       List<String> signInMethods = await _auth.fetchSignInMethodsForEmail(email);
      
//       if (signInMethods.isEmpty) {
//         throw Exception('No account found with this email. Please sign up.');
//       }
      
//       if (!signInMethods.contains('password')) {
//         throw Exception('This email is registered with Google. Use "Continue with Google" instead.');
//       }

//       // Perform login
//       final userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       // Check email verification
//       if (!userCredential.user!.emailVerified) {
//         setState(() {
//           _showVerificationMessage = true;
//         });
//         await userCredential.user!.sendEmailVerification();
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> _handleSignup(String email, String password) async {
//     try {
//       // Check if email exists
//       List<String> signInMethods = await _auth.fetchSignInMethodsForEmail(email);
//       if (signInMethods.isNotEmpty) {
//         throw Exception('This email is already registered. Please log in.');
//       }

//       // Create user account
//       final userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       // Setup user profile
//       final displayName = '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}';
//       await userCredential.user!.updateDisplayName(displayName);
      
//       // Create user document
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'email': email,
//         'displayName': displayName,
//         'createdAt': FieldValue.serverTimestamp(),
//         'lastLogin': FieldValue.serverTimestamp(),
//       });

//       // Send verification email
//       await userCredential.user!.sendEmailVerification();
      
//       // Update UI
//       setState(() {
//         _justCreatedAccount = true;
//         _showVerificationMessage = true;
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> _signInWithGoogle() async {
//     setState(() {
//       _isGoogleLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       // Configure Google Sign In
//       final googleSignIn = GoogleSignIn(
//         scopes: ['email', 'profile'],
//         // Web app needs client ID for Google Sign In
//         clientId: kIsWeb ? '662823526299-fqvbtpne58q7lofqifi1mvit03atd193.apps.googleusercontent.com' : null,
//       );
      
//       // Sign out first to show account picker
//       await googleSignIn.signOut();
      
//       // Start sign in process
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser == null) throw Exception('Google Sign-In cancelled');

//       // Get auth details
//       final googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Sign in with Firebase
//       final userCredential = await _auth.signInWithCredential(credential);
//       final user = userCredential.user!;

//       // Update or create user document
//       final userDoc = await _firestore.collection('users').doc(user.uid).get();
//       if (!userDoc.exists) {
//         await _firestore.collection('users').doc(user.uid).set({
//           'email': user.email,
//           'displayName': user.displayName ?? 'Google User',
//           'photoURL': user.photoURL,
//           'createdAt': FieldValue.serverTimestamp(),
//           'lastLogin': FieldValue.serverTimestamp(),
//           'authProvider': 'google',
//         });
//       } else {
//         await _firestore.collection('users').doc(user.uid).update({
//           'lastLogin': FieldValue.serverTimestamp(),
//           'photoURL': user.photoURL, // Update photo in case it changed
//         });
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() => _errorMessage = _formatFirebaseError(e));
//     } catch (e) {
//       setState(() => _errorMessage = e.toString().replaceFirst('Exception: ', ''));
//     } finally {
//       if (mounted) setState(() => _isGoogleLoading = false);
//     }
//   }

//   Future<void> _resetPassword() async {
//     // Validate email
//     if (_emailController.text.trim().isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text)) {
//       setState(() => _errorMessage = 'Please enter a valid email');
//       return;
//     }

//     setState(() {
//       _isResetLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Text('Password reset email sent. Check your inbox.'),
//             backgroundColor: Colors.green,
//             behavior: SnackBarBehavior.floating,
//             action: SnackBarAction(
//               label: 'Dismiss',
//               textColor: Colors.white,
//               onPressed: () {},
//             ),
//           ),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() => _errorMessage = _formatFirebaseError(e));
//     } catch (e) {
//       setState(() => _errorMessage = 'Error: ${e.toString()}');
//     } finally {
//       if (mounted) setState(() => _isResetLoading = false);
//     }
//   }

//   String _formatFirebaseError(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'user-not-found':
//         return 'No account found with this email. Please sign up.';
//       case 'wrong-password':
//         return 'Incorrect password. Try again.';
//       case 'email-already-in-use':
//         return 'This email is already registered. Please log in.';
//       case 'invalid-email':
//         return 'Invalid email format.';
//       case 'weak-password':
//         return 'Password must be at least 6 characters.';
//       case 'too-many-requests':
//         return 'Too many attempts. Please try again later.';
//       case 'network-request-failed':
//         return 'Network error. Please check your connection.';
//       case 'user-disabled':
//         return 'This account has been disabled.';
//       case 'popup-closed-by-user':
//         return 'Google sign-in was cancelled. Please try again.';
//       case 'cancelled-popup-request':
//         return 'Another authentication request is in progress.';
//       case 'operation-not-allowed':
//         return 'This authentication method is not enabled.';
//       default:
//         return e.message ?? 'An unexpected error occurred.';
//     }
//   }

//   Future<void> _openEmailApp() async {
//     // For web, just prompt to check email
//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: '',
//     );
    
//     if (await canLaunchUrl(emailLaunchUri)) {
//       await launchUrl(emailLaunchUri);
//     } else {
//       // Show fallback dialog if can't launch email
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Please check your email for verification link'),
//             duration: Duration(seconds: 4),
//           ),
//         );
//       }
//     }
//   }

//   void _resetForm() {
//     setState(() {
//       _emailController.clear();
//       _passwordController.clear();
//       _firstNameController.clear();
//       _lastNameController.clear();
//       _errorMessage = '';
//       _emailError = null;
//       _passwordError = null;
//     });
//   }

//   void _toggleAuthMode() {
//     _resetForm();
//     setState(() {
//       _isLogin = !_isLogin;
//       _justCreatedAccount = false;
//       _showVerificationMessage = false;
//     });
    
//     // Play animation when switching modes
//     _animationController.reset();
//     _animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final theme = themeProvider.currentTheme;
//     final size = MediaQuery.of(context).size;
    
//     // Responsive width calculation
//     final formWidth = size.width > 800 ? 450.0 : (size.width > 600 ? 400.0 : size.width * 0.9);

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               theme.primaryColor.withOpacity(0.2),
//               theme.scaffoldBackgroundColor,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: FadeTransition(
//               opacity: _fadeAnimation,
//               child: SlideTransition(
//                 position: _slideAnimation,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Logo and App Name
//                       Icon(
//                         Icons.currency_bitcoin,
//                         size: 80,
//                         color: theme.primaryColor,
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Crypto Insight',
//                         style: theme.textTheme.headlineMedium?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: theme.primaryColor,
//                         ),
//                       ),
//                       const SizedBox(height: 32),
                      
//                       // Show email verification message if needed
//                       if (_showVerificationMessage)
//                         _buildVerificationMessage(theme),
                      
//                       if (!_showVerificationMessage)
//                         SizedBox(
//                           width: formWidth,
//                           child: _buildAuthForm(theme),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildVerificationMessage(ThemeData theme) {
//     return Container(
//       width: 450,
//       margin: const EdgeInsets.symmetric(horizontal: 24),
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Icon(
//             Icons.mark_email_read,
//             size: 64,
//             color: theme.primaryColor,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             _justCreatedAccount 
//                 ? 'Account Created Successfully!'
//                 : 'Email Verification Required',
//             style: theme.textTheme.headlineSmall?.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 24),
//           Text(
//             'We\'ve sent a verification link to ${_emailController.text}. '
//             'Please check your email inbox and verify your account to continue.',
//             style: theme.textTheme.bodyLarge,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton.icon(
//             onPressed: _openEmailApp,
//             icon: const Icon(Icons.mail),
//             label: const Text('Open Email App'),
//             style: ElevatedButton.styleFrom(
//               minimumSize: const Size(200, 50),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               backgroundColor: theme.primaryColor,
//               foregroundColor: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 16),
//           TextButton(
//             onPressed: () async {
//               if (_auth.currentUser != null) {
//                 await _auth.currentUser!.sendEmailVerification();
//                 if (mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Verification email resent. Please check your inbox.'),
//                     ),
//                   );
//                 }
//               }
//             },
//             child: const Text('Resend Verification Email'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _showVerificationMessage = false;
//                 if (_auth.currentUser != null) {
//                   _auth.signOut();
//                 }
//               });
//             },
//             child: const Text('Back to Login'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAuthForm(ThemeData theme) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 _isLogin ? 'Welcome Back' : 'Create Account',
//                 style: theme.textTheme.headlineSmall?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 _isLogin 
//                     ? 'Sign in to access your crypto dashboard'
//                     : 'Create an account to get started with Crypto Insight',
//                 style: theme.textTheme.bodyMedium?.copyWith(
//                   color: Colors.grey[600],
//                 ),
//               ),
//               const SizedBox(height: 24),
              
//               // Registration fields
//               if (!_isLogin) ...[
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildTextField(
//                         _firstNameController,
//                         'First Name',
//                         Icons.person,
//                         validator: (value) => value!.isEmpty ? 'First name is required' : null,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: _buildTextField(
//                         _lastNameController,
//                         'Last Name',
//                         Icons.person,
//                         validator: (value) => value!.isEmpty ? 'Last name is required' : null,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//               ],
              
//               // Email field
//               _buildTextField(
//                 _emailController,
//                 'Email',
//                 Icons.email,
//                 keyboardType: TextInputType.emailAddress,
//                 errorText: _emailError,
//                 validator: (value) {
//                   if (value!.isEmpty) return 'Email is required';
//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Invalid email format';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
              
//               // Password field
//               _buildTextField(
//                 _passwordController,
//                 'Password',
//                 Icons.lock,
//                 obscureText: _obscurePassword,
//                 errorText: _passwordError,
//                 helperText: !_isLogin ? 'Password must be at least 6 characters' : null,
//                 validator: (value) {
//                   if (value!.isEmpty) return 'Password is required';
//                   if (value.length < 6) return 'Password must be at least 6 characters';
//                   return null;
//                 },
//                 suffixIcon: IconButton(
//                   icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
//                   onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
//                   tooltip: _obscurePassword ? 'Show password' : 'Hide password',
//                 ),
//               ),
              
//               // Error message display
//               if (_errorMessage.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16.0),
//                   child: Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.error.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(Icons.error_outline, color: theme.colorScheme.error),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             _errorMessage,
//                             style: TextStyle(color: theme.colorScheme.error),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
              
//               // Forgot password link
//               if (_isLogin)
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: _isResetLoading ? null : _resetPassword,
//                     child: _isResetLoading
//                         ? const SizedBox(
//                             width: 16,
//                             height: 16,
//                             child: CircularProgressIndicator(strokeWidth: 2),
//                           )
//                         : Text(
//                             'Forgot Password?',
//                             style: TextStyle(color: theme.primaryColor),
//                           ),
//                   ),
//                 ),
                
//               const SizedBox(height: 24),
              
//               // Primary action button
//               ElevatedButton(
//                 onPressed: _isAuthLoading || _isGoogleLoading || _isResetLoading
//                     ? null
//                     : _authenticate,
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   backgroundColor: theme.primaryColor,
//                   foregroundColor: Colors.white,
//                 ),
//                 child: _isAuthLoading
//                     ? const SizedBox(
//                         width: 24,
//                         height: 24,
//                         child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
//                       )
//                     : Text(_isLogin ? 'Sign In' : 'Create Account'),
//               ),
              
//               // OR divider
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 child: Row(
//                   children: [
//                     Expanded(child: Divider(color: Colors.grey[400])),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text('OR', style: TextStyle(color: Colors.grey[600])),
//                     ),
//                     Expanded(child: Divider(color: Colors.grey[400])),
//                   ],
//                 ),
//               ),
              
//               // Google sign-in button
//               OutlinedButton.icon(
//                 onPressed: _isAuthLoading || _isGoogleLoading || _isResetLoading
//                     ? null
//                     : _signInWithGoogle,
//                 icon: _isGoogleLoading
//                     ? const SizedBox(
//                         width: 24,
//                         height: 24,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       )
//                     : Image.asset('assets/google_logo.png', height: 24),
//                 label: const Text('Continue with Google'),
//                 style: OutlinedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   side: BorderSide(color: theme.primaryColor),
//                 ),
//               ),
              
//               // Toggle auth mode button
//               Padding(
//                 padding: const EdgeInsets.only(top: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       _isLogin ? 'Need an account?' : 'Already have an account?',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                     TextButton(
//                       onPressed: _toggleAuthMode,
//                       child: Text(
//                         _isLogin ? 'Sign Up' : 'Sign In',
//                         style: TextStyle(
//                           color: theme.primaryColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     TextEditingController controller,
//     String label,
//     IconData icon, {
//     TextInputType keyboardType = TextInputType.text,
//     bool obscureText = false,
//     Widget? suffixIcon,
//     String? Function(String?)? validator,
//     String? errorText,
//     String? helperText,
//   }) {
//     final theme = Provider.of<ThemeProvider>(context).currentTheme;
    
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: theme.primaryColor),
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: theme.primaryColor),
//         ),
//         filled: true,
//         fillColor: Colors.grey[50],
//         errorText: errorText,
//         helperText: helperText,
//         errorStyle: const TextStyle(height: 0.7),
//         helperStyle: const TextStyle(height: 0.7),
//       ),
//       onFieldSubmitted: (_) {
//         if (_isLogin) {
//           _authenticate();
//         }
//       },
//     );
//   }
// }

























// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:url_launcher/url_launcher.dart';
// import 'theme.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
  
//   bool _isLogin = true;
//   bool _isAuthLoading = false;
//   bool _isGoogleLoading = false;
//   bool _isResetLoading = false;
//   bool _obscurePassword = true;
//   String _errorMessage = '';
//   String? _emailError;
//   String? _passwordError;
  
//   bool _justCreatedAccount = false;
//   bool _showVerificationMessage = false;

//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   StreamSubscription<User?>? _authStateSubscription;

//   @override
//   void initState() {
//     super.initState();
    
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
    
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );
    
//     _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//     );
    
//     _animationController.forward();

//     _authStateSubscription = _auth.authStateChanges().listen((user) {
//       if (user != null && mounted) {
//         if (user.emailVerified) {
//           _updateUserLastLogin(user.uid);
//           Navigator.pushReplacementNamed(context, '/search');
//         } else if (!_showVerificationMessage) {
//           setState(() {
//             _showVerificationMessage = true;
//           });
//         }
//       }
//     });

//     _emailController.addListener(_validateEmailOnChange);
//     _passwordController.addListener(_validatePasswordOnChange);
//   }

//   @override
//   void dispose() {
//     _emailController.removeListener(_validateEmailOnChange);
//     _passwordController.removeListener(_validatePasswordOnChange);
    
//     _emailController.dispose();
//     _passwordController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
    
//     _animationController.dispose();
//     _authStateSubscription?.cancel();
    
//     super.dispose();
//   }

//   void _validateEmailOnChange() {
//     if (_emailController.text.isNotEmpty) {
//       final bool isValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text);
//       setState(() {
//         _emailError = isValid ? null : 'Invalid email format';
//       });
//     } else {
//       setState(() {
//         _emailError = null;
//       });
//     }
//   }

//   void _validatePasswordOnChange() {
//     if (_passwordController.text.isNotEmpty) {
//       setState(() {
//         _passwordError = _passwordController.text.length < 6 
//             ? 'Password must be at least 6 characters' 
//             : null;
//       });
//     } else {
//       setState(() {
//         _passwordError = null;
//       });
//     }
//   }

//   Future<void> _updateUserLastLogin(String uid) async {
//     await _firestore.collection('users').doc(uid).update({
//       'lastLogin': FieldValue.serverTimestamp(),
//     });
//   }

//   Future<void> _authenticate() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() {
//       _isAuthLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final email = _emailController.text.trim();
//       final password = _passwordController.text.trim();

//       if (_isLogin) {
//         await _handleLogin(email, password);
//       } else {
//         await _handleSignup(email, password);
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() => _errorMessage = _formatFirebaseError(e));
//     } catch (e) {
//       setState(() => _errorMessage = e.toString().replaceFirst('Exception: ', ''));
//     } finally {
//       if (mounted) setState(() => _isAuthLoading = false);
//     }
//   }

//   Future<void> _handleLogin(String email, String password) async {
//     try {
//       final userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       if (!userCredential.user!.emailVerified) {
//         setState(() {
//           _showVerificationMessage = true;
//         });
//         await userCredential.user!.sendEmailVerification();
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> _handleSignup(String email, String password) async {
//     try {
//       final userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       final displayName = '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}';
//       await userCredential.user!.updateDisplayName(displayName);
      
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'email': email,
//         'displayName': displayName,
//         'createdAt': FieldValue.serverTimestamp(),
//         'lastLogin': FieldValue.serverTimestamp(),
//       });

//       await userCredential.user!.sendEmailVerification();
      
//       setState(() {
//         _justCreatedAccount = true;
//         _showVerificationMessage = true;
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> _signInWithGoogle() async {
//     setState(() {
//       _isGoogleLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final googleSignIn = GoogleSignIn(
//         scopes: ['email', 'profile'],
//         clientId: kIsWeb ? '662823526299-fqvbtpne58q7lofqifi1mvit03atd193.apps.googleusercontent.com' : null,
//       );
      
//       await googleSignIn.signOut();
      
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser == null) throw Exception('Google Sign-In cancelled');

//       final googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final userCredential = await _auth.signInWithCredential(credential);
//       final user = userCredential.user!;

//       final userDoc = await _firestore.collection('users').doc(user.uid).get();
//       if (!userDoc.exists) {
//         await _firestore.collection('users').doc(user.uid).set({
//           'email': user.email,
//           'displayName': user.displayName ?? 'Google User',
//           'photoURL': user.photoURL,
//           'createdAt': FieldValue.serverTimestamp(),
//           'lastLogin': FieldValue.serverTimestamp(),
//           'authProvider': 'google',
//         });
//       } else {
//         await _firestore.collection('users').doc(user.uid).update({
//           'lastLogin': FieldValue.serverTimestamp(),
//           'photoURL': user.photoURL,
//         });
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() => _errorMessage = _formatFirebaseError(e));
//     } catch (e) {
//       setState(() => _errorMessage = e.toString().replaceFirst('Exception: ', ''));
//     } finally {
//       if (mounted) setState(() => _isGoogleLoading = false);
//     }
//   }

//   Future<void> _resetPassword() async {
//     if (_emailController.text.trim().isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text)) {
//       setState(() => _errorMessage = 'Please enter a valid email');
//       return;
//     }

//     setState(() {
//       _isResetLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Text('Password reset email sent. Check your inbox.'),
//             backgroundColor: Colors.green,
//             behavior: SnackBarBehavior.floating,
//             action: SnackBarAction(
//               label: 'Dismiss',
//               textColor: Colors.white,
//               onPressed: () {},
//             ),
//           ),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() => _errorMessage = _formatFirebaseError(e));
//     } catch (e) {
//       setState(() => _errorMessage = 'Error: ${e.toString()}');
//     } finally {
//       if (mounted) setState(() => _isResetLoading = false);
//     }
//   }

//   String _formatFirebaseError(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'user-not-found':
//         return 'No account found with this email. Please sign up or check your email address.';
//       case 'wrong-password':
//         return 'Incorrect password. Try again.';
//       case 'email-already-in-use':
//         return 'This email is already registered. Please log in instead.';
//       case 'invalid-email':
//         return 'Invalid email format.';
//       case 'weak-password':
//         return 'Password must be at least 6 characters.';
//       case 'too-many-requests':
//         return 'Too many attempts. Please try again later.';
//       case 'network-request-failed':
//         return 'Network error. Please check your connection.';
//       case 'user-disabled':
//         return 'This account has been disabled.';
//       case 'account-exists-with-different-credential':
//         return 'An account already exists with the same email but different sign-in credentials. Try signing in using a different method.';
//       case 'invalid-credential':
//         return 'Authentication failed. The credential is malformed or has expired.';
//       case 'operation-not-allowed':
//         return 'This authentication method is not enabled. Please contact support.';
//       case 'popup-closed-by-user':
//         return 'Google sign-in was cancelled. Please try again.';
//       case 'cancelled-popup-request':
//         return 'Another authentication request is in progress.';
//       default:
//         return e.message ?? 'An unexpected error occurred.';
//     }
//   }

//   Future<void> _testFirebaseAuth() async {
//     try {
//       final currentUser = _auth.currentUser;
      
//       final testEmail = _emailController.text.trim();
//       if (testEmail.isNotEmpty) {
//         try {
//           final methods = await _auth.fetchSignInMethodsForEmail(testEmail);
//         } catch (e) {
//           if (mounted) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Error fetching sign-in methods: $e')),
//             );
//           }
//         }
//       }
      
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Firebase auth test completed')),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Test error: $e')),
//         );
//       }
//     }
//   }

//   Future<void> _openEmailApp() async {
//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: '',
//     );
    
//     if (await canLaunchUrl(emailLaunchUri)) {
//       await launchUrl(emailLaunchUri);
//     } else {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Please check your email for verification link'),
//             duration: Duration(seconds: 4),
//           ),
//         );
//       }
//     }
//   }

//   void _resetForm() {
//     setState(() {
//       _emailController.clear();
//       _passwordController.clear();
//       _firstNameController.clear();
//       _lastNameController.clear();
//       _errorMessage = '';
//       _emailError = null;
//       _passwordError = null;
//     });
//   }

//   void _toggleAuthMode() {
//     _resetForm();
//     setState(() {
//       _isLogin = !_isLogin;
//       _justCreatedAccount = false;
//       _showVerificationMessage = false;
//     });
    
//     _animationController.reset();
//     _animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final theme = themeProvider.currentTheme;
//     final size = MediaQuery.of(context).size;
    
//     final formWidth = size.width > 800 ? 450.0 : (size.width > 600 ? 400.0 : size.width * 0.9);

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               theme.primaryColor.withOpacity(0.2),
//               theme.scaffoldBackgroundColor,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: FadeTransition(
//               opacity: _fadeAnimation,
//               child: SlideTransition(
//                 position: _slideAnimation,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.currency_bitcoin,
//                         size: 80,
//                         color: theme.primaryColor,
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Crypto Insight',
//                         style: theme.textTheme.headlineMedium?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: theme.primaryColor,
//                         ),
//                       ),
//                       const SizedBox(height: 32),
                      
//                       if (_showVerificationMessage)
//                         _buildVerificationMessage(theme),
                      
//                       if (!_showVerificationMessage)
//                         SizedBox(
//                           width: formWidth,
//                           child: _buildAuthForm(theme),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildVerificationMessage(ThemeData theme) {
//     return Container(
//       width: 450,
//       margin: const EdgeInsets.symmetric(horizontal: 24),
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Icon(
//             Icons.mark_email_read,
//             size: 64,
//             color: theme.primaryColor,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             _justCreatedAccount 
//                 ? 'Account Created Successfully!'
//                 : 'Email Verification Required',
//             style: theme.textTheme.headlineSmall?.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 24),
//           Text(
//             'We\'ve sent a verification link to ${_emailController.text}. '
//             'Please check your email inbox and verify your account to continue.',
//             style: theme.textTheme.bodyLarge,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton.icon(
//             onPressed: _openEmailApp,
//             icon: const Icon(Icons.mail),
//             label: const Text('Open Email App'),
//             style: ElevatedButton.styleFrom(
//               minimumSize: const Size(200, 50),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               backgroundColor: theme.primaryColor,
//               foregroundColor: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 16),
//           TextButton(
//             onPressed: () async {
//               if (_auth.currentUser != null) {
//                 await _auth.currentUser!.sendEmailVerification();
//                 if (mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Verification email resent. Please check your inbox.'),
//                     ),
//                   );
//                 }
//               }
//             },
//             child: const Text('Resend Verification Email'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _showVerificationMessage = false;
//                 if (_auth.currentUser != null) {
//                   _auth.signOut();
//                 }
//               });
//             },
//             child: const Text('Back to Login'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAuthForm(ThemeData theme) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 _isLogin ? 'Welcome Back' : 'Create Account',
//                 style: theme.textTheme.headlineSmall?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 _isLogin 
//                     ? 'Sign in to access your crypto dashboard'
//                     : 'Create an account to get started with Crypto Insight',
//                 style: theme.textTheme.bodyMedium?.copyWith(
//                   color: Colors.grey[600],
//                 ),
//               ),
//               const SizedBox(height: 24),
              
//               if (!_isLogin) ...[
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildTextField(
//                         _firstNameController,
//                         'First Name',
//                         Icons.person,
//                         validator: (value) => value!.isEmpty ? 'First name is required' : null,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: _buildTextField(
//                         _lastNameController,
//                         'Last Name',
//                         Icons.person,
//                         validator: (value) => value!.isEmpty ? 'Last name is required' : null,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//               ],
              
//               _buildTextField(
//                 _emailController,
//                 'Email',
//                 Icons.email,
//                 keyboardType: TextInputType.emailAddress,
//                 errorText: _emailError,
//                 validator: (value) {
//                   if (value!.isEmpty) return 'Email is required';
//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Invalid email format';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
              
//               _buildTextField(
//                 _passwordController,
//                 'Password',
//                 Icons.lock,
//                 obscureText: _obscurePassword,
//                 errorText: _passwordError,
//                 helperText: !_isLogin ? 'Password must be at least 6 characters' : null,
//                 validator: (value) {
//                   if (value!.isEmpty) return 'Password is required';
//                   if (value.length < 6) return 'Password must be at least 6 characters';
//                   return null;
//                 },
//                 suffixIcon: IconButton(
//                   icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
//                   onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
//                   tooltip: _obscurePassword ? 'Show password' : 'Hide password',
//                 ),
//               ),
              
//               if (_errorMessage.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16.0),
//                   child: Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.error.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(Icons.error_outline, color: theme.colorScheme.error),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             _errorMessage,
//                             style: TextStyle(color: theme.colorScheme.error),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
              
//               if (_isLogin)
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: _isResetLoading ? null : _resetPassword,
//                     child: _isResetLoading
//                         ? const SizedBox(
//                             width: 16,
//                             height: 16,
//                             child: CircularProgressIndicator(strokeWidth: 2),
//                           )
//                         : Text(
//                             'Forgot Password?',
//                             style: TextStyle(color: theme.primaryColor),
//                           ),
//                   ),
//                 ),
                
//               const SizedBox(height: 24),
              
//               ElevatedButton(
//                 onPressed: _isAuthLoading || _isGoogleLoading || _isResetLoading
//                     ? null
//                     : _authenticate,
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   backgroundColor: theme.primaryColor,
//                   foregroundColor: Colors.white,
//                 ),
//                 child: _isAuthLoading
//                     ? const SizedBox(
//                         width: 24,
//                         height: 24,
//                         child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
//                       )
//                     : Text(_isLogin ? 'Sign In' : 'Create Account'),
//               ),
              
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 child: Row(
//                   children: [
//                     Expanded(child: Divider(color: Colors.grey[400])),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text('OR', style: TextStyle(color: Colors.grey[600])),
//                     ),
//                     Expanded(child: Divider(color: Colors.grey[400])),
//                   ],
//                 ),
//               ),
              
//               OutlinedButton.icon(
//                 onPressed: _isAuthLoading || _isGoogleLoading || _isResetLoading
//                     ? null
//                     : _signInWithGoogle,
//                 icon: _isGoogleLoading
//                     ? const SizedBox(
//                         width: 24,
//                         height: 24,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       )
//                     : Image.asset('assets/google_logo.png', height: 24),
//                 label: const Text('Continue with Google'),
//                 style: OutlinedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   side: BorderSide(color: theme.primaryColor),
//                 ),
//               ),

//               TextButton(
//                 onPressed: _testFirebaseAuth,
//                 child: Text(
//                   'Test Firebase Auth',
//                   style: TextStyle(color: theme.primaryColor),
//                 ),
//               ),
              
//               Padding(
//                 padding: const EdgeInsets.only(top: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       _isLogin ? 'Need an account?' : 'Already have an account?',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                     TextButton(
//                       onPressed: _toggleAuthMode,
//                       child: Text(
//                         _isLogin ? 'Sign Up' : 'Sign In',
//                         style: TextStyle(
//                           color: theme.primaryColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     TextEditingController controller,
//     String label,
//     IconData icon, {
//     TextInputType keyboardType = TextInputType.text,
//     bool obscureText = false,
//     Widget? suffixIcon,
//     String? Function(String?)? validator,
//     String? errorText,
//     String? helperText,
//   }) {
//     final theme = Provider.of<ThemeProvider>(context).currentTheme;
    
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: theme.primaryColor),
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: theme.primaryColor),
//         ),
//         filled: true,
//         fillColor: Colors.grey[50],
//         errorText: errorText,
//         helperText: helperText,
//         errorStyle: const TextStyle(height: 0.7),
//         helperStyle: const TextStyle(height: 0.7),
//       ),
//       onFieldSubmitted: (_) {
//         if (_isLogin) {
//           _authenticate();
//         }
//       },
//     );
//   }
// }
























import 'package:crypto_insight/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  
  bool _isSignUp = false;
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _errorMessage;
  
  late AnimationController _animationController;
  late Animation<double> _animation;
  
  // Initialize Google Sign In
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: kIsWeb ? '662823526299-fqvbtpne58q7lofqifi1mvit03atd193.apps.googleusercontent.com' : null,
    scopes: [
      'email',
      'profile',
    ],
  );
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }
  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _animationController.dispose();
    super.dispose();
  }
  
  void _toggleAuthMode() {
    setState(() {
      _isSignUp = !_isSignUp;
      _errorMessage = null;
      if (_isSignUp) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }
  
  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      if (_isSignUp) {
        // Create a new user
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
        
        // Update display name
        await userCredential.user!.updateDisplayName(_nameController.text.trim());
        
        // Send verification email
        await userCredential.user!.sendEmailVerification();
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created! Please verify your email before logging in.'),
              backgroundColor: Colors.green,
            ),
          );
          setState(() {
            _isSignUp = false;
            _animationController.reverse();
          });
        }
      } else {
        // Sign in existing user
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
        
        // Check if email is verified
        if (userCredential.user != null && !userCredential.user!.emailVerified) {
          await FirebaseAuth.instance.signOut();
          throw FirebaseAuthException(
            code: 'email-not-verified',
            message: 'Please verify your email before logging in.',
          );
        }
        
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/search');
        }
      }
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No account found with this email.';
          break;
        case 'wrong-password':
          message = 'Incorrect password.';
          break;
        case 'email-already-in-use':
          message = 'An account already exists with this email.';
          break;
        case 'weak-password':
          message = 'Password is too weak. Please use a stronger password.';
          break;
        case 'email-not-verified':
          message = e.message ?? 'Please verify your email before logging in.';
          break;
        default:
          message = e.message ?? 'An unknown authentication error occurred.';
      }
      
      if (mounted) {
        setState(() => _errorMessage = message);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = 'An error occurred: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  
  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      UserCredential? userCredential;
      
      if (kIsWeb) {
        // Web-specific sign-in approach
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        googleProvider.addScope('email');
        googleProvider.addScope('profile');
        
        // Use Firebase Auth directly for web
        userCredential = await FirebaseAuth.instance.signInWithPopup(googleProvider);
      } else {
        // Mobile approach
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        
        if (googleUser == null) {
          // User canceled the sign-in flow
          setState(() => _isLoading = false);
          return;
        }
        
        // Get authentication details
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        
        // Create credential
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        
        // Sign in to Firebase with the Google credential
        userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      }
      
      if (userCredential != null && mounted) {
        Navigator.pushReplacementNamed(context, '/search');
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = 'Failed to sign in with Google: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  
  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      setState(() => _errorMessage = 'Please enter your email to reset password');
      return;
    }
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password reset link sent to $email'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = 'Failed to send reset email: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    final isDarkMode = themeProvider.currentTheme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themeProvider.currentTheme.primaryColor.withOpacity(0.8),
              themeProvider.currentTheme.scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                width: size.width > 600 ? 500 : size.width * 0.9,
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.currency_bitcoin,
                            size: 60,
                            color: themeProvider.currentTheme.primaryColor,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _isSignUp ? 'Create Account' : 'Welcome Back',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: themeProvider.currentTheme.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _isSignUp
                                ? 'Sign up to start your crypto journey'
                                : 'Sign in to access your insights',
                            style: TextStyle(
                              fontSize: 16,
                              color: isDarkMode ? Colors.white70 : Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          
                          // Error message display
                          if (_errorMessage != null) ...[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.red.shade200),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.error_outline, color: Colors.red),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      _errorMessage!,
                                      style: TextStyle(color: Colors.red.shade800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                          
                          // Name field (only in signup mode)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: _isSignUp ? 80 : 0,
                            child: AnimatedOpacity(
                              opacity: _isSignUp ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: _isSignUp
                                  ? TextFormField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        labelText: 'Full Name',
                                        prefixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      validator: _isSignUp
                                          ? (value) {
                                              if (value == null || value.trim().isEmpty) {
                                                return 'Please enter your name';
                                              }
                                              return null;
                                            }
                                          : null,
                                    )
                                  : null,
                            ),
                          ),
                          
                          // Email field
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter an email';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          
                          // Password field
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                ),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            obscureText: _obscurePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (_isSignUp && value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          
                          // Confirm password field (only in signup mode)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: _isSignUp ? 80 : 0,
                            child: AnimatedOpacity(
                              opacity: _isSignUp ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: _isSignUp
                                  ? TextFormField(
                                      controller: _confirmPasswordController,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                                          ),
                                          onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      obscureText: _obscureConfirmPassword,
                                      validator: _isSignUp
                                          ? (value) {
                                              if (value != _passwordController.text) {
                                                return 'Passwords do not match';
                                              }
                                              return null;
                                            }
                                          : null,
                                    )
                                  : null,
                            ),
                          ),
                          
                          // Forgot password (only in login mode)
                          if (!_isSignUp)
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: _resetPassword,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: themeProvider.currentTheme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          
                          const SizedBox(height: 16),
                          
                          // Submit button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _submitForm,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: themeProvider.currentTheme.primaryColor,
                                foregroundColor: Colors.white,
                              ),
                              child: _isLoading
                                  ? SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3,
                                      ),
                                    )
                                  : Text(
                                      _isSignUp ? 'Sign Up' : 'Sign In',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                          
                          const SizedBox(height: 16),
                          
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: isDarkMode ? Colors.white30 : Colors.black12,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    color: isDarkMode ? Colors.white54 : Colors.black54,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: isDarkMode ? Colors.white30 : Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Google Sign In button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton.icon(
                              onPressed: _isLoading ? null : _signInWithGoogle,
                              icon: Container(
                                height: 24,
                                width: 24,
                                child: Icon(
                                  Icons.g_mobiledata,
                                  color: Colors.red,
                                  size: 28,
                                ),
                              ),
                              label: Text(
                                'Continue with Google',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isDarkMode ? Colors.white : Colors.black87,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide(
                                  color: isDarkMode ? Colors.white30 : Colors.black12,
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Toggle between login and signup
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _isSignUp ? 'Already have an account? ' : 'Don\'t have an account? ',
                                style: TextStyle(
                                  color: isDarkMode ? Colors.white70 : Colors.black54,
                                ),
                              ),
                              TextButton(
                                onPressed: _toggleAuthMode,
                                child: Text(
                                  _isSignUp ? 'Sign In' : 'Sign Up',
                                  style: TextStyle(
                                    color: themeProvider.currentTheme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}