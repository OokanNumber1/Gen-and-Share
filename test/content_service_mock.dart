import 'package:gen_and_share/constants/strings.dart';
import 'package:gen_and_share/model/gemini_response.dart';

class ContentServiceMocks {
  static const nullResponse = GeminiResponseModel(
    isSuccessFul: false,
    errorMessage: AppStrings.generalErrorMessage,
  );
  static const properResponse = GeminiResponseModel(
    isSuccessFul: true,
    data: ["response1", "response2", "response3", "response4"],
  );
  static const emptyResponse = GeminiResponseModel(
    isSuccessFul: true,
    data: [],
  );

  static const errorResponse = GeminiResponseModel(
    isSuccessFul: false,
    errorMessage: AppStrings.errorOccured,
  );

  static const generativeAIExceptionResponse = GeminiResponseModel(
    isSuccessFul: false,
    errorMessage: AppStrings.geminiPolicyError,
  );

  static const properResponseText = "response1\nresponse2\nresponse3\nresponse4";
}
