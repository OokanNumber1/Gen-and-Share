// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:gen_and_share/constants/strings.dart';
import 'package:gen_and_share/model/gemini_response.dart';
import 'package:gen_and_share/service/content_service.dart';
import 'package:mocktail/mocktail.dart';

import 'content_service_mock.dart';

class MockContentService extends Mock implements ContentService {}

void main() {
  late MockContentService mockContentService;
  setUp(() {
    mockContentService = MockContentService();
  });

  test('returns list of response when data is a valid response', () async {
    when(() => mockContentService.generateContent(aspect: "aspect")).thenAnswer(
      (invocation) async {
        const data = ContentServiceMocks.properResponseText;
        final dataList = data.split("\n").toList();
        dataList.removeWhere((element) => element.isEmpty);
        return GeminiResponseModel(isSuccessFul: true, data: dataList);
      },
    );

    final response = await mockContentService.generateContent(aspect: "aspect");
    expect(
      response,
      ContentServiceMocks.properResponse,
    );
  });

  test("returns empty response when data is empty", () async {
    when(() => mockContentService.generateContent(aspect: "aspect")).thenAnswer(
      (invocation) async {
        const data = "";

        final dataList = data.split("\n").toList();
        dataList.removeWhere((element) => element.isEmpty);

        return GeminiResponseModel(isSuccessFul: true, data: dataList);
      },
    );

    final response = await mockContentService.generateContent(aspect: "aspect");
    expect(
      response,
      ContentServiceMocks.emptyResponse,
    );
  });

  test("returns null response when data is null", () async {
    when(() => mockContentService.generateContent(aspect: "aspect")).thenAnswer(
      (invocation) async {
        const String? data = null;

        final dataList = data?.split("\n").toList() ?? [];
        dataList.removeWhere((element) => element.isEmpty);

        return const GeminiResponseModel(
            isSuccessFul: false, errorMessage: AppStrings.generalErrorMessage);
      },
    );

    final response = await mockContentService.generateContent(aspect: "aspect");
    expect(
      response,
      ContentServiceMocks.nullResponse,
    );
  });

}
