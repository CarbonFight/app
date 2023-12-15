import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetOptionsCall {
  static Future<ApiCallResponse> call({
    String? category = '',
    String? action = '',
  }) async {
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
      alwaysAllowBody: false,
    );
  }

  static List<String>? options(dynamic response) => (getJsonField(
        response,
        r'''$''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
}

class GetEmissionFactorCall {
  static Future<ApiCallResponse> call({
    String? category = '',
    String? action = '',
    String? option = '',
    List<String>? sideList,
    String? hint = '',
  }) async {
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
      alwaysAllowBody: false,
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

class GetActionsCall {
  static Future<ApiCallResponse> call({
    String? category = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetActions',
      apiUrl: 'https://api.carbonfight.app/v1/actions',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'category': category,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? actions(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
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
