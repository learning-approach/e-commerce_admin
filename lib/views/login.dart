import 'package:ecommerce_admin/const/colors.dart';
import 'package:ecommerce_admin/views/navigation_rail_controller.dart';
import 'package:ecommerce_admin/widgets/custom_button.dart';
import 'package:ecommerce_admin/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 400,
          decoration: BoxDecoration(
              border: Border.all(
                width: 5,
                color: AppColors.mandarinColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  width: 50,
                ),
                Divider(),
                customFormField(TextInputType.emailAddress, _email, context,
                    'admin email', (val) {},
                    prefixIcon: Icons.email_outlined),
                customFormField(TextInputType.emailAddress, _pass, context,
                    'admin password', (val) {},
                    obscureText: true,
                    prefixIcon: Icons.remove_red_eye_outlined),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 250,
                  child: customButton(
                    'Continue',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => NavigationRailController()),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
