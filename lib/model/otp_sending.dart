import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wquxefmpfiphpiunbxtf.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndxdXhlZm1wZmlwaHBpdW5ieHRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyNjk0OTQsImV4cCI6MjAyMjg0NTQ5NH0.BBziOz4wLOSw1NQMQcd7te0EUmJkHzZ0z8RtEFFl3YA',);
 
}

 final supabase = Supabase.instance.client; 
 String generateOTP(int length) {
  var generator = Random();
  String otp = '';

  for (var i = 0; i < length; i++) {
    otp += generator.nextInt(10).toString(); 
  }

  return otp;
}

Future<void> sendOTP(String supabaseUrl, String supabaseKey, String email) async {
  // Генерация OTP
  final otp = generateOTP(6); // Длина OTP - 6 цифр

  print('OTP для $email: $otp');

 
  var url = '$supabaseUrl/rest/v1/rpc/send_otp';
  var body = {
    'email': email,
    'otp': otp,
  };
  var response = await http.post(
    Uri.parse(url),
    headers: {
      'apikey': supabaseKey,
      'Authorization': 'Bearer $supabaseKey',
      'Content-Type': 'application/json',
    },
    body: json.encode(body),
  );

  if (response.statusCode == 200) {
    print('OTP отправлен успешно');
  } else {
    print('Ошибка при отправке OTP: ${response.body}');
  }
}