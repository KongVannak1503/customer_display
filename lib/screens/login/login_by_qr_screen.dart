import 'package:flutter/material.dart';
import 'package:mylekha_cd_app/screens/routes/route_names.dart';
import 'package:mylekha_cd_app/widgets/Text/text_base_widget.dart';
import 'package:mylekha_cd_app/widgets/Text/title_lg_widget.dart';
import 'package:mylekha_cd_app/widgets/buttons/btn_primary.dart';
import 'package:mylekha_cd_app/widgets/form/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:mylekha_cd_app/widgets/popup/create_new_account_popup_widget.dart';
import 'package:go_router/go_router.dart';

class LoginByQrScreen extends StatelessWidget {
  const LoginByQrScreen({super.key});

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
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              GoRouter.of(context).go(RouteNames.LOGIN_PATH);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.qr_code, size: 28),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextBaseWidget(text: 'Scan to login'),
                    SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.qr_code_2, size: 220)],
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
