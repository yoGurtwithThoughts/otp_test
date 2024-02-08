import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:otp_test/model/opt_verify.dart';
import 'package:otp_test/model/otp_sending.dart';
import 'package:http/http.dart' as http;

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wquxefmpfiphpiunbxtf.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndxdXhlZm1wZmlwaHBpdW5ieHRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyNjk0OTQsImV4cCI6MjAyMjg0NTQ5NH0.BBziOz4wLOSw1NQMQcd7te0EUmJkHzZ0z8RtEFFl3YA',);
 final supabase = Supabase.instance.client;
  

  // Отправка OTP
  // await sendOTP(supabase, 'user@example.com');

  // // Проверка OTP
  // await verifyOTP(supabase, 'user@example.com', '123456');

final AuthResponse res = await supabase.auth.verifyOTP(
  type: OtpType.sms,
  token: '111111',
 // phone: '+13334445555',
);

}
// Future<void> sendOTP(SupabaseClient supabase, String email) async {

//   final response = await supabase.auth.signInWithPassword( email: email, password: 'password'); //ошибка может быть в пароле
//   if (response.error != null) {
//     print('Ошибка при отправке ссылки для входа: ${response.error}');
//   } else {
//     print('Ссылка для входа отправлена на $email');
//   }
// }

// Future<void> verifyOTP(SupabaseClient supabase, String email, String token) async {
//   final response = await supabase.auth.verifyOTP(email: email, token: token, type: OtpType.sms,);
//   if (response.error != null) {
//     print('Ошибка при проверке OTP: ${response.error}');
//   } else {
//     print('OTP успешно проверен');
//   }
// }