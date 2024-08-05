import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/trade_data_provider.dart';
import 'screens/trade_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TradeDataProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: TradeScreen(),
      ),
    );
  }
}
