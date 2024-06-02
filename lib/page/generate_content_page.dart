import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gen_and_share/constants/colors.dart';
import 'package:gen_and_share/constants/strings.dart';
import 'package:gen_and_share/page/widgets/content_card.dart';
import 'package:gen_and_share/service/content_service.dart';

class GenerateContentPage extends StatefulWidget {
  const GenerateContentPage({super.key});

  @override
  State<GenerateContentPage> createState() => _GenerateContentPageState();
}

class _GenerateContentPageState extends State<GenerateContentPage> {
  List<String> contentList = [];
  bool isRequesting = false;
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final aspectKey = GlobalKey<FormState>();
  String errorMessage = "";

  final personalisedController = TextEditingController();
  final aspectController = TextEditingController();

  void showErrorSnackbar(String message) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    scaffoldMessenger.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    personalisedController.dispose();
    aspectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              Form(
                key: aspectKey,
                child: TextFormField(
                  readOnly: isRequesting,
                  style: TextStyle(color: AppColors.text.withAlpha(244)),
                  decoration: const InputDecoration(hintText: "Aspect"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field can not be empty";
                    }
                    return null;
                  },
                  controller: aspectController,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                readOnly: isRequesting,
                style: const TextStyle(color: AppColors.text),
                decoration: const InputDecoration(hintText: "Personalised for"),
                controller: personalisedController,
              ),
              const SizedBox(height: 32),
              Visibility(
                visible: !isRequesting,
                child: ElevatedButton(
                  onPressed: () async {
                    if (aspectKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        isRequesting = true;
                      });
                      final aspectText = aspectController.text;
                      final personalisedText = personalisedController.text;

                      final response = await ContentService().generateContent(
                        aspect: aspectText,
                        personalisedFor: personalisedText,
                      );

                      if (!response.isSuccessFul) {
                        errorMessage =
                            response.errorMessage ?? AppStrings.errorOccured;
                        contentList = [];
                        showErrorSnackbar(errorMessage);
                      } else {
                        contentList = response.data ?? [];
                      }
                      setState(() {
                        isRequesting = false;
                      });
                    }
                  },
                  child: const Text("Generate"),
                ),
              ),
              Visibility(
                visible: isRequesting,
                child: const Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: SpinKitSpinningLines(color: Colors.grey),
                ),
              ),
              contentList.isEmpty || isRequesting
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Column(
                        children: List.generate(
                          contentList.length,
                          (index) => contentList[index].isNotEmpty
                              ? ContentCard(content: contentList[index])
                              : const SizedBox(),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
