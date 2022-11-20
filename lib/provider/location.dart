import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Location with ChangeNotifier {
  Map<String, dynamic> _location = {};
  Map<String, dynamic> get location {
    return {..._location};
  }

  
  // API call to fetch locations
  Future<void> fetchLocations() async {
    final url = Uri.parse('https://www.nepallocation.com.np/api/v1/city/list');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 96yhhzC-WgEZP-y486YBLfg1',
    });
    final responseData = json.decode(response.body);
    print(responseData['data']);
    _location = responseData['data'];
    notifyListeners();
  }
}
