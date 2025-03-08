import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/service.dart/api.dart';
import '/service.dart/json_and_others.dart';
import '../screen.dart/CryptocurrencyDetailScreen.dart';

class BookmarksScreen extends StatefulWidget {
  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  List<Cryptocurrency> bookmarkedCryptos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBookmarkedCryptos();
  }

  Future<void> _loadBookmarkedCryptos() async {
    setState(() => isLoading = true);
    final prefs = await SharedPreferences.getInstance();
    final bookmarkedIds = prefs.getStringList('bookmarked_crypto_ids') ?? [];

    if (bookmarkedIds.isEmpty) {
      setState(() {
        bookmarkedCryptos = [];
        isLoading = false;
      });
      return;
    }

    try {
      final cryptos = await ApiService.getMultipleCryptocurrencies(bookmarkedIds);
      setState(() {
        bookmarkedCryptos = cryptos;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load bookmarked cryptocurrencies'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
            )
          : bookmarkedCryptos.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 64,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No Bookmarks Yet',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Bookmark cryptocurrencies to see them here!',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: bookmarkedCryptos.length,
                  itemBuilder: (context, index) {
                    final crypto = bookmarkedCryptos[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(crypto.image),
                        radius: 20,
                      ),
                      title: Text(crypto.name),
                      subtitle: Text(crypto.symbol.toUpperCase()),
                      trailing: Text(
                        '\$${NumberFormat("#,##0.00").format(crypto.price)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CryptocurrencyDetailScreen(cryptocurrency: crypto),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}