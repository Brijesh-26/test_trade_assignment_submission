import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/websocket_service.dart';
import '../models/trade_data_provider.dart';

class TradeScreen extends StatefulWidget {
  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  late WebSocketService _webSocketService;

  @override
  void initState() {
    super.initState();
    _webSocketService = WebSocketService('wss://stream.binance.com:9443/ws/btcusdt@trade');
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
      appBar: AppBar(title: Text('Trade Data')),
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
