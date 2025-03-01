// import 'dart:async';

// import 'package:cryptoinsight/screen.dart/CryptocurrencyChartTab.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:intl/intl.dart';

// import '../service.dart/AIService.dart';
// import '/service.dart/json_and_others.dart';
// import 'package:flutter/material.dart';

// class CryptocurrencyAIInsightsTab extends StatefulWidget {
//   final Cryptocurrency cryptocurrency;

//   const CryptocurrencyAIInsightsTab({Key? key, required this.cryptocurrency}) : super(key: key);

//   @override
//   _CryptocurrencyAIInsightsTabState createState() => _CryptocurrencyAIInsightsTabState();
// }

// class _CryptocurrencyAIInsightsTabState extends State<CryptocurrencyAIInsightsTab> {
//   Map<String, String> aiAnalysis = {
//     'general': 'Collecting Details Wait 2Min...',
//     'news': 'Collecting Details Wait 2Min...',
//     'fundamental': 'Collecting Details Wait 2Min...',
//     'team': 'Collecting Details Wait 2Min...',
//     'technical': 'Collecting Details Wait 2Min...',
//     'sentiment': 'Collecting Details Wait 2Min...',
//     'risk': 'Collecting Details Wait 2Min...',
//   };
//   bool isRefreshing = false;
//   Timer? _autoRefreshTimer;
//   int _failedAttempts = 0;
//   final int _maxRetries = 3;

//   @override
//   void initState() {
//     super.initState();
//     _initializeAnalysis();
//     _setupAutoRefresh();
//   }

//   @override
//   void dispose() {
//     _autoRefreshTimer?.cancel();
//     super.dispose();
//   }

//   void _setupAutoRefresh() {
//     _autoRefreshTimer = Timer.periodic(const Duration(minutes: 30), (_) {
//       if (!isRefreshing && _failedAttempts < _maxRetries) {
//         fetchComprehensiveAnalysis(silent: true);
//       }
//     });
//   }

//   Future<void> _initializeAnalysis() async {
//     await fetchComprehensiveAnalysis();
//     _startPeriodicUpdates();
//   }

//   void _startPeriodicUpdates() {
//     Timer.periodic(const Duration(minutes: 5), (timer) async {
//       if (mounted) {
//         await _updateTimeBasedAnalysis();
//       }
//     });
//   }

//   Future<void> _updateTimeBasedAnalysis() async {
//     try {
//       final technicalAnalysis = await AIService.generateAIResponse(
//         "Generate a real-time technical analysis for ${widget.cryptocurrency.name} focusing on current price action, momentum indicators, and potential support/resistance levels."
//       );
      
//       final sentimentAnalysis = await AIService.generateAIResponse(
//         "Analyze current market sentiment for ${widget.cryptocurrency.name} using social media metrics, news sentiment, and trading volume patterns."
//       );

//       if (mounted) {
//         setState(() {
//           aiAnalysis['technical'] = technicalAnalysis;
//           aiAnalysis['sentiment'] = sentimentAnalysis;
//         });
//       }
//     } catch (e) {
//       print('Failed to update time-based analysis: $e');
//     }
//   }

//   Future<void> fetchComprehensiveAnalysis({bool silent = false}) async {
//     if (isRefreshing) return;

//     setState(() {
//       isRefreshing = true;
//       if (!silent) {
//         aiAnalysis = aiAnalysis.map((k, v) => MapEntry(k, 'Collecting Details Wait 2Min...'));
//       }
//     });

//     try {
//       final analysis = await AIService.generateComprehensiveAnalysis(widget.cryptocurrency);
      
//       // Additional risk analysis
//       final riskAnalysis = await AIService.generateAIResponse(
//         """Provide a comprehensive risk assessment for ${widget.cryptocurrency.name} (${widget.cryptocurrency.symbol}) including:
//         1. Market risk factors
//         2. Technical vulnerabilities
//         3. Regulatory concerns
//         4. Competition analysis
//         5. Volatility metrics
//         6. Liquidity risks
//         7. Correlation with market trends
//         Please provide specific metrics and comparisons where possible."""
//       );

//       if (mounted) {
//         setState(() {
//           aiAnalysis = {
//             ...analysis,
//             'risk': riskAnalysis,
//           };
//           _failedAttempts = 0;
//         });
//       }
//     } catch (e) {
//       _failedAttempts++;
//       if (!silent) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Analysis failed. Attempts remaining: ${_maxRetries - _failedAttempts}'),
//             action: SnackBarAction(
//               label: 'Retry',
//               onPressed: () => fetchComprehensiveAnalysis(),
//             ),
//           ),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() => isRefreshing = false);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: () => fetchComprehensiveAnalysis(),
//       child: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           _buildAIInsights(),
//         ],
//       ),
//     );
//   }

//   Widget _buildAIInsights() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHeader(),
//         const SizedBox(height: 16),
//         ...aiAnalysis.entries.map((entry) => _buildAIInsightCard(
//           entry.key.capitalize(),
//           entry.value,
//           getInsightIcon(entry.key),
//         )).toList(),
//         const SizedBox(height: 16),
//         _buildRefreshButton(),
//       ],
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           'AI Insights',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         if (isRefreshing)
//           const SizedBox(
//             width: 24,
//             height: 24,
//             child: CircularProgressIndicator(strokeWidth: 2),
//           ),
//       ],
//     );
//   }

//   Widget _buildAIInsightCard(String title, String content, IconData icon) {
//     final isLoading = content.contains('Loading') || content.contains('Collecting Details Wait 2Min');
    
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.only(bottom: 16),
//       child: ExpansionTile(
//         leading: Icon(icon, color: Theme.of(context).primaryColor),
//         title: Text(
//           title,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         subtitle: isLoading
//             ? LinearProgressIndicator(
//                 backgroundColor: Colors.grey[200],
//                 valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
//               )
//             : null,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 MarkdownBody(
//                   data: content,
//                   selectable: true,
//                   styleSheet: MarkdownStyleSheet(
//                     p: TextStyle(height: 1.5),
//                     strong: const TextStyle(fontWeight: FontWeight.w600),
//                     blockquote: const TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 if (!isLoading) ...[
//                   const SizedBox(height: 16),
//                   Text(
//                     'Last updated: ${DateFormat('MMM d, y HH:mm').format(DateTime.now())}',
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRefreshButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton.icon(
//         onPressed: isRefreshing ? null : () => fetchComprehensiveAnalysis(),
//         icon: const Icon(Icons.refresh),
//         label: Text(isRefreshing ? 'Collecting Details Wait 2Min...' : 'Refresh All Insights'),
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }

//   IconData getInsightIcon(String type) {
//     switch (type.toLowerCase()) {
//       case 'general':
//         return Icons.analytics_outlined;
//       case 'news':
//         return Icons.newspaper;
//       case 'fundamental':
//         return Icons.foundation;
//       case 'team':
//         return Icons.people_outline;
//       case 'technical':
//         return Icons.show_chart;
//       case 'sentiment':
//         return Icons.mood;
//       case 'risk':
//         return Icons.warning_amber_outlined;
//       default:
//         return Icons.info_outline;
//     }
//   }
// }























// import 'dart:async';
// import 'package:cryptoinsight/service.dart/AIService.dart';
// import 'package:cryptoinsight/service.dart/json_and_others.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:intl/intl.dart';



// class CryptocurrencyAIInsightsTab extends StatefulWidget {
//   final Cryptocurrency cryptocurrency;

//   const CryptocurrencyAIInsightsTab({
//     Key? key, 
//     required this.cryptocurrency
//   }) : super(key: key);

//   @override
//   _CryptocurrencyAIInsightsTabState createState() => _CryptocurrencyAIInsightsTabState();
// }

// class _CryptocurrencyAIInsightsTabState extends State<CryptocurrencyAIInsightsTab> {
//   Map<String, String> aiAnalysis = {
//     'general': 'Collecting Details Wait 2Min...',
//     'news': 'Collecting Details Wait 2Min...',
//     'fundamental': 'Collecting Details Wait 2Min...',
//     'team': 'Collecting Details Wait 2Min...',
//     'technical': 'Collecting Details Wait 2Min...',
//     'sentiment': 'Collecting Details Wait 2Min...',
//     'risk': 'Collecting Details Wait 2Min...',
//   };
//   bool isRefreshing = false;
//   Timer? _autoRefreshTimer;
//   int _failedAttempts = 0;
//   final int _maxRetries = 3;

//   @override
//   void initState() {
//     super.initState();
//     _initializeAnalysis();
//     _setupAutoRefresh();
//   }

//   @override
//   void dispose() {
//     _autoRefreshTimer?.cancel();
//     super.dispose();
//   }

//   void _setupAutoRefresh() {
//     _autoRefreshTimer = Timer.periodic(const Duration(minutes: 30), (_) {
//       if (!isRefreshing && _failedAttempts < _maxRetries) {
//         fetchComprehensiveAnalysis(silent: true);
//       }
//     });
//   }

//   Future<void> _initializeAnalysis() async {
//     await fetchComprehensiveAnalysis();
//     _startPeriodicUpdates();
//   }

//   void _startPeriodicUpdates() {
//     Timer.periodic(const Duration(minutes: 5), (timer) async {
//       if (mounted) {
//         await _updateTimeBasedAnalysis();
//       }
//     });
//   }

//   Future<void> _updateTimeBasedAnalysis() async {
//     try {
//       final technicalAnalysis = await AIService.generateAIResponse(
//         "Generate a real-time technical analysis for ${widget.cryptocurrency.name} focusing on current price action, momentum indicators, and potential support/resistance levels."
//       );
      
//       final sentimentAnalysis = await AIService.generateAIResponse(
//         "Analyze current market sentiment for ${widget.cryptocurrency.name} using social media metrics, news sentiment, and trading volume patterns."
//       );

//       if (mounted) {
//         setState(() {
//           aiAnalysis['technical'] = technicalAnalysis;
//           aiAnalysis['sentiment'] = sentimentAnalysis;
//         });
//       }
//     } catch (e) {
//       print('Failed to update time-based analysis: $e');
//     }
//   }

//   Future<void> fetchComprehensiveAnalysis({bool silent = false}) async {
//     if (isRefreshing) return;

//     setState(() {
//       isRefreshing = true;
//       if (!silent) {
//         aiAnalysis = aiAnalysis.map((k, v) => MapEntry(k, 'Collecting Details Wait 2Min...'));
//       }
//     });

//     try {
//       final analysis = await AIService.generateComprehensiveAnalysis(widget.cryptocurrency);
      
//       final riskAnalysis = await AIService.generateAIResponse(
//         """Provide a comprehensive risk assessment for ${widget.cryptocurrency.name} (${widget.cryptocurrency.symbol}) including:
//         1. Market risk factors
//         2. Technical vulnerabilities
//         3. Regulatory concerns
//         4. Competition analysis
//         5. Volatility metrics
//         6. Liquidity risks
//         7. Correlation with market trends
//         Please provide specific metrics and comparisons where possible."""
//       );

//       if (mounted) {
//         setState(() {
//           aiAnalysis = {
//             ...analysis,
//             'risk': riskAnalysis,
//           };
//           _failedAttempts = 0;
//         });
//       }
//     } catch (e) {
//       _failedAttempts++;
//       if (!silent) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Analysis failed. Attempts remaining: ${_maxRetries - _failedAttempts}'),
//             action: SnackBarAction(
//               label: 'Retry',
//               onPressed: () => fetchComprehensiveAnalysis(),
//             ),
//           ),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() => isRefreshing = false);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: () => fetchComprehensiveAnalysis(),
//       child: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           _buildAIInsights(),
//         ],
//       ),
//     );
//   }

//   Widget _buildAIInsights() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHeader(),
//         const SizedBox(height: 16),
//         ...aiAnalysis.entries.map((entry) => _buildAIInsightCard(
//           entry.key.capitalize(),
//           entry.value,
//           getInsightIcon(entry.key),
//         )).toList(),
//         const SizedBox(height: 16),
//         _buildRefreshButton(),
//       ],
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           'AI Insights',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         if (isRefreshing)
//           const SizedBox(
//             width: 24,
//             height: 24,
//             child: CircularProgressIndicator(strokeWidth: 2),
//           ),
//       ],
//     );
//   }

//   Widget _buildAIInsightCard(String title, String content, IconData icon) {
//     final isLoading = content.contains('Loading') || content.contains('Collecting Details Wait 2Min');
    
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.only(bottom: 16),
//       child: ExpansionTile(
//         leading: Icon(icon, color: Theme.of(context).primaryColor),
//         title: Text(
//           title,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         subtitle: isLoading
//             ? LinearProgressIndicator(
//                 backgroundColor: Colors.grey[200],
//                 valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
//               )
//             : null,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 MarkdownBody(
//                   data: content,
//                   selectable: true,
//                   styleSheet: MarkdownStyleSheet(
//                     p: TextStyle(height: 1.5),
//                     strong: const TextStyle(fontWeight: FontWeight.w600),
//                     blockquote: const TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 if (!isLoading) ...[
//                   const SizedBox(height: 16),
//                   Text(
//                     'Last updated: ${DateFormat('MMM d, y HH:mm').format(DateTime.now())}',
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRefreshButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton.icon(
//         onPressed: isRefreshing ? null : () => fetchComprehensiveAnalysis(),
//         icon: const Icon(Icons.refresh),
//         label: Text(isRefreshing ? 'Collecting Details Wait 2Min...' : 'Refresh All Insights'),
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }

//   IconData getInsightIcon(String type) {
//     switch (type.toLowerCase()) {
//       case 'general':
//         return Icons.analytics_outlined;
//       case 'news':
//         return Icons.newspaper;
//       case 'fundamental':
//         return Icons.foundation;
//       case 'team':
//         return Icons.people_outline;
//       case 'technical':
//         return Icons.show_chart;
//       case 'sentiment':
//         return Icons.mood;
//       case 'risk':
//         return Icons.warning_amber_outlined;
//       default:
//         return Icons.info_outline;
//     }
//   }
// }

// // Extension to capitalize strings
// extension StringExtension on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${substring(1)}";
//   }
// }




















// import 'dart:async';
// import 'package:cryptoinsight/service.dart/AIService.dart';
// import 'package:cryptoinsight/service.dart/json_and_others.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:intl/intl.dart';

// class CryptocurrencyAIInsightsTab extends StatefulWidget {
//   final Cryptocurrency cryptocurrency;

//   const CryptocurrencyAIInsightsTab({
//     Key? key, 
//     required this.cryptocurrency
//   }) : super(key: key);

//   @override
//   _CryptocurrencyAIInsightsTabState createState() => _CryptocurrencyAIInsightsTabState();
// }

// class _CryptocurrencyAIInsightsTabState extends State<CryptocurrencyAIInsightsTab> {
//   final StreamController<Map<String, String>> _analysisController = StreamController.broadcast();
//   final ValueNotifier<bool> _isRefreshing = ValueNotifier<bool>(false);
//   final ValueNotifier<int> _failedAttempts = ValueNotifier<int>(0);
//   static const int _maxRetries = 3;
//   static const Duration _refreshInterval = Duration(minutes: 30);
//   static const Duration _updateInterval = Duration(minutes: 5);
  
//   Timer? _autoRefreshTimer;
//   Timer? _updateTimer;
//   Map<String, String> _currentAnalysis = {};

//   @override
//   void initState() {
//     super.initState();
//     _initializeData();
//   }

//   @override
//   void dispose() {
//     _autoRefreshTimer?.cancel();
//     _updateTimer?.cancel();
//     _analysisController.close();
//     _isRefreshing.dispose();
//     _failedAttempts.dispose();
//     super.dispose();
//   }

//   void _initializeData() {
//     _currentAnalysis = Map.fromEntries(
//       ['general', 'news', 'fundamental', 'team', 'technical', 'sentiment', 'risk']
//           .map((key) => MapEntry(key, 'Loading...'))
//     );
//     _analysisController.add(_currentAnalysis);
    
//     _setupTimers();
//     _fetchInitialData();
//   }

//   void _setupTimers() {
//     _autoRefreshTimer = Timer.periodic(_refreshInterval, (_) => _handleAutoRefresh());
//     _updateTimer = Timer.periodic(_updateInterval, (_) => _updateTimeBasedAnalysis());
//   }

//   Future<void> _fetchInitialData() async {
//     await _fetchComprehensiveAnalysis();
//   }

//   Future<void> _handleAutoRefresh() async {
//     if (!_isRefreshing.value && _failedAttempts.value < _maxRetries) {
//       await _fetchComprehensiveAnalysis(silent: true);
//     }
//   }

//   Future<void> _updateTimeBasedAnalysis() async {
//     if (!mounted) return;

//     try {
//       final responses = await Future.wait([
//         AIService.generateAIResponse(
//           'Technical analysis for ${widget.cryptocurrency.name}: price action, momentum, support/resistance'
//         ),
//         AIService.generateAIResponse(
//           'Market sentiment for ${widget.cryptocurrency.name}: social metrics, news, volume'
//         )
//       ]);

//       if (!mounted) return;

//       _currentAnalysis['technical'] = responses[0];
//       _currentAnalysis['sentiment'] = responses[1];
//       _analysisController.add(_currentAnalysis);
//     } catch (e) {
//       debugPrint('Time-based analysis update failed: $e');
//     }
//   }

//   Future<void> _fetchComprehensiveAnalysis({bool silent = false}) async {
//     if (_isRefreshing.value) return;
//     _isRefreshing.value = true;

//     if (!silent) {
//       _currentAnalysis.updateAll((_, __) => 'Loading...');
//       _analysisController.add(_currentAnalysis);
//     }

//     try {
//       final analysis = await AIService.generateComprehensiveAnalysis(widget.cryptocurrency);
//       final riskAnalysis = await AIService.generateAIResponse(
//         'Risk assessment for ${widget.cryptocurrency.name} (${widget.cryptocurrency.symbol}): market, technical, regulatory, competition, volatility, liquidity risks'
//       );

//       if (!mounted) return;

//       _currentAnalysis = {...analysis, 'risk': riskAnalysis};
//       _analysisController.add(_currentAnalysis);
//       _failedAttempts.value = 0;
//     } catch (e) {
//       _failedAttempts.value++;
//       if (!silent && mounted) {
//         _showErrorSnackbar();
//       }
//     } finally {
//       _isRefreshing.value = false;
//     }
//   }

//   void _showErrorSnackbar() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Analysis failed. Attempts remaining: ${_maxRetries - _failedAttempts.value}'),
//         action: SnackBarAction(
//           label: 'Retry',
//           onPressed: () => _fetchComprehensiveAnalysis(),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: () => _fetchComprehensiveAnalysis(),
//       child: StreamBuilder<Map<String, String>>(
//         stream: _analysisController.stream,
//         initialData: _currentAnalysis,
//         builder: (context, snapshot) {
//           return ListView(
//             padding: const EdgeInsets.all(16),
//             children: [
//               _buildInsightsContent(snapshot.data ?? {}),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildInsightsContent(Map<String, String> analysis) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHeader(),
//         const SizedBox(height: 16),
//         ..._buildInsightCards(analysis),
//         const SizedBox(height: 16),
//         _buildRefreshButton(),
//       ],
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           'AI Insights',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         ValueListenableBuilder<bool>(
//           valueListenable: _isRefreshing,
//           builder: (context, isRefreshing, _) {
//             return isRefreshing
//                 ? const SizedBox(
//                     width: 24,
//                     height: 24,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                 : const SizedBox.shrink();
//           },
//         ),
//       ],
//     );
//   }

//   List<Widget> _buildInsightCards(Map<String, String> analysis) {
//     return analysis.entries.map((entry) {
//       return InsightCard(
//         title: entry.key.capitalize(),
//         content: entry.value,
//         icon: _getInsightIcon(entry.key),
//         lastUpdated: DateTime.now(),
//       );
//     }).toList();
//   }

//   Widget _buildRefreshButton() {
//     return ValueListenableBuilder<bool>(
//       valueListenable: _isRefreshing,
//       builder: (context, isRefreshing, _) {
//         return SizedBox(
//           width: double.infinity,
//           child: ElevatedButton.icon(
//             onPressed: isRefreshing ? null : () => _fetchComprehensiveAnalysis(),
//             icon: const Icon(Icons.refresh),
//             label: Text(isRefreshing ? 'Loading...' : 'Refresh All Insights'),
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   IconData _getInsightIcon(String type) {
//     const icons = {
//       'general': Icons.analytics_outlined,
//       'news': Icons.newspaper,
//       'fundamental': Icons.foundation,
//       'team': Icons.people_outline,
//       'technical': Icons.show_chart,
//       'sentiment': Icons.mood,
//       'risk': Icons.warning_amber_outlined,
//     };
//     return icons[type.toLowerCase()] ?? Icons.info_outline;
//   }
// }

// class InsightCard extends StatelessWidget {
//   final String title;
//   final String content;
//   final IconData icon;
//   final DateTime lastUpdated;

//   const InsightCard({
//     Key? key,
//     required this.title,
//     required this.content,
//     required this.icon,
//     required this.lastUpdated,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final isLoading = content == 'Loading...';

//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.only(bottom: 16),
//       child: ExpansionTile(
//         leading: Icon(icon, color: Theme.of(context).primaryColor),
//         title: Text(
//           title,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         subtitle: isLoading
//             ? LinearProgressIndicator(
//                 backgroundColor: Colors.grey[200],
//                 valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
//               )
//             : null,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 MarkdownBody(
//                   data: content,
//                   selectable: true,
//                   styleSheet: MarkdownStyleSheet(
//                     p: const TextStyle(height: 1.5),
//                     strong: const TextStyle(fontWeight: FontWeight.w600),
//                     blockquote: const TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 if (!isLoading) ...[
//                   const SizedBox(height: 16),
//                   Text(
//                     'Last updated: ${DateFormat('MMM d, y HH:mm').format(lastUpdated)}',
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// extension StringExtension on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${substring(1)}";
//   }
// }




























import 'dart:async';
 import 'package:crypto_insight/service.dart/AIService.dart';
import 'package:crypto_insight/service.dart/json_and_others.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';

class CryptocurrencyAIInsightsTab extends StatefulWidget {
  final Cryptocurrency cryptocurrency;

  const CryptocurrencyAIInsightsTab({
    Key? key, 
    required this.cryptocurrency
  }) : super(key: key);

  @override
  _CryptocurrencyAIInsightsTabState createState() => _CryptocurrencyAIInsightsTabState();
}

class _CryptocurrencyAIInsightsTabState extends State<CryptocurrencyAIInsightsTab> {
  final Map<String, ValueNotifier<InsightData>> insights = {};
  final Set<String> loadingInsights = {};
  Timer? _updateTimer;
  
  @override
  void initState() {
    super.initState();
    _initializeInsights();
    _setupPeriodicUpdates();
  }

  @override
  void dispose() {
    _updateTimer?.cancel();
    for (var notifier in insights.values) {
      notifier.dispose();
    }
    super.dispose();
  }

  void _initializeInsights() {
    for (String type in ['general', 'news', 'fundamental', 'team', 'technical', 'sentiment', 'risk']) {
      insights[type] = ValueNotifier(
        InsightData(
          content: 'Click to load analysis',
          lastUpdated: null,
          isLoaded: false
        )
      );
    }
  }

  void _setupPeriodicUpdates() {
    _updateTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      for (var type in ['technical', 'sentiment']) {
        if (insights[type]?.value.isLoaded ?? false) {
          _loadInsight(type);
        }
      }
    });
  }

  Future<void> _loadInsight(String type) async {
    if (loadingInsights.contains(type)) return;
    
    loadingInsights.add(type);
    insights[type]?.value = InsightData(
      content: 'Loading analysis...',
      lastUpdated: null,
      isLoaded: false
    );

    try {
      String prompt = _getPromptForType(type);
      String analysis = await AIService.generateAIResponse(prompt);
      
      if (!mounted) return;

      insights[type]?.value = InsightData(
        content: analysis,
        lastUpdated: DateTime.now(),
        isLoaded: true
      );
    } catch (e) {
      insights[type]?.value = InsightData(
        content: 'Failed to load analysis. Tap to retry.',
        lastUpdated: null,
        isLoaded: false
      );
    } finally {
      loadingInsights.remove(type);
    }
  }

  String _getPromptForType(String type) {
    final name = widget.cryptocurrency.name;
    final symbol = widget.cryptocurrency.symbol;
    
    switch (type) {
      case 'general':
        return 'Provide general overview analysis for $name ($symbol)';
      case 'news':
        return 'Analyze recent news and developments for $name ($symbol)';
      case 'fundamental':
        return 'Analyze fundamental factors for $name ($symbol)';
      case 'team':
        return 'Evaluate the team and governance structure of $name ($symbol)';
      case 'technical':
        return 'Provide technical analysis for $name ($symbol)';
      case 'sentiment':
        return 'Analyze market sentiment for $name ($symbol)';
      case 'risk':
        return 'Assess risks and challenges for $name ($symbol)';
      default:
        return 'Analyze $name ($symbol)';
    }
  }

  IconData _getInsightIcon(String type) {
    const icons = {
      'general': Icons.analytics_outlined,
      'news': Icons.newspaper,
      'fundamental': Icons.foundation,
      'team': Icons.people_outline,
      'technical': Icons.show_chart,
      'sentiment': Icons.mood,
      'risk': Icons.warning_amber_outlined,
    };
    return icons[type.toLowerCase()] ?? Icons.info_outline;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'AI Insights',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...insights.entries.map((entry) => 
          _buildInsightCard(entry.key, entry.value)
        ).toList(),
      ],
    );
  }

  Widget _buildInsightCard(String type, ValueNotifier<InsightData> insightNotifier) {
    return ValueListenableBuilder<InsightData>(
      valueListenable: insightNotifier,
      builder: (context, insight, _) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.only(bottom: 16),
          child: ExpansionTile(
            leading: Icon(_getInsightIcon(type), color: Theme.of(context).primaryColor),
            title: Text(
              type.capitalize(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onExpansionChanged: (expanded) {
              if (expanded && !insight.isLoaded) {
                _loadInsight(type);
              }
            },
            trailing: loadingInsights.contains(type)
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : null,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MarkdownBody(
                      data: insight.content,
                      selectable: true,
                      styleSheet: MarkdownStyleSheet(
                        p: const TextStyle(height: 1.5),
                        strong: const TextStyle(fontWeight: FontWeight.w600),
                        blockquote: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    if (insight.lastUpdated != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Last updated: ${DateFormat('MMM d, y HH:mm').format(insight.lastUpdated!)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                    if (!insight.isLoaded && !loadingInsights.contains(type)) ...[
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => _loadInsight(type),
                          child: const Text('Load Analysis'),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class InsightData {
  final String content;
  final DateTime? lastUpdated;
  final bool isLoaded;

  InsightData({
    required this.content,
    required this.lastUpdated,
    required this.isLoaded,
  });
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}