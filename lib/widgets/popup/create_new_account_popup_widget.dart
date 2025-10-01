import 'package:flutter/material.dart';
import 'package:mylekha_cd_app/widgets/Text/text_base_widget.dart';
import 'package:mylekha_cd_app/widgets/Text/title_lg_widget.dart';
import 'package:mylekha_cd_app/widgets/buttons/store_icon_button.dart';

class CreateNewAccountPopupWidget {
  static Future<void> showCreateAccountPopup(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController usernameCtrl = TextEditingController();
    final TextEditingController emailCtrl = TextEditingController();
    final TextEditingController passwordCtrl = TextEditingController();

    return showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: TitleLgWidget(text: 'Create your free account'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 500,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        TextBaseWidget(
                          text:
                              "Please download and use MyLekha Dashboard to create an account for free",
                        ),
                        SizedBox(height: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextBaseWidget(text: 'Choose platform'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                StoreIconButton(
                                  icon: Icons.apple,
                                  url: "https://www.apple.com/app-store/",
                                ),

                                StoreIconButton(
                                  icon: Icons.android,
                                  url: "https://play.google.com/store",
                                ),

                                StoreIconButton(
                                  icon: Icons.window,
                                  url: "https://apps.microsoft.com/",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
