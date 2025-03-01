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


















import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_insight/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLogin = true;
  bool _isAuthLoading = false;
  bool _isGoogleLoading = false;
  bool _isResetLoading = false;
  bool _obscurePassword = true;
  String _errorMessage = '';

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null && user.emailVerified && mounted) {
        Navigator.pushReplacementNamed(context, '/search');
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _authenticate() async {
    if (!_validateInputs()) return;

    setState(() {
      _isAuthLoading = true;
      _errorMessage = '';
    });

    try {
      final email = _emailController.text.trim().toLowerCase();
      final password = _passwordController.text.trim();

      print('Authenticating with email: "$email"');
      if (_isLogin) {
        // Try direct login first to bypass potential fetchSignInMethodsForEmail issues
        print('Attempting direct login...');
        try {
          final userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          if (!userCredential.user!.emailVerified) {
            await userCredential.user!.sendEmailVerification();
            setState(() {
              _errorMessage =
                  'Please verify your email. A link has been sent to $email.';
            });
            return;
          }
          print('Direct login successful: ${userCredential.user!.email}');
          Navigator.pushReplacementNamed(context, '/search');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('Direct login failed: User not found. Checking sign-in methods...');
            List<String> signInMethods = await _fetchSignInMethodsWithRetry(email);
            print('Sign-in methods after retry: $signInMethods');
            if (signInMethods.isEmpty) {
              throw Exception('No account found with this email. Please sign up.');
            }
            if (!signInMethods.contains('password')) {
              throw Exception(
                  'This email is registered with Google. Use "Continue with Google".');
            }
            // If methods exist, retry login
            final userCredential =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email,
              password: password,
            );
            if (!userCredential.user!.emailVerified) {
              await userCredential.user!.sendEmailVerification();
              setState(() {
                _errorMessage =
                    'Please verify your email. A link has been sent to $email.';
              });
              return;
            }
            print('Retry login successful: ${userCredential.user!.email}');
            Navigator.pushReplacementNamed(context, '/search');
          } else {
            throw e; // Re-throw other FirebaseAuthExceptions (e.g., wrong-password)
          }
        }
      } else {
        // Registration
        List<String> signInMethods =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
        print('Pre-registration check: $signInMethods');
        if (signInMethods.isNotEmpty) {
          throw Exception('This email is already registered. Please log in.');
        }

        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print('User created with UID: ${userCredential.user!.uid}');
        await userCredential.user!.updateDisplayName(
          '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': email,
          'displayName':
              '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
          'createdAt': FieldValue.serverTimestamp(),
        });
        await userCredential.user!.sendEmailVerification();

        // Verify registration
        await Future.delayed(Duration(seconds: 3));
        List<String> methods =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
        print('Post-registration methods: $methods');
        if (methods.isEmpty) {
          print('WARNING: Registration succeeded but account not found');
          setState(() {
            _errorMessage =
                'Registration failed to sync with Firebase. Please try again.';
          });
          await FirebaseAuth.instance.signOut();
          return;
        }

        setState(() {
          _isLogin = true;
          _errorMessage =
              'Account created! Please verify your email at $email and log in.';
          _emailController.clear();
          _passwordController.clear();
          _firstNameController.clear();
          _lastNameController.clear();
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _errorMessage = _formatFirebaseError(e));
      print('FirebaseAuthException: ${e.code} - ${e.message}');
    } catch (e) {
      setState(() => _errorMessage = e.toString());
      print('Unexpected error: $e');
    } finally {
      setState(() => _isAuthLoading = false);
    }
  }

  Future<List<String>> _fetchSignInMethodsWithRetry(String email) async {
    const maxRetries = 5; // Increased retries
    const delaySeconds = 3; // Increased delay
    List<String> signInMethods = [];

    for (int i = 0; i < maxRetries; i++) {
      signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      print('Retry $i: Sign-in methods for "$email": $signInMethods');
      if (signInMethods.isNotEmpty) break;
      if (i < maxRetries - 1) await Future.delayed(Duration(seconds: delaySeconds));
    }
    return signInMethods;
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isGoogleLoading = true;
      _errorMessage = '';
    });

    try {
      final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
      await googleSignIn.signOut();
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) throw Exception('Google Sign-In cancelled');

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    } finally {
      setState(() => _isGoogleLoading = false);
    }
  }

  Future<void> _resetPassword() async {
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      setState(() => _errorMessage = 'Please enter a valid email');
      return;
    }

    setState(() {
      _isResetLoading = true;
      _errorMessage = '';
    });

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim().toLowerCase());
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Password reset email sent. Check your inbox.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      setState(() => _errorMessage = 'Error sending reset email: ${e.toString()}');
    } finally {
      setState(() => _isResetLoading = false);
    }
  }

  bool _validateInputs() {
    if (!_formKey.currentState!.validate()) return false;
    return true;
  }

  String _formatFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No account found with this email. Please sign up.';
      case 'wrong-password':
        return 'Incorrect password. Try again.';
      case 'email-already-in-use':
        return 'This email is already registered. Please log in.';
      case 'invalid-email':
        return 'Invalid email format.';
      case 'weak-password':
        return 'Password must be at least 6 characters.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return e.message ?? 'An unexpected error occurred.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themeProvider.currentTheme.primaryColor.withOpacity(0.2),
              themeProvider.currentTheme.scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Icon(Icons.currency_bitcoin,
                        size: 80, color: themeProvider.currentTheme.primaryColor),
                    const SizedBox(height: 16),
                    Text(
                      'Crypto Insight',
                      style: themeProvider.currentTheme.textTheme.headlineMedium
                          ?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: themeProvider.currentTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Text(
                              _isLogin ? 'Welcome Back' : 'Create Account',
                              style: themeProvider.currentTheme.textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 24),
                            if (!_isLogin) ...[
                              _buildTextField(
                                  _firstNameController, 'First Name', Icons.person,
                                  validator: (value) => value!.isEmpty
                                      ? 'First name is required'
                                      : null),
                              const SizedBox(height: 16),
                              _buildTextField(
                                  _lastNameController, 'Last Name', Icons.person,
                                  validator: (value) => value!.isEmpty
                                      ? 'Last name is required'
                                      : null),
                              const SizedBox(height: 16),
                            ],
                            _buildTextField(
                              _emailController,
                              'Email',
                              Icons.email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) return 'Email is required';
                                if (!value.contains('@') || !value.contains('.'))
                                  return 'Invalid email format';
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              _passwordController,
                              'Password',
                              Icons.lock,
                              obscureText: _obscurePassword,
                              validator: (value) {
                                if (value!.isEmpty) return 'Password is required';
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () =>
                                    setState(() => _obscurePassword = !_obscurePassword),
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (_errorMessage.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  _errorMessage,
                                  style: TextStyle(
                                      color:
                                          themeProvider.currentTheme.colorScheme.error,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            if (_isLogin)
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: _isResetLoading ? null : _resetPassword,
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: themeProvider.currentTheme.primaryColor),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: _isAuthLoading ? null : _authenticate,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              child: _isAuthLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : Text(_isLogin ? 'Login' : 'Sign Up'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: _isGoogleLoading ? null : _signInWithGoogle,
                      icon: _isGoogleLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.g_mobiledata, size: 24),
                      label: const Text('Continue with Google'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                          _errorMessage = '';
                        });
                      },
                      child: Text(
                        _isLogin ? 'Need an account? Sign Up' : 'Have an account? Login',
                        style:
                            TextStyle(color: themeProvider.currentTheme.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}

//