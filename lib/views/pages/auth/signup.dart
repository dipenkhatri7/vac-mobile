import 'package:flutter/material.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/services/authServices.dart';
import 'package:vac/views/pages/auth/widget/custom_text_field.dart';
import 'package:vac/views/pages/auth/widget/custom_text_field_container.dart';
import 'package:vac/views/pages/home.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  TextEditingController nameTEC = TextEditingController();
  AuthServices authServices = AuthServices();

  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vāc",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                      width: 20,
                    ),
                  ),
                  Text(
                    "वाच",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Esports like never before",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(251, 251, 255, 0.75),
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: GlobalVariable.height * 0.3,
              child: Image(
                image: AssetImage('assets/images/signupimg.png'),
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFieldContainer(
                    text: "Name",
                    textField: CustomTextField(
                      controller: nameTEC,
                      hintText: "Enter your name",
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      isPassword: false,
                    ),
                  ),
                  verticalSpace(5),
                  CustomTextFieldContainer(
                    text: "Email",
                    textField: CustomTextField(
                      controller: emailTEC,
                      hintText: "Enter your email",
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      isPassword: false,
                    ),
                  ),
                  verticalSpace(5),
                  CustomTextFieldContainer(
                    text: "Create Password",
                    textField: CustomTextField(
                      controller: passwordTEC,
                      hintText: "Enter your password",
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      isPassword: false,
                    ),
                  ),
                  verticalSpace(20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffF2F4FF),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (emailTEC.text.isNotEmpty &&
                            passwordTEC.text.isNotEmpty &&
                            nameTEC.text.isNotEmpty) {
                          authServices.singnUpUser(
                              context: context,
                              email: emailTEC.text,
                              password: passwordTEC.text,
                              name: nameTEC.text);
                        }
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
