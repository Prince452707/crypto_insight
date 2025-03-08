import 'package:url_launcher/url_launcher.dart';
import "package:flutter/material.dart";

// Add HelpSupportScreen class
class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'cryptoforyouhelp@gmail.com', // Replace with your support email
      queryParameters: {
        'subject': 'Help & Support Request',
        'body': 'Please describe your issue or question here...'
      },
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        throw 'Could not launch email client';
      }
    } catch (e) {
      // Handle error - you might want to show a snackbar or dialog here
      print('Error launching email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchEmail,
          child: const Text('Contact Support'),
        ),
      ),
    );
  }
}