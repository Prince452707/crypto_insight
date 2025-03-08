// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'CryptocurrencyListItem.dart';
// import '/drawer.dart';
// import '/service.dart/json_and_others.dart';
// import '/service.dart/api.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();
//   Cryptocurrency? _searchResult;
//   bool _isLoading = false;
//   Timer? _debounce;
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//     _animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
//   }

//   @override
//   void dispose() {
//     _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     _debounce?.cancel();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       if (_searchController.text.isNotEmpty) {
//         _performSearch(_searchController.text);
//       } else {
//         setState(() => _searchResult = null);
//       }
//     });
//   }

//   Future<void> _performSearch(String query) async {
//     setState(() => _isLoading = true);
//     try {
//       final result = await ApiService.getSearchedCryptocurrency(query);
//       setState(() {
//         _searchResult = result;
//         _isLoading = false;
//       });
//       _animationController.forward(from: 0.0);
//     } catch (e) {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Crypto Insights', style: TextStyle(fontWeight: FontWeight.bold)),
//         elevation: 0,
//       ),
//       drawer: AppDrawer(),
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//               borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
//             ),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search cryptocurrency',
//                 prefixIcon: const Icon(Icons.search, color: Colors.white),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.white.withOpacity(0.2),
//               ),
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//           Expanded(
//             child: _buildSearchResults(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchResults() {
//     if (_isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (_searchResult != null) {
//       return FadeTransition(
//         opacity: _fadeAnimation,
//         child: CryptocurrencyListItem(cryptocurrency: _searchResult!),
//       );
//     } else {
//       return const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.search, size: 64, color: Colors.grey),
//             SizedBox(height: 16),
//             Text(
//               'Search for a cryptocurrency',
//               style: TextStyle(fontSize: 18, color: Colors.grey),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }






















// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'CryptocurrencyListItem.dart';
// import '/drawer.dart'; // Re-added for AppDrawer
// import '/service.dart/json_and_others.dart';
// import '/service.dart/api.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();
//   Cryptocurrency? _searchResult;
//   bool _isLoading = false;
//   Timer? _debounce;
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//     _animationController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
//     _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeOutCubic,
//     ));
//   }

//   @override
//   void dispose() {
//     _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     _debounce?.cancel();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       if (_searchController.text.isNotEmpty) {
//         _performSearch(_searchController.text);
//       } else {
//         setState(() => _searchResult = null);
//       }
//     });
//   }

//   Future<void> _performSearch(String query) async {
//     setState(() => _isLoading = true);
//     try {
//       final result = await ApiService.getSearchedCryptocurrency(query);
//       setState(() {
//         _searchResult = result;
//         _isLoading = false;
//       });
//       _animationController.forward(from: 0.0);
//     } catch (e) {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: AppDrawer(), // Left drawer restored
//       body: CustomScrollView(
//         slivers: [
//           // Sliver AppBar with Centered Title
//           SliverAppBar(
//             expandedHeight: 200.0,
//             floating: true,
//             pinned: true,
//             leading: Builder(
//               builder: (context) => IconButton(
//                 icon: const Icon(Icons.menu, color: Colors.white),
//                 onPressed: () => Scaffold.of(context).openDrawer(),
//               ),
//             ),
//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Theme.of(context).primaryColor,
//                       Theme.of(context).primaryColorDark,
//                     ],
//                   ),
//                 ),
//                 child: SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'CRYPTO INSIGHTS',
//                           style: TextStyle(
//                             fontSize: 32,
//                             fontWeight: FontWeight.w900,
//                             letterSpacing: 2.0,
//                             color: Colors.white,
//                             shadows: [
//                               Shadow(
//                                 color: Theme.of(context).primaryColorDark.withOpacity(0.5),
//                                 offset: const Offset(2, 2),
//                                 blurRadius: 4,
//                               ),
//                             ],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 20),
//                         _buildSearchBar(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Sliver for Results
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: _buildSearchResults(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(50),
//         boxShadow: [
//           BoxShadow(
//             color: Theme.of(context).shadowColor.withOpacity(0.3),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: _searchController,
//         decoration: InputDecoration(
//           hintText: 'Search by name or symbol...',
//           hintStyle: TextStyle(color: Colors.grey.shade600),
//           prefixIcon: const Icon(Icons.search, color: Colors.grey),
//           suffixIcon: _searchController.text.isNotEmpty
//               ? IconButton(
//                   icon: const Icon(Icons.clear, color: Colors.grey),
//                   onPressed: () {
//                     _searchController.clear();
//                     setState(() => _searchResult = null);
//                   },
//                 )
//               : null,
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
//         ),
//         style: const TextStyle(color: Colors.black87),
//       ),
//     );
//   }

//   Widget _buildSearchResults() {
//     if (_isLoading) {
//       return SizedBox(
//         height: MediaQuery.of(context).size.height * 0.6,
//         child: const Center(
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//           ),
//         ),
//       );
//     } else if (_searchResult != null) {
//       return ScaleTransition(
//         scale: _scaleAnimation,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).cardColor,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Theme.of(context).shadowColor.withOpacity(0.15),
//                 blurRadius: 12,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: CryptocurrencyListItem(cryptocurrency: _searchResult!),
//           ),
//         ),
//       );
//     } else {
//       return SizedBox(
//         height: MediaQuery.of(context).size.height * 0.6,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Theme.of(context).primaryColor.withOpacity(0.1),
//                 ),
//                 child: Icon(
//                   Icons.currency_bitcoin,
//                   size: 60,
//                   color: Theme.of(context).primaryColor,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Text(
//                 'Discover Cryptocurrencies',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).textTheme.bodyLarge?.color,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Enter a name or symbol to start exploring',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Theme.of(context).hintColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }












// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'CryptocurrencyListItem.dart';
// import '/drawer.dart';
// import '/service.dart/json_and_others.dart';
// import '/service.dart/api.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();
//   Cryptocurrency? _searchResult;
//   bool _isLoading = false;
//   Timer? _debounce;
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//     _animationController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
//     _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeOutCubic,
//     ));
//   }

//   @override
//   void dispose() {
//     _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     _debounce?.cancel();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       final trimmedQuery = _searchController.text.trim(); // Trim spaces
//       if (trimmedQuery.isNotEmpty) {
//         _performSearch(trimmedQuery);
//       } else {
//         setState(() => _searchResult = null);
//       }
//     });
//   }

//   Future<void> _performSearch(String query) async {
//     setState(() => _isLoading = true);
//     try {
//       final result = await ApiService.getSearchedCryptocurrency(query);
//       setState(() {
//         _searchResult = result;
//         _isLoading = false;
//       });
//       _animationController.forward(from: 0.0);
//     } catch (e) {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: AppDrawer(),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 200.0,
//             floating: true,
//             pinned: true,
//             leading: Builder(
//               builder: (context) => IconButton(
//                 icon: const Icon(Icons.menu, color: Colors.white),
//                 onPressed: () => Scaffold.of(context).openDrawer(),
//               ),
//             ),
//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Theme.of(context).primaryColor,
//                       Theme.of(context).primaryColorDark,
//                     ],
//                   ),
//                 ),
//                 child: SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'CRYPTO INSIGHTS',
//                           style: TextStyle(
//                             fontSize: 32,
//                             fontWeight: FontWeight.w900,
//                             letterSpacing: 2.0,
//                             color: Colors.white,
//                             shadows: [
//                               Shadow(
//                                 color: Theme.of(context).primaryColorDark.withOpacity(0.5),
//                                 offset: const Offset(2, 2),
//                                 blurRadius: 4,
//                               ),
//                             ],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 20),
//                         _buildSearchBar(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: _buildSearchResults(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(50),
//         boxShadow: [
//           BoxShadow(
//             color: Theme.of(context).shadowColor.withOpacity(0.3),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: _searchController,
//         decoration: InputDecoration(
//           hintText: 'Search by name or symbol...',
//           hintStyle: TextStyle(color: Colors.grey.shade600),
//           prefixIcon: const Icon(Icons.search, color: Colors.grey),
//           suffixIcon: _searchController.text.isNotEmpty
//               ? IconButton(
//                   icon: const Icon(Icons.clear, color: Colors.grey),
//                   onPressed: () {
//                     _searchController.clear();
//                     setState(() => _searchResult = null);
//                   },
//                 )
//               : null,
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
//         ),
//         style: const TextStyle(color: Colors.black87),
//       ),
//     );
//   }

//   Widget _buildSearchResults() {
//     if (_isLoading) {
//       return SizedBox(
//         height: MediaQuery.of(context).size.height * 0.6,
//         child: const Center(
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//           ),
//         ),
//       );
//     } else if (_searchResult != null) {
//       return ScaleTransition(
//         scale: _scaleAnimation,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).cardColor,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Theme.of(context).shadowColor.withOpacity(0.15),
//                 blurRadius: 12,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: CryptocurrencyListItem(cryptocurrency: _searchResult!),
//           ),
//         ),
//       );
//     } else {
//       return SizedBox(
//         height: MediaQuery.of(context).size.height * 0.6,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Theme.of(context).primaryColor.withOpacity(0.1),
//                 ),
//                 child: Icon(
//                   Icons.currency_bitcoin,
//                   size: 60,
//                   color: Theme.of(context).primaryColor,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Text(
//                 'Discover Cryptocurrencies',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).textTheme.bodyLarge?.color,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Enter a name or symbol to start exploring',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Theme.of(context).hintColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }











import 'package:flutter/material.dart';
import 'dart:async';
import '../screen.dart/CryptocurrencyListItem.dart';
import 'drawer.dart';
import '/service.dart/json_and_others.dart';
import '/service.dart/api.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  Cryptocurrency? _searchResult;
  bool _isLoading = false;
  Timer? _debounce;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _animationController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final trimmedQuery = _searchController.text.trim();
      if (trimmedQuery.isNotEmpty) {
        _performSearch(trimmedQuery);
      } else {
        setState(() => _searchResult = null);
      }
    });
  }

  Future<void> _performSearch(String query) async {
    setState(() => _isLoading = true);
    try {
      final result = await ApiService.getSearchedCryptocurrency(query);
      setState(() {
        _searchResult = result;
        _isLoading = false;
      });
      _animationController.forward(from: 0.0);
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: [
          
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {
                  // Placeholder for alert action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Alert feature coming soon!')),
                  );
                },
                tooltip: 'Alerts',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorDark,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CRYPTO INSIGHTS',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Theme.of(context).primaryColorDark.withOpacity(0.5),
                                offset: const Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        _buildSearchBar(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildSearchResults(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search by name or symbol...',
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchResult = null);
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
        ),
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_isLoading) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
    } else if (_searchResult != null) {
      return ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CryptocurrencyListItem(cryptocurrency: _searchResult!),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.currency_bitcoin,
                  size: 60,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Discover Cryptocurrencies',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter a name or symbol to start exploring',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}