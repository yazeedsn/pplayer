import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pplayer/components/scaffold_with_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Image.asset('assets/images/logo.png'),
            ),
            Column(
              children: const [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Login to continue Radio App',
                  style: TextStyle(
                    color: Color(0xFF7B7B8B),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                hintText: 'Email Address',
                hintStyle: TextStyle(
                  color: Color(0xFF7477A0),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Color(0xFF7477A0),
                  size: 16,
                ),
                filled: true,
                fillColor: Color(0xFF1D192C),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Color(0xFF7477A0),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Color(0xFF7477A0),
                  size: 16,
                ),
                filled: true,
                fillColor: Color(0xFF1D192C),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: Checkbox(
                      value: true,
                      fillColor:
                          MaterialStateProperty.all(const Color(0xFF1D192C)),
                      checkColor: const Color(0xFF7477A0),
                      visualDensity: VisualDensity.compact,
                      shape: const CircleBorder(),
                      onChanged: (value) {}),
                ),
                const Text(
                  'Rememeber me',
                  style: TextStyle(
                    color: Color(0xFF5C5E6F),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Expanded(child: SizedBox(width: 1)),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF5C5E6F),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              child: Container(
                width: double.maxFinite,
                constraints: const BoxConstraints.expand(height: 48),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFB6580),
                      Color(0xFFF11775),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0B0F32).withOpacity(0.45),
                      offset: const Offset(0, 6),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const Text(
              'OR',
              style: TextStyle(
                color: Color(0xFF5C5E6F),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                constraints: const BoxConstraints.expand(height: 48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0B0F32).withOpacity(0.45),
                      offset: const Offset(0, 6),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.login),
                    SizedBox(width: 6),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                constraints: const BoxConstraints.expand(height: 48),
                decoration: BoxDecoration(
                  color: const Color(0xFF39579A),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0B0F32).withOpacity(0.45),
                      offset: const Offset(0, 6),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Continue with Facebook',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Color(0xFF5C5E6F),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Color(0xFFFB6580),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text:
                        'By signing up you indicate that you have read and agreed to the Patch',
                    style: TextStyle(
                      color: Color(0xFF5C5E6F),
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      TextSpan(
                        text: ' Terms of Service',
                        style: TextStyle(
                          color: Color(0xFFFB6580),
                          fontSize: 8,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
