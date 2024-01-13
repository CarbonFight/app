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
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

  static int? co2e(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.co2e''',
      ));
  static String? hint(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hint''',
      ));
  static String? option(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.option''',
      ));
  static dynamic amortization(dynamic response) => getJsonField(
        response,
        r'''$.amortization''',
      );
  static dynamic unit(dynamic response) => getJsonField(
        response,
        r'''$.unit''',
      );
  static String? category(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.category''',
      ));
  static String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.action''',
      ));
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
