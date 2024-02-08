import 'package:flutter/material.dart';
import 'package:otp_test/ini_bd.dart';
import 'package:otp_test/model/opt_verify.dart';
import 'package:otp_test/model/otp_sending.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase/supabase.dart';
import 'package:otp_test/widgets/form_widget.dart';


class OTPPage extends StatefulWidget{
  const OTPPage({super.key});
  @override
  State <OTPPage> createState()=> _OTPPageState();
}
class _OTPPageState extends State<OTPPage>{
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 final TextEditingController _confirmPasswordController=TextEditingController();
  final TextEditingController _phoneNumberController =TextEditingController();
/// [userLogin] 
  Future<String?> userLogin({
   required final String email,
    required final String password,
    required final String phone_number,
    required final String confirmPassword,
     required final String full_name,   }) async {
     final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
       phone: phone_number,
      
      
    );
   

   final user = res.user;
    return user?.id;
    }
      @override
  void initState() {
    super.initState();
   
   }

  
  Widget build (BuildContext context){
    return Scaffold(
       body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

      child: Padding(
        padding: EdgeInsets.only(left: 24, top: 70),
        child: SizedBox(
          width: 310,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Text('Create an account',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(58, 58, 58, 1),
                    fontWeight: FontWeight.w500,
                  )),
                
                Text('Complete the sign up process to get started',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(167, 167, 167, 1)
                )),
                
                SizedBox(height: 18),
               
                  TextFieldWidget(
                    isObsText: true,
                    controller: _phoneNumberController,
                  textTitle: 'Phone Number',
                   textTitleColor: Color.fromRGBO(167, 167, 167, 1),
                    textSize: 14,
                    
                     hintText: '+7(999)999-99-99',
                     ),

                  TextFieldWidget(
                    isObsText: true,
                    
                  textTitle: 'Email Address',
                   textTitleColor: Color.fromRGBO(167, 167, 167, 1),
                    textSize: 14,
                
                     hintText: '***********@mail.com', controller: _emailController,
                     ),  

                  TextFieldWidget(
                     isObsText: true,
                  controller: _passwordController,
                  textTitle: 'Password',
                   textTitleColor: Color.fromRGBO(167, 167, 167, 1),
                    textSize: 14,
                    
                     hintText: '**********',
                     ),    

                 TextFieldWidget(
                   isObsText: true,
                  controller: _confirmPasswordController,
                  textTitle: 'Confirm Password',
                   textTitleColor: Color.fromRGBO(167, 167, 167, 1),
                    textSize: 14,
                    
                     hintText: '**********',
                     ),
                     SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                sendOTP('https://wquxefmpfiphpiunbxtf.supabase.co','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndxdXhlZm1wZmlwaHBpdW5ieHRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyNjk0OTQsImV4cCI6MjAyMjg0NTQ5NH0.BBziOz4wLOSw1NQMQcd7te0EUmJkHzZ0z8RtEFFl3YA' ,_emailController.text);
              },
              child: Text('Отправить OTP'),
            ),
              ],
              
            ),
          ),
      )     ),

    );
  }
}