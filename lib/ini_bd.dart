import 'package:flutter/material.dart';
import 'package:otp_test/model/opt_verify.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wquxefmpfiphpiunbxtf.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndxdXhlZm1wZmlwaHBpdW5ieHRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyNjk0OTQsImV4cCI6MjAyMjg0NTQ5NH0.BBziOz4wLOSw1NQMQcd7te0EUmJkHzZ0z8RtEFFl3YA',);
 final supabase = Supabase.instance.client; 
  // await verifyOTP(supabase, 'user@example.com', '123456');
  // Future<void> verifyOTP(SupabaseClient supabase, String email, String token) async {
  // final response = await supabase.auth.verifyOTP(email: email, token: token, type: OtpType.sms,);
  // if (response.error != null) {
  //   print('Ошибка при проверке OTP: ${response.error}');
  // } else {
  //   print('OTP успешно проверен');
  // }
}
 //final supabase = Supabase.instance.client; 