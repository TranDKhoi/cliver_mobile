import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/localization_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcometocliver".tr),
            ElevatedButton(
              onPressed: () async {
                languageDialog(context);
              },
              child: const Text("Language"),
            ),
          ],
        ),
      ),
    );
  }

  ////////////////////

  final List languages = [
    {'name': 'English(US)', 'languageCode': 'en'},
    {'name': 'Tiếng Việt', 'languageCode': 'vi'},
  ];

  languageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text("Change language".tr),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(languages[index]['name']),
                        onTap: () {
                          //Dùng hàm này tiện hơn
                          LocalizationService.changeLocale(
                              languages[index]['languageCode']);
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.grey,
                    );
                  },
                  itemCount: languages.length),
            ),
          );
        });
  }
}
