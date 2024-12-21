import 'package:flutter/material.dart';
import 'package:parth_shah_task_1/dashboard_screen/dashboard_screen.dart';
import 'package:parth_shah_task_1/login_view/login_provider/login_provider.dart';
import 'package:parth_shah_task_1/utils/color.dart';
import 'package:parth_shah_task_1/utils/image.dart';
import 'package:parth_shah_task_1/utils/string.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        buildFooter(),
      ],
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildLogo(),
                  const SizedBox(height: 30),
                  buildBody(context),
                  const SizedBox(height: 30),
                  buildSignUpText(),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 15,
          ),
          Image.asset(
            ImageUtils.login_user_logo,
            height: 60,
          ),
          const SizedBox(height: 15),
          const Text(
            StringUtils.loginTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 5),
          const Text(
            StringUtils.loginSubTitle,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          buildTextField(
            provider: loginProvider,
            label: StringUtils.email,
            hint: StringUtils.hintText3,
            onChanged: loginProvider.setEmail,
          ),
          const SizedBox(height: 16),
          buildTextField(
            provider: loginProvider,
            label: StringUtils.password,
            hint: StringUtils.passwordHintText,
            isPassword: true,
            onChanged: loginProvider.setPassword,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Checkbox(
                      value: loginProvider.keepLoggedIn,
                      onChanged: loginProvider.toggleKeepLoggedIn,
                      activeColor: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    StringUtils.keep_me_login,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                child: Text(
                  StringUtils.forgotPassword,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildSignInButton(loginProvider, context),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget buildLogo() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            ImageUtils.logo,
            height: 25,
          ),
          const SizedBox(width: 8),
          const Text(
            StringUtils.logoText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required String hint,
    bool isPassword = false,
    required LoginProvider provider,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
            obscureText: isPassword ? provider.isObscure : false,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 13),
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              filled: true,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        provider.isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        provider.visibilityPassword();
                      },
                    )
                  : null,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 2, // Thicker border
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 2,
                ),
              ),
            )),
      ],
    );
  }

  Widget buildSignInButton(LoginProvider provider, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
          // provider.signIn(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff104127),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          StringUtils.signIn,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildSignUpText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringUtils.dontAccount,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 5),
        Text(
          StringUtils.signUp,
          style: TextStyle(
              color: ColorUtils.signUpColor,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget buildFooter() {
    return Column(
      children: [
        const Text(
          StringUtils.footer_text,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            footerItem(ImageUtils.privacyImg, StringUtils.privacy),
            const SizedBox(width: 12),
            footerItem(ImageUtils.termsImg, StringUtils.terms),
            const SizedBox(width: 12),
            footerItem(ImageUtils.getHelpImg, StringUtils.get_help),
          ],
        )
      ],
    );
  }

  Widget footerItem(String image, String text) {
    return Row(
      children: [
        Image.asset(image, height: 15),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
