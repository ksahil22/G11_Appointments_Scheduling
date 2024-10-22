import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';
import 'package:g11_appointment_scheduling/firebase_auth/user_auth_service.dart';
import 'package:g11_appointment_scheduling/views/home_screen.dart';
import 'package:g11_appointment_scheduling/views/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _emailError = false;
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/signin.png", width: 90, height: 90),
                SizedBox(height: MediaQuery.of(context).size.height / 60),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                  child: Text(
                    "Sign In",
                    style: kMainTitleBoldTextStyle,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 80),
                Text(
                  "Join us and explore the new horizons!",
                  style: kSmallParaTextStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      labelStyle: kSmallParaTextStyle,
                      labelText: 'Email',
                      border: InputBorder.none, // Remove the border
                      errorText: _emailError ? 'Email cannot be empty' : null,
                      errorStyle: kSmallParaTextStyle.copyWith(
                          color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      labelStyle: kSmallParaTextStyle,
                      labelText: 'Password',
                      border: InputBorder.none, // Remove the border
                      suffixIcon: IconButton(
                        color: Colors.black,
                        icon: Icon(_obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                ClipPath(
                  clipper: const ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async{
                        setState(() {
                          _emailError = _emailController.text.isEmpty;
                        });
                        String email = _emailController.value.text;
                          String password = _passwordController.value.text;
                        if (email.isNotEmpty && password.isNotEmpty) {
                            bool? loggedIn = await SignInBackend()
                                .loginWithEmail(email, password, context);}
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.46),
                          ),
                        ),
                        backgroundColor:
                            WidgetStateProperty.all(primaryBlueCustomColor),
                      ),
                      child: Text(
                        "Log In",
                        style: kSubHeadingTextStyle.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 60),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: "Don't have account?",
                          style: kSmallParaTextStyle.copyWith(
                              color: Colors.black, fontSize: 12),
                        ),
                        TextSpan(
                          text: "Sign Up",
                          style: kSmallParaTextStyle.copyWith(
                              color: Colors.blue, fontSize: 12),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
