import 'dart:io';

import 'package:gen_and_share/constants/strings.dart';
import 'package:gen_and_share/model/gemini_response.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ContentService {
  final apiKey = const String.fromEnvironment(AppStrings.apiKey);

  Future<GeminiResponseModel> generateContent({
    required String aspect,
    String? personalisedFor,
  }) async {
    final prompt = AppStrings.getPrompt(
      aspect,
      personalisedFor: personalisedFor,
    );
    final model = GenerativeModel(
      model: AppStrings.geminiProModel,
      apiKey: apiKey,
    );

    final content = [Content.text(prompt)];

    try {
      final response = await model.generateContent(content);

      if (response.text == null) {
        return const GeminiResponseModel(
          isSuccessFul: false,
          errorMessage: AppStrings.generalErrorMessage,
        );
      }
      final responseList = response.text!.split("\n").toList();
      responseList.removeWhere((element)=>element.isEmpty);
      return GeminiResponseModel(isSuccessFul: true, data: responseList);
    } on SocketException {
      return const GeminiResponseModel(
        isSuccessFul: false,
        errorMessage: AppStrings.noInternetMessage,
      );
    } on GenerativeAIException {
      return const GeminiResponseModel(
        isSuccessFul: false,
        errorMessage: AppStrings.geminiPolicyError,
      );
    } catch (e) {
      return GeminiResponseModel(
        isSuccessFul: false,
        errorMessage: e.toString(),
      );
    }
  }
}
