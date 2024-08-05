import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel;

  WebSocketService(String url) : _channel = WebSocketChannel.connect(Uri.parse(url));

  Stream<Map<String, dynamic>> get stream {
    return _channel.stream.map((data) {
      try {
        return jsonDecode(data) as Map<String, dynamic>;
      } catch (e) {
        return {};
      }
    });
  }

  void dispose() {
    _channel.sink.close();
  }
}
