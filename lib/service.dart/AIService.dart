
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'dart:async';
// import 'package:intl/intl.dart';
// import 'json_and_others.dart';



// class AIService {
//   static const String apiKey = 'AIzaSyALPelkD_VVKoYNVzk1XuKadvpDayOQw1Y';
//   static final model = GenerativeModel(
//     model: 'gemini-2.0-flash',
//     apiKey: apiKey,
//   );

//   static Future<String> generateAIResponse(String prompt) async {
//     try {
//       final content = [Content.text(prompt)];
//       final response = await model.generateContent(content);
//       if (response.text != null && response.text!.isNotEmpty) {
//         return response.text!;
//       } else {
//         return 'No response generated';
//       }
//     } catch (e) {
//       return 'Error generating response: $e';
//     }
//   }

//   static Future<Map<String, String>> generateComprehensiveAnalysis(Cryptocurrency crypto) async {
//     Map<String, String> analysis = {};
//     String currentDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

//     analysis['general'] = await generateAIResponse(
//       "Provide a comprehensive general analysis of ${crypto.name} (${crypto.symbol}) in the cryptocurrency market as of $currentDate. Include:\n"
//       "1. Current price: \$${crypto.price.toStringAsFixed(2)} - compare this to 7-day and 30-day averages\n"
//       "2. Market cap: \$${crypto.marketCap.toStringAsFixed(2)} - discuss its rank and recent changes\n"
//       "3. 24-hour trading volume and how it compares to the 7-day average\n"
//       "4. Recent performance: 24h, 7d, and 30d price changes (in percentages)\n"
//       "5. Current market dominance and comparison to major cryptocurrencies\n"
//       "6. Brief overview of on-chain metrics (e.g., active addresses, transaction count) if applicable\n"
//       "7. General market sentiment towards ${crypto.name} based on recent events\n"
//       "Provide specific numbers and percentages where possible, and focus on data from the last 30 days."
//     );

//     analysis['news'] = await generateAIResponse(
//       "Summarize the most recent news and developments for ${crypto.name} (${crypto.symbol}) as of $currentDate. Include:\n"
//       "1. Major announcements or events from the past 7 days, with exact dates\n"
//       "2. Any significant partnerships or collaborations revealed in the last 30 days\n"
//       "3. Recent protocol upgrades or technological advancements, specifying implementation dates\n"
//       "4. Regulatory news or legal developments affecting ${crypto.name} in the past month\n"
//       "5. Notable mentions of ${crypto.name} by industry leaders or influential figures (quote if possible)\n"
//       "6. Upcoming events in the next 14 days that could impact ${crypto.name}'s value\n"
//       "7. Any changes in ${crypto.name}'s ecosystem (e.g., DeFi, NFTs) in the last 30 days\n"
//       "8. Comparison of recent news to its main competitors\n"
//       "Prioritize the most impactful and recent news items. For each point, provide the date of occurrence or announcement."
//     );

//     analysis['fundamental'] = await generateAIResponse(
//       "Analyze the current fundamental aspects of ${crypto.name} (${crypto.symbol}) as of $currentDate. Cover:\n"
//       "1. Latest technological updates or changes to the protocol\n"
//       "2. Most recent partnerships or adoption metrics\n"
//       "3. Upcoming events or releases in the next 30 days\n"
//       "4. Current market sentiment and social media buzz\n"
//       "5. Any recent regulatory news affecting ${crypto.name}\n"
//       "Provide a comprehensive A to Z fundamental analysis of ${crypto.name} (${crypto.symbol}) as of $currentDate. Cover:\n"
// "1. Architecture: Explain the blockchain architecture and consensus mechanism\n"
// "2. Business model: Describe the project's business model and value proposition\n"
// "3. Competitive landscape: Compare with similar projects in the market\n"
// "4. Developer activity: Recent GitHub commits, contributors, and development progress\n"
// "5. Economic model: Token economics, distribution, and inflation/deflation mechanisms\n"
// "6. Funding: Initial and ongoing funding, including venture capital investments\n"
// "7. Governance: Decision-making processes and community involvement\n"
// "8. Hash rate (for PoW) or Staking statistics (for PoS): Network security metrics\n"
// "9. Innovations: Unique features or technological advancements\n"
// "10. Joint ventures and partnerships: Recent and significant collaborations\n"
// "11. Key team members: Backgrounds of founders and core team\n"
// "12. Liquidity: Trading volume across exchanges and DeFi protocols\n"
// "13. Market adoption: Real-world use cases and user growth metrics\n"
// "14. Network effects: How the project benefits from increased adoption\n"
// "15. On-chain metrics: Active addresses, transaction count, and network usage\n"
// "16. Planned upgrades: Roadmap and upcoming protocol changes\n"
// "17. Quality of documentation: Whitepaper, technical docs, and community resources\n"
// "18. Regulatory compliance: Legal status and compliance efforts\n"
// "19. Scalability: Current and planned solutions for network scaling\n"
// "20. Tokenomics: Detailed analysis of token utility and economic design\n"
// "21. Use cases: Current and potential applications of the technology\n"
// "22. Vulnerabilities: Known security issues or potential attack vectors\n"
// "23. Wallet ecosystem: Available storage solutions and integrations\n"
// "24. X-factor: Unique selling points or competitive advantages\n"
// "25. Yield opportunities: Staking, farming, or other reward mechanisms\n"
// "26. Zero-knowledge proofs (if applicable): Privacy features and implementations\n"
// "Prioritize the most relevant and recent information. Provide specific data points, dates, and metrics where possible."
//       "Prioritize information from the last 30 days and specify dates for any mentioned events or updates."
//     );

//     analysis['team'] = await generateAIResponse(
//       "Deliver a comprehensive report on the current team behind ${crypto.name} (${crypto.symbol}) as of $currentDate. Include:\n"
//       "1. Detailed profiles of key team members (at least 5), including their roles, professional backgrounds, and notable achievements\n"
//       "2. Recent changes in leadership or significant hires in the last 6 months\n"
//       "3. Team's latest public appearances, interviews, or statements (provide dates)\n"
//       "4. Ongoing projects or initiatives led by specific team members\n"
//       "5. Any controversies or praised actions involving team members in the last year\n"
//       "6. Assessment of the team's transparency and communication with the community\n"
//       "7. Comparison of the team's expertise with that of competitor projects\n"
//       "Provide specific dates for any mentioned events or changes and focus on the most recent information available."
//     );

//     return analysis;
//   }
// }




















// import 'package:crypto_insight/service.dart/json_and_others.dart';

// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'dart:async';
// import 'package:intl/intl.dart';


// class AIService {
//   static const String apiKey = 'AIzaSyALPelkD_VVKoYNVzk1XuKadvpDayOQw1Y';
//   static final model = GenerativeModel(
//     model: 'gemini-2.0-flash',
//     apiKey: apiKey,
//   );

//   static Future<String> generateAIResponse(String prompt) async {
//     try {
//       final content = [Content.text(prompt)];
//       final response = await model.generateContent(content);
//       return response.text ?? 'No response generated';
//     } catch (e) {
//       return 'Error generating response: $e';
//     }
//   }

//   static Future<Map<String, String>> generateComprehensiveAnalysis(Cryptocurrency crypto) async {
//     final Map<String, String> analysis = {};
//     final currentDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

//     // General Analysis
//     analysis['general'] = await generateAIResponse(
//            "Provide a comprehensive general analysis of ${crypto.name} (${crypto.symbol}) in the cryptocurrency market as of $currentDate. Include:\n"
//       "1. Current price: \$${crypto.price.toStringAsFixed(2)} - compare this to 7-day and 30-day averages\n"
//       "2. Market cap: \$${crypto.marketCap.toStringAsFixed(2)} - discuss its rank and recent changes\n"
//       "3. 24-hour trading volume and how it compares to the 7-day average\n"
//       "4. Recent performance: 24h, 7d, and 30d price changes (in percentages)\n"
//       "5. Current market dominance and comparison to major cryptocurrencies\n"
//       "6. Brief overview of on-chain metrics (e.g., active addresses, transaction count) if applicable\n"
//       "7. General market sentiment towards ${crypto.name} based on recent events\n"
//       "Provide specific numbers and percentages where possible, and focus on data from the last 30 days."
//     );

//     // News Analysis
//     analysis['news'] = await generateAIResponse(
//       "Summarize the most recent news and developments for ${crypto.name} (${crypto.symbol}) as of $currentDate. Include:\n"
//       "1. Major announcements or events from the past 7 days, with exact dates\n"
//       "2. Any significant partnerships or collaborations revealed in the last 30 days\n"
//       "3. Recent protocol upgrades or technological advancements, specifying implementation dates\n"
//       "4. Regulatory news or legal developments affecting ${crypto.name} in the past month\n"
//       "5. Notable mentions of ${crypto.name} by industry leaders or influential figures (quote if possible)\n"
//       "6. Upcoming events in the next 14 days that could impact ${crypto.name}'s value\n"
//       "7. Any changes in ${crypto.name}'s ecosystem (e.g., DeFi, NFTs) in the last 30 days\n"
//       "8. Comparison of recent news to its main competitors\n"
//       "Prioritize the most impactful and recent news items. For each point, provide the date of occurrence or announcement."
//     );

//     // Fundamental Analysis
//     analysis['fundamental'] = await generateAIResponse(
//       "Analyze the current fundamental aspects of ${crypto.name} (${crypto.symbol}) as of $currentDate. Cover:\n"
//       "1. Latest technological updates or changes to the protocol\n"
//       "2. Most recent partnerships or adoption metrics\n"
//       "3. Upcoming events or releases in the next 30 days\n"
//       "4. Current market sentiment and social media buzz\n"
//       "5. Any recent regulatory news affecting ${crypto.name}\n"
//       "Provide a comprehensive A to Z fundamental analysis of ${crypto.name} (${crypto.symbol}) as of $currentDate. Cover:\n"
// "1. Architecture: Explain the blockchain architecture and consensus mechanism\n"
// "2. Business model: Describe the project's business model and value proposition\n"
// "3. Competitive landscape: Compare with similar projects in the market\n"
// "4. Developer activity: Recent GitHub commits, contributors, and development progress\n"
// "5. Economic model: Token economics, distribution, and inflation/deflation mechanisms\n"
// "6. Funding: Initial and ongoing funding, including venture capital investments\n"
// "7. Governance: Decision-making processes and community involvement\n"
// "8. Hash rate (for PoW) or Staking statistics (for PoS): Network security metrics\n"
// "9. Innovations: Unique features or technological advancements\n"
// "10. Joint ventures and partnerships: Recent and significant collaborations\n"
// "11. Key team members: Backgrounds of founders and core team\n"
// "12. Liquidity: Trading volume across exchanges and DeFi protocols\n"
// "13. Market adoption: Real-world use cases and user growth metrics\n"
// "14. Network effects: How the project benefits from increased adoption\n"
// "15. On-chain metrics: Active addresses, transaction count, and network usage\n"
// "16. Planned upgrades: Roadmap and upcoming protocol changes\n"
// "17. Quality of documentation: Whitepaper, technical docs, and community resources\n"
// "18. Regulatory compliance: Legal status and compliance efforts\n"
// "19. Scalability: Current and planned solutions for network scaling\n"
// "20. Tokenomics: Detailed analysis of token utility and economic design\n"
// "21. Use cases: Current and potential applications of the technology\n"
// "22. Vulnerabilities: Known security issues or potential attack vectors\n"
// "23. Wallet ecosystem: Available storage solutions and integrations\n"
// "24. X-factor: Unique selling points or competitive advantages\n"
// "25. Yield opportunities: Staking, farming, or other reward mechanisms\n"
// "26. Zero-knowledge proofs (if applicable): Privacy features and implementations\n"
// "Prioritize the most relevant and recent information. Provide specific data points, dates, and metrics where possible."
//       "Prioritize information from the last 30 days and specify dates for any mentioned events or updates."
//     );

//     // Team Analysis
//     analysis['team'] = await generateAIResponse(
// "Deliver a comprehensive report on the current team behind ${crypto.name} (${crypto.symbol}) as of $currentDate. Include:\n"
//       "1. Detailed profiles of key team members (at least 5), including their roles, professional backgrounds, and notable achievements\n"
//       "2. Recent changes in leadership or significant hires in the last 6 months\n"
//       "3. Team's latest public appearances, interviews, or statements (provide dates)\n"
//       "4. Ongoing projects or initiatives led by specific team members\n"
//       "5. Any controversies or praised actions involving team members in the last year\n"
//       "6. Assessment of the team's transparency and communication with the community\n"
//       "7. Comparison of the team's expertise with that of competitor projects\n"
//       "Provide specific dates for any mentioned events or changes and focus on the most recent information available."
//     );

//     // Technical Analysis (for real-time updates)
//     analysis['technical'] = await generateAIResponse(
//       """Generate a real-time technical analysis for ${crypto.name} focusing on:
//       1. Current price action and trends
//       2. Key support and resistance levels
//       3. Moving averages and crossovers
//       4. Volume analysis and patterns
//       5. Momentum indicators (RSI, MACD)
//       6. Chart patterns and formations
//       7. Short-term and medium-term predictions
//       Use specific price levels and dates where applicable."""
//     );

//     // Sentiment Analysis (for real-time updates)
//     analysis['sentiment'] = await generateAIResponse(
//       """Analyze current market sentiment for ${crypto.name} using:
//       1. Social media metrics and trends
//       2. News sentiment analysis
//       3. Trading volume patterns
//       4. Fear and Greed indicators
//       5. Community engagement metrics
//       6. Institutional interest signals
//       7. Market maker activity
//       Provide quantitative metrics where possible."""
//     );

//     // Risk Analysis
//     analysis['risk'] = await generateAIResponse(
//       """Provide a comprehensive risk assessment for ${crypto.name} (${crypto.symbol}) including:
//       1. Market risk factors
//       2. Technical vulnerabilities
//       3. Regulatory concerns
//       4. Competition analysis
//       5. Volatility metrics
//       6. Liquidity risks
//       7. Correlation with market trends
//       Please provide specific metrics and comparisons where possible."""
//     );

//     return analysis;
//   }
// }




















import 'package:crypto_insight/service.dart/json_and_others.dart'; // Assuming this contains the Cryptocurrency class
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart'; // For FlSpot

class AIService {
  static const String apiKey = 'AIzaSyALPelkD_VVKoYNVzk1XuKadvpDayOQw1Y';
  static final model = GenerativeModel(
    model: 'gemini-2.0-flash', // Note: This is a placeholder; ensure the correct model name
    apiKey: apiKey,
  );

  static Future<String> generateAIResponse(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      return response.text ?? 'No response generated';
    } catch (e) {
      return 'Error generating response: $e';
    }
  }

  static Future<Map<String, String>> generateComprehensiveAnalysis(
    Cryptocurrency crypto,
    List<FlSpot> priceData,
    int days,
  ) async {
    final Map<String, String> analysis = {};
    final currentDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    // General Analysis
    analysis['general'] = await generateAIResponse(
      "Provide a comprehensive general analysis of ${crypto.name} (${crypto.symbol}) in the cryptocurrency market as of $currentDate. Include:\n"
      "1. Current price: \$${crypto.price.toStringAsFixed(2)} - compare this to 7-day and 30-day averages\n"
      "2. Market cap: \$${crypto.marketCap.toStringAsFixed(2)} - discuss its rank and recent changes\n"
      "3. 24-hour trading volume and how it compares to the 7-day average\n"
      "4. Recent performance: 24h, 7d, and 30d price changes (in percentages)\n"
      "5. Current market dominance and comparison to major cryptocurrencies\n"
      "6. Brief overview of on-chain metrics (e.g., active addresses, transaction count) if applicable\n"
      "7. General market sentiment towards ${crypto.name} based on recent events\n"
      "Provide specific numbers and percentages where possible, and focus on data from the last 30 days."
    );

    // News Analysis
    analysis['news'] = await generateAIResponse(
      "Summarize the most recent news and developments for ${crypto.name} (${crypto.symbol}) as of $currentDate. Include:\n"
      "1. Major announcements or events from the past 7 days, with exact dates\n"
      "2. Any significant partnerships or collaborations revealed in the last 30 days\n"
      "3. Recent protocol upgrades or technological advancements, specifying implementation dates\n"
      "4. Regulatory news or legal developments affecting ${crypto.name} in the past month\n"
      "5. Notable mentions of ${crypto.name} by industry leaders or influential figures (quote if possible)\n"
      "6. Upcoming events in the next 14 days that could impact ${crypto.name}'s value\n"
      "7. Any changes in ${crypto.name}'s ecosystem (e.g., DeFi, NFTs) in the last 30 days\n"
      "8. Comparison of recent news to its main competitors\n"
      "Prioritize the most impactful and recent news items. For each point, provide the date of occurrence or announcement."
    );

    // Fundamental Analysis
    analysis['fundamental'] = await generateAIResponse(
      "Analyze the current fundamental aspects of ${crypto.name} (${crypto.symbol}) as of $currentDate. Cover:\n"
      "1. Latest technological updates or changes to the protocol\n"
      "2. Most recent partnerships or adoption metrics\n"
      "3. Upcoming events or releases in the next 30 days\n"
      "4. Current market sentiment and social media buzz\n"
      "5. Any recent regulatory news affecting ${crypto.name}\n"
      "Provide a comprehensive A to Z fundamental analysis of ${crypto.name} (${crypto.symbol}) as of $currentDate. Cover:\n"
      "1. Architecture: Explain the blockchain architecture and consensus mechanism\n"
      "2. Business model: Describe the project's business model and value proposition\n"
      "3. Competitive landscape: Compare with similar projects in the market\n"
      "4. Developer activity: Recent GitHub commits, contributors, and development progress\n"
      "5. Economic model: Token economics, distribution, and inflation/deflation mechanisms\n"
      "6. Funding: Initial and ongoing funding, including venture capital investments\n"
      "7. Governance: Decision-making processes and community involvement\n"
      "8. Hash rate (for PoW) or Staking statistics (for PoS): Network security metrics\n"
      "9. Innovations: Unique features or technological advancements\n"
      "10. Joint ventures and partnerships: Recent and significant collaborations\n"
      "11. Key team members: Backgrounds of founders and core team\n"
      "12. Liquidity: Trading volume across exchanges and DeFi protocols\n"
      "13. Market adoption: Real-world use cases and user growth metrics\n"
      "14. Network effects: How the project benefits from increased adoption\n"
      "15. On-chain metrics: Active addresses, transaction count, and network usage\n"
      "16. Planned upgrades: Roadmap and upcoming protocol changes\n"
      "17. Quality of documentation: Whitepaper, technical docs, and community resources\n"
      "18. Regulatory compliance: Legal status and compliance efforts\n"
      "19. Scalability: Current and planned solutions for network scaling\n"
      "20. Tokenomics: Detailed analysis of token utility and economic design\n"
      "21. Use cases: Current and potential applications of the technology\n"
      "22. Vulnerabilities: Known security issues or potential attack vectors\n"
      "23. Wallet ecosystem: Available storage solutions and integrations\n"
      "24. X-factor: Unique selling points or competitive advantages\n"
      "25. Yield opportunities: Staking, farming, or other reward mechanisms\n"
      "26. Zero-knowledge proofs (if applicable): Privacy features and implementations\n"
      "Prioritize the most relevant and recent information. Provide specific data points, dates, and metrics where possible."
    );

    // Team Analysis
    analysis['team'] = await generateAIResponse(
      "Deliver a comprehensive report on the current team behind ${crypto.name} (${crypto.symbol}) as of $currentDate. Include:\n"
      "1. Detailed profiles of key team members (at least 5), including their roles, professional backgrounds, and notable achievements\n"
      "2. Recent changes in leadership or significant hires in the last 6 months\n"
      "3. Team's latest public appearances, interviews, or statements (provide dates)\n"
      "4. Ongoing projects or initiatives led by specific team members\n"
      "5. Any controversies or praised actions involving team members in the last year\n"
      "6. Assessment of the team's transparency and communication with the community\n"
      "7. Comparison of the team's expertise with that of competitor projects\n"
      "Provide specific dates for any mentioned events or changes and focus on the most recent information available."
    );

    // Technical Analysis
    analysis['technical'] = await generateAIResponse(
      """Generate a real-time technical analysis for ${crypto.name} focusing on:
      1. Current price action and trends
      2. Key support and resistance levels
      3. Moving averages and crossovers
      4. Volume analysis and patterns
      5. Momentum indicators (RSI, MACD)
      6. Chart patterns and formations
      7. Short-term and medium-term predictions
      Use specific price levels and dates where applicable."""
    );

    // Sentiment Analysis
    analysis['sentiment'] = await generateAIResponse(
      """Analyze current market sentiment for ${crypto.name} using:
      1. Social media metrics and trends
      2. News sentiment analysis
      3. Trading volume patterns
      4. Fear and Greed indicators
      5. Community engagement metrics
      6. Institutional interest signals
      7. Market maker activity
      Provide quantitative metrics where possible."""
    );

    // Risk Analysis
    analysis['risk'] = await generateAIResponse(
      """Provide a comprehensive risk assessment for ${crypto.name} (${crypto.symbol}) including:
      1. Market risk factors
      2. Technical vulnerabilities
      3. Regulatory concerns
      4. Competition analysis
      5. Volatility metrics
      6. Liquidity risks
      7. Correlation with market trends
      Please provide specific metrics and comparisons where possible."""
    );

    // Predictive Analysis
    analysis['prediction'] = await generateAIResponse(
      """Generate a predictive analysis for ${crypto.name} (${crypto.symbol}) based on the following historical price data over the last $days days as of $currentDate:
      Price Data (timestamp in milliseconds since epoch, price in USD):
      ${priceData.map((spot) => '[${DateTime.fromMillisecondsSinceEpoch(spot.x.toInt()).toIso8601String()}, \$${spot.y.toStringAsFixed(2)}]').join('\n')}
      
      Provide:
      1. Short-term price prediction (next 7 days) with specific price targets
      2. Medium-term price prediction (next 30 days) with specific price targets
      3. Key factors influencing the predictions (e.g., trends, volatility, external events)
      4. Confidence level for each prediction (as a percentage)
      5. Potential support and resistance levels based on the data
      6. Any detected patterns (e.g., uptrend, downtrend, consolidation)
      Use the provided price data to identify trends and make informed predictions. Include specific price levels and dates where applicable."""
    );

    return analysis;
  }
}