import 'package:flutter/material.dart';
import 'package:gen_and_share/constants/strings.dart';
import 'package:gen_and_share/page/generate_content_page.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.info_outline,
              size: 32,
            ),
            const SizedBox(height: 32),
            Text(
              "Here's a quick tip to get you started",
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
             Text(
                AppStrings.howToUseTheApp,
                style: textTheme.bodyLarge?.copyWith(height: 2.2),
                ),
            const SizedBox(height: 32),

            const SizedBox(height: 12),
            Text(
              "The following content types are blocked \nbecause of Gemini's policy",
              
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text(
              "- Harassment\n- Hate\n- Sexually Explicit\n- Dangerous",
              style: textTheme.bodyMedium?.copyWith(height: 2.2),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GenerateContentPage(),
                  ),
                );
              },
              child: const Text("Let's go !!!"),
            )
          ],
        ),
      )),
    );
  }
}
