import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String emailbody = '',
    String emailsendername = '',
  }) {
    final body = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "pierre.freund@gmail.com",
          "name": "Pierre Freund"
        }
      ],
      "subject": "Carbonfight APP Notification"
    }
  ],
  "content": [
    {
      "type": "text/plain",
      "value": "${emailbody}"
    }
  ],
  "from": {
    "email": "notifications@carbonfight.app",
    "name": "${emailsendername}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmail',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {
        'emailbody': emailbody,
        'emailsendername': emailsendername,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
