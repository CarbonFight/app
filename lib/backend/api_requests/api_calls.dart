import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetEmissionFactorCall {
  static Future<ApiCallResponse> call({
    String? category = '',
    String? action = '',
    String? option = '',
    List<String>? sideList,
    String? hint = '',
  }) {
    final side = _serializeList(sideList);

    return ApiManager.instance.makeApiCall(
      callName: 'GetEmissionFactor',
      apiUrl: 'https://api.carbonfight.app/v1/calculations',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'category': category,
        'action': action,
        'option': option,
        'side': side,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic co2e(dynamic response) => getJsonField(
        response,
        r'''$.co2e''',
      );
  static dynamic hint(dynamic response) => getJsonField(
        response,
        r'''$.hint''',
      );
}

class GetOptionsCall {
  static Future<ApiCallResponse> call({
    String? category = '',
    String? action = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetOptions',
      apiUrl: 'https://api.carbonfight.app/v1/options',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'category': category,
        'action': action,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic options(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
