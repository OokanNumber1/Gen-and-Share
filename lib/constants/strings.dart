class AppStrings {
  static const apiKey = "API_KEY";
  static const geminiProModel = "gemini-pro";
  static String getPrompt(String aspect, {String? personalisedFor}) =>
      "List 6 (with no empty string) random short messages about $aspect (without formatting, indexing, bulleting and numbering but separated with new line), with three sentences ${personalisedFor != null ? "personalised for $personalisedFor" : " for everybody"} ";

  static const noInternetMessage = "Kindly check your internet connection";
  static const generalErrorMessage =
      "Unable to complete your request, Try again.";
  static const errorOccured = "Error occured";
  static const geminiPolicyError =
      "This isn't allowed because of Gemini's policy.";

  static const howToUseTheApp =
      "- Tell us the aspect you want to generate about. \n- Input the name you want it personalised to. \n- Send Gemini on an errand of getting the text.\n- Share from the generated text to other apps.";
}
