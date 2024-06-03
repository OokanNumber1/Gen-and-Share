// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';


class GeminiResponseModel {
  const GeminiResponseModel({
    required this.isSuccessFul,
    this.data,
    this.errorMessage,
  });
  final bool isSuccessFul;
  final List<String>? data;
  final String? errorMessage;

  @override
  bool operator ==(covariant GeminiResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.isSuccessFul == isSuccessFul &&
      listEquals(other.data, data) &&
      other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => isSuccessFul.hashCode ^ data.hashCode ^ errorMessage.hashCode;
}
