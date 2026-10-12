import 'dart:convert';
import 'package:http/http.dart' as http;

class ConfigService {
  static const String configUrl = "https://raw.githubusercontent.com/gajelas0196-lgtm/BaseURL/main/config.json";

  static Map<String, dynamic>? config;

  static Future<bool> loadConfig() async { // <-- Ubah jadi Future<bool>
    try {
      final response = await http.get(Uri.parse(configUrl));
      if (response.statusCode == 200) {
        config = jsonDecode(response.body);
        print("Config loaded: ${config!['app']['name']}");
        return true; // <-- Tambahkan ini
      } else {
        print("Failed to load config: ${response.statusCode}");
        return false; // <-- Tambahkan ini
      }
    } catch (e) {
      print("Error: $e");
      return false; // <-- Tambahkan ini
    }
  }
}