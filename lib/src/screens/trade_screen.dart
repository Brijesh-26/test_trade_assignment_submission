import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_test/src/services/websocket_service.dart';
import 'package:trade_test/src/models/trade_data_provider.dart';
import 'package:trade_test/config/constants.dart';

class TradeScreen extends StatefulWidget {
  @override
  TradeScreenState createState() => TradeScreenState();
}

class TradeScreenState extends State<TradeScreen> {
  late WebSocketService _webSocketService;

  @override
  void initState() {
    super.initState();
    _webSocketService = WebSocketService(websocketUrl);
    _webSocketService.stream.listen((Map<String, dynamic> tradeData) {
      final provider = Provider.of<TradeDataProvider>(context, listen: false);
      provider.updatePrice(tradeData['p'] ?? 'No price data');
    }).onError((error) {
      print('WebSocket error: $error');
    });
  }

  @override
  void dispose() {
    _webSocketService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Data')),
      body: Center(
        child: Consumer<TradeDataProvider>(
          builder: (context, provider, child) {
            return ElevatedButton(
              onPressed: () {},
              child: Text('Price: ${provider.latestPrice}'),
            );
          },
        ),
      ),
    );
  }
}
