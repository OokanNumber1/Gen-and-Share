
class GeminiResponseModel {
  const GeminiResponseModel({
    required this.isSuccessFul,
    this.data,
    this.errorMessage,
  });
  final bool isSuccessFul;
  final List<String>? data;
  final String? errorMessage;
}
