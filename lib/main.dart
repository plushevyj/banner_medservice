import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appId = '1447371409';
    final url = Uri.parse('https://apps.apple.com/app/id$appId');
    return CupertinoPageScaffold(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/install_picture.svg'),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Уважаемый клиент!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Для комфортного использования ДМС скачайте, пожалуйста, новую версию приложения.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: CupertinoColors.systemGrey),
                  ),
                  CupertinoButton(
                    color: const Color(0xFF407BFF),
                    onPressed: () {
                      launchUrl(url,
                          mode: Platform.isIOS
                              ? LaunchMode.externalApplication
                              : LaunchMode.inAppWebView);
                    },
                    child: const Text(
                      'Обновить',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
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
