import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mebelmutiara/app/modules/commons/API/repository.dart';
import 'package:mebelmutiara/app/modules/database/MdlBarang.dart';
import 'package:mebelmutiara/app/modules/database/MdlLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class services {
 
 Future<String> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseURL+loginUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final loginData = MdlLogin.fromJson(jsonDecode(response.body));

        if (loginData.success == true && loginData.data != null) {
          // Simpan token di shared preferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', loginData.data!.token ?? '');

          return loginData.data!.token ?? '';
        } else {
          throw Exception(loginData.message ?? 'Failed to login');
        }
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  // ================================Get Barang===============================

  Future<GetBarang?> fetchBarang() async {
    try {
      final token = await getToken();
      final response = await http.get(
        Uri.parse(baseURL + GetBarangData),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return GetBarang.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load barang: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}