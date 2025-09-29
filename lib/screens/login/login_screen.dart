import 'package:flutter/material.dart';
import 'package:mylekha_cd_app/widgets/Text/text_base_widget.dart';
import 'package:mylekha_cd_app/widgets/Text/title_lg_widget.dart';
import 'package:mylekha_cd_app/widgets/buttons/btn_primary.dart';
import 'package:mylekha_cd_app/widgets/form/custom_text_field.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 420,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Theme.of(context).colorScheme.primaryContainer,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(50, 50, 93, 0.25),
                    blurRadius: 5,
                    spreadRadius: -1,
                    offset: Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    blurRadius: 3,
                    spreadRadius: -1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleLgWidget(text: 'Sign in'),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Icon(Icons.qr_code),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextBaseWidget(text: 'Sign into your account'),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter password .';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // _enteredEmail = value!;
                      },
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Password',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // _enteredEmail = value!;
                      },
                    ),

                    SizedBox(height: 16),
                    BtnPrimary(text: 'Sign In', onPressed: () {}),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.person_outline, size: 25),
                        SizedBox(width: 10),
                        TextBaseWidget(text: 'Create your free account'),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(CupertinoIcons.globe, size: 25),
                        SizedBox(width: 10),
                        TextBaseWidget(text: 'Change language'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
