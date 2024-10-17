import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';
// import 'package:g11_appointment_scheduling/views/home_screen.dart';
import 'package:g11_appointment_scheduling/views/signin_screen.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _nameError = false;
  bool _emailError = false;

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
                Image.asset("assets/images/signup.png", width: 90, height: 90),
                SizedBox(height: MediaQuery.of(context).size.height / 60),
                Text(
                  "Create Your Account",
                  style: kMainTitleBoldTextStyle,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 80),
                Text(
                  "x",
                  style: kSmallParaTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                _buildTextInputRow(
                  "First Name",
                  _firstNameController,
                  _lastNameController,
                  _nameError ? "Name cannot be empty" : null,
                ),
                SizedBox(height: 12),
                _buildTextInput(
                    "Email",
                    _emailController,
                    TextInputType.emailAddress,
                    _emailError ? 'Email cannot be empty' : null),
                SizedBox(height: 12),
                _buildPasswordInput(),
                SizedBox(height: 12),
                _buildSignupButton(),
                SizedBox(height: MediaQuery.of(context).size.height / 60),
                _buildSigninOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 150,
          height: 1,
          color: Colors.grey.shade300,
        ),
        Text(
          text,
          style: kSmallParaTextStyle.copyWith(color: Colors.black),
        ),
        Container(
          width: 150,
          height: 1,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }

  Widget _buildTextInputRow(
      String labelText,
      TextEditingController firstController,
      TextEditingController secondController,
      String? errorText) {
    return Row(
      children: [
        Expanded(
          child: _buildTextInput(
              labelText, firstController, TextInputType.text, errorText),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _buildTextInput(
              "Last Name", secondController, TextInputType.text, errorText),
        ),
      ],
    );
  }

  Widget _buildTextInput(String labelText, TextEditingController controller,
      TextInputType keyboardType, String? errorText) {
    return ClipPath(
      clipper: ShapeBorderClipper(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            side: BorderSide(
              color: softGrayStrokeCustomColor,
              width: 2,
            )),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: kSmallParaTextStyle,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blue.shade50,
          labelStyle: kSmallParaTextStyle,
          labelText: labelText,
          border: InputBorder.none,
          errorText: errorText,
          errorStyle:
              kSmallParaTextStyle.copyWith(color: Colors.red, fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return ClipPath(
      clipper: ShapeBorderClipper(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            side: BorderSide(
              color: softGrayStrokeCustomColor,
              width: 2,
            )),
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        style: kSmallParaTextStyle,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blue.shade50,
          labelStyle: kSmallParaTextStyle,
          labelText: 'Password',
          border: InputBorder.none,
          suffixIcon: IconButton(
            color: Colors.black,
            icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSignupButton() {
    return ClipPath(
      clipper: const ShapeBorderClipper(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () async {
            setState(() {
              _nameError = _firstNameController.text.isEmpty;
              _emailError = _emailController.text.isEmpty;
            });

            // if (!_nameError && !_emailError) {
            //   bool? success = await SignInBackend().registerWithEmail(
            //       _emailController.text,
            //       _passwordController.text,
            //       _firstNameController.text,
            //       _lastNameController.text,
            //       context);

            //   if (success != null && success) {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            //   }
            // }
          },
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.46),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(primaryBlueCustomColor),
          ),
          child: Text(
            "Create Account",
            style: kSubHeadingTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget _buildSigninOption() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "Already have an account? ",
              style: kSmallParaTextStyle.copyWith(
                  color: Colors.black, fontSize: 12),
            ),
            TextSpan(
              text: "Sign in",
              style: kSmallParaTextStyle.copyWith(
                  color: Colors.blue, fontSize: 12),
            ),
          ]),
        ),
      ),
    );
  }
}
